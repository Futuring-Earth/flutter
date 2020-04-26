import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/base-model.dart';
import '../models/http_exception.dart';

//Used as a paramater in the functions so the parent function (who
//knows the variable type) can pass the constructor to the variable.
//This is necessary because dart handles generics a bit
//different and it's not possible to declare a new generic variable
// by just using 'new T()'
typedef S ItemCreator<S>(Map<String, dynamic> values);

class HttpService {
  static Future<List<T>> fetch<T extends BaseModel>({
    @required String tableName,
    @required String authToken,
    @required ItemCreator<T> creator,
    bool filterByUser = false,
    String userId = '',
  }) async {
    try {
      final List<T> loadedItems = [];
      final filterString =
          filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
      final url =
          'https://test-f0d3f.firebaseio.com/$tableName.json?auth=$authToken&$filterString';
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

  static Future<T> addItem<T extends BaseModel>(T item, String tableName,
      String authToken, ItemCreator<T> creator) async {
    try {
      final url =
          'https://test-f0d3f.firebaseio.com/$tableName.json?auth=$authToken';
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

  static Future<bool> updateItem<T extends BaseModel>(
      T newItem, String tableName, String authToken) async {
    try {
      final url =
          'https://test-f0d3f.firebaseio.com/$tableName/${newItem.id}}.json?auth=$authToken';
      var response = await http.patch(url, body: json.encode(newItem.toJson()));
      if (response.statusCode >= 400)
        return false;
      else
        return true;
    } catch (error) {
      throw throw HttpException(error);
    }
  }

  static Future<void> deleteItem(
      String id, String label, String authToken, String tableName) async {
    final url =
        'https://test-f0d3f.firebaseio.com/$tableName/$id.json?auth=$authToken';
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      throw HttpException('Could not delete product.');
    }
  }
}
