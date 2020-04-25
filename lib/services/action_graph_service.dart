import 'package:app/models/action.dart';
import 'http_service.dart' as server;

class ActionGraphService {
  static const tableName = 'actions';
  static Future<List<Action>> fetchActions() async {
    try {
      return server.HttpService.fetch<Action>(tableName);
    } catch (error) {
      throw (error);
    }
  }

  static Future<bool> updateActions(Action udpatedAction) async {
    try {
      return server.HttpService.updateItem<Action>(udpatedAction, tableName);
    } catch (error) {
      throw (error);
    }
  }

  static Future<void> deleteItem(String id) async {
    await server.HttpService.deleteItem(id, tableName);
  }
}
