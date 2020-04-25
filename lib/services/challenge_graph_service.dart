import 'package:app/models/challenge.dart';
import 'http_service.dart' as server;

class ChallengeGraphService {
  static const _tableName = 'challenges';

  static Future<List<Challenge>> fetchChallenges() async {
    try {
      return server.HttpService.fetch<Challenge>(_tableName);
    } catch (error) {
      throw (error);
    }
  }

  static Future<Challenge> addChallenge(Challenge challenge) async {
    try {
      return server.HttpService.addItem<Challenge>(challenge, _tableName);
    } catch (error) {
      throw (error);
    }
  }

  static Future<bool> updateChallenges(Challenge udpatedChallenge) async {
    try {
      return server.HttpService.updateItem<Challenge>(
          udpatedChallenge, _tableName);
    } catch (error) {
      throw (error);
    }
  }

  static Future<void> deleteItem(String id) async {
    await server.HttpService.deleteItem(id, _tableName);
  }
}
