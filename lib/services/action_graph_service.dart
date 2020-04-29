import 'package:app/models/action.dart';
import 'database_service.dart';

class ActionGraphService {
  static const tableName = 'actions';
  DatabaseService _dbService;

  ActionGraphService();

  void update(DatabaseService dbService) {
    this._dbService = dbService;
  }

  Future<List<Action>> fetchActions(String authToken) async {
    try {
      return _dbService.fetch<Action>(
          tableName: tableName, creator: (json) => new Action.fromJson(json));
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> updateActions(Action udpatedAction, String authToken) async {
    try {
      return _dbService.updateItem<Action>(udpatedAction, tableName);
    } catch (error) {
      throw (error);
    }
  }

  Future<void> deleteItem(String id, String authToken) async {
    await _dbService.deleteItem(id, tableName, tableName);
  }
}
