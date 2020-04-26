import 'package:app/models/action.dart';
import 'http_service.dart' as server;

class ActionGraphService {
  static const tableName = 'actions';
  static Future<List<Action>> fetchActions(String authToken) async {
    try {
      return server.HttpService.fetch<Action>(
          tableName: tableName,
          authToken: authToken,
          creator: (json) => new Action.fromJson(json));
    } catch (error) {
      throw (error);
    }
  }

  static Future<bool> updateActions(
      Action udpatedAction, String authToken) async {
    try {
      return server.HttpService.updateItem<Action>(
          udpatedAction, tableName, authToken);
    } catch (error) {
      throw (error);
    }
  }

  static Future<void> deleteItem(String id, String authToken) async {
    await server.HttpService.deleteItem(id, tableName, authToken, tableName);
  }
}
