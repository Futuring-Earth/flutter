import 'dart:convert';

import 'package:app/models/base-model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class HttpService<T extends BaseModel> with ChangeNotifier {
  List<T> _items = [];

  List<T> get items {
    return [..._items];
  }

  T findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> fetchAndSetItems(String label) async {
    final url = 'https://test-f0d3f.firebaseio.com/$label.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<T> loadedItems = [];
      T item;
      extractedData.forEach((itemId, itemData) {
        loadedItems.add(item.fromJson(itemData));
      });
      _items = loadedItems;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addItem(T item, String label) async {
    final url = 'https://test-f0d3f.firebaseio.com/$label.json';
    try {
      final response = await http.post(url, body: json.encode(item.toJson()));

      //final T newItem = T.copy(item);
      _items.add(item);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateItem(String id, T newItem, String label) async {
    final itemIndex = _items.indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      final url = 'https://test-f0d3f.firebaseio.com/$label/$id.json';
      await http.patch(url, body: json.encode(newItem.toJson()));
      _items[itemIndex] = newItem;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteItem(String id, String label) async {
    final url = 'https://test-f0d3f.firebaseio.com/$label/$id.json';
    final existingItemIndex = _items.indexWhere((item) => item.id == id);
    var existingItem = _items[existingItemIndex];
    _items.removeAt(existingItemIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingItemIndex, existingItem);
      notifyListeners();
      throw HttpException('Could not delete Item.');
    }
    existingItem = null;
  }
}
