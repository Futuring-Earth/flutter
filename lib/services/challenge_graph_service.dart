import 'package:app/models/challenge.dart';
import 'http_service.dart' as server;

class ChallengeGraphService {
  static const _tableName = 'challenges';

  static Future<List<Challenge>> fetchChallenges(
      {String authToken, bool filterByUser = false, String userId = ''}) async {
    try {
      return server.HttpService.fetch<Challenge>(
          tableName: _tableName,
          filterByUser: filterByUser,
          userId: userId,
          authToken: authToken,
          creator: (json) => new Challenge.fromJson(json));
    } catch (error) {
      throw (error);
    }
  }

  // static Future<List<Challenge>> fetchChallengesByUser(
  //     String userId, String authToken) async {
  //   try {
  //     final List<Challenge> itemsByUser = await fetchChallenges(true, userId);

  //     if (itemsByUser == null) {
  //       return itemsByUser;
  //     }

  //     final List<Challenge> loadedChallenges = await fetchChallenges();

  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  static Future<Challenge> addChallenge(
      Challenge challenge, String authToken) async {
    try {
      return server.HttpService.addItem<Challenge>(challenge, _tableName,
          authToken, (json) => new Challenge.fromJson(json));
    } catch (error) {
      throw (error);
    }
  }

  static Future<bool> updateChallenges(
      Challenge udpatedChallenge, String authToken) async {
    try {
      return server.HttpService.updateItem<Challenge>(
          udpatedChallenge, _tableName, authToken);
    } catch (error) {
      throw (error);
    }
  }

  static Future<void> deleteItem(String id, String authToken) async {
    try {
      await server.HttpService.deleteItem(
          id, _tableName, authToken, _tableName);
    } catch (error) {
      throw (error);
    }
  }
}
