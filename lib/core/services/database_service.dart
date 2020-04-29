import 'package:flutter/foundation.dart';

import 'package:app/core/models/base-model.dart';
import 'package:app/helpers/item_creator.dart';

abstract class DatabaseService {
  Future<List<T>> fetch<T extends BaseModel>(
      {@required String tableName,
      @required ItemCreator<T> creator,
      bool filterByUser = false});

  Future<T> addItem<T extends BaseModel>(
      T item, String tableName, ItemCreator<T> creator);

  Future<bool> updateItem<T extends BaseModel>(T newItem, String tableName);

  Future<void> deleteItem(String id, String label, String tableName);
}
