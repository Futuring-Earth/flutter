import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/base-model.dart';
import '../models/http_exception.dart';

class HttpService {
  static Future<List<T>> fetch<T extends BaseModel>(String tableName) async {
    try {
      final List<T> loadedItems = [];
      final url = 'https://test-f0d3f.firebaseio.com/$tableName.json';
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return loadedItems;
      }
      T item;
      extractedData.forEach((itemId, itemData) {
        // TODO: create a new instance of T every time it loops
        loadedItems.add(item.fromJson(itemData));
      });

      return loadedItems;
    } catch (error) {
      throw throw HttpException(error);
    }
  }

  static Future<dynamic> addItem<T extends BaseModel>(
      T item, String tableName) async {
    final url = 'https://test-f0d3f.firebaseio.com/$tableName.json';
    try {
      return http.post(url, body: json.encode(item.toJson()));
    } catch (error) {
      throw throw HttpException(error);
    }
  }

  static Future<bool> updateItem<T extends BaseModel>(
      T newItem, String tableName) async {
    try {
      final url =
          'https://test-f0d3f.firebaseio.com/$tableName/${newItem.id}}.json';
      var response = await http.patch(url, body: json.encode(newItem.toJson()));
      if (response.statusCode >= 400)
        return false;
      else
        return true;
    } catch (error) {
      throw throw HttpException(error);
    }
  }

  static Future<void> deleteItem(String id, String label) async {
    //TODO: Implement
  }
}
