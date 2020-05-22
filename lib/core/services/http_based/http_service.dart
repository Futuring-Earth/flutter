import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../models/base-model.dart';
import '../../models/http_exception.dart';
import './database_service.dart';
import 'package:app/helpers/item_creator.dart';

@lazySingleton
class HttpService implements DatabaseService {
  String _userId;
  String _authToken;

  HttpService();

  void update(String authToken, String userId) {
    this._authToken = authToken;
    this._userId = userId;
  }

  @override
  Future<List<T>> fetch<T extends BaseModel>(
      {@required String tableName,
      @required ItemCreator<T> creator,
      bool filterByUser = false}) async {
    try {
      final List<T> loadedItems = [];
      final filterString =
          filterByUser ? 'orderBy="creatorId"&equalTo="${this._userId}"' : '';
      final url =
          'https://sharedkarma.firebaseio.com/$tableName.json?auth=${this._authToken}&$filterString';
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return loadedItems;
      }
      T item;
      extractedData.forEach((itemId, itemData) {
        (itemData as Map<String, dynamic>).putIfAbsent('id', () => itemId);
        (itemData as Map<String, dynamic>).putIfAbsent('label', () => 'unkown');
        //creator does a call back to the prior function. The prior function knows the
        //type of T and therefore can call the constructor whithout using generics
        item = creator(itemData);
        loadedItems.add(item);
      });

      return loadedItems;
    } catch (error) {
      throw throw HttpException(error);
    }
  }

  @override
  Future<T> addItem<T extends BaseModel>(
      T item, String tableName, ItemCreator<T> creator) async {
    try {
      final url =
          'https://sharedkarma.firebaseio.com/$tableName.json?auth=${this._authToken}';
      final response = await http.post(url, body: json.encode(item.toJson()));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) {
        return null;
      }

      final newItem = item.toJson();
      newItem.update('id', (_) => extractedData['name']);
      T result = creator(newItem);
      return result;
    } catch (error) {
      throw throw HttpException(error);
    }
  }

  @override
  Future<bool> updateItem<T extends BaseModel>(
      T newItem, String tableName) async {
    try {
      final url =
          'https://sharedkarma.firebaseio.com/$tableName/${newItem.id}}.json?auth=${this._authToken}';
      var response = await http.patch(url, body: json.encode(newItem.toJson()));
      if (response.statusCode >= 400)
        return false;
      else
        return true;
    } catch (error) {
      throw throw HttpException(error);
    }
  }

  @override
  Future<void> deleteItem(String id, String label, String tableName) async {
    final url =
        'https://sharedkarma.firebaseio.com/$tableName/$id.json?auth=${this._authToken}';
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      throw HttpException('Could not delete product.');
    }
  }
}
