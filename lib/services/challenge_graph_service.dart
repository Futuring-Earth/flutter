import '../locator.dart';

import 'package:app/models/challenge.dart';
import 'database_service.dart';
import './http_service.dart';

class ChallengeGraphService {
  final _tableName = 'challenges';
  final ctx;
  DatabaseService _dbService;

  ChallengeGraphService(this.ctx) {
    _dbService = locator<HttpService>();
  }

  void update(DatabaseService dbService) {
    this._dbService = dbService;
  }

  Future<List<Challenge>> fetchChallenges(
      {bool filterByUser = false, String userId = ''}) async {
    try {
      return _dbService.fetch<Challenge>(
          tableName: _tableName,
          filterByUser: filterByUser,
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

  Future<Challenge> addChallenge(Challenge challenge) async {
    try {
      return _dbService.addItem<Challenge>(
          challenge, _tableName, (json) => new Challenge.fromJson(json));
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> updateChallenges(
      Challenge udpatedChallenge, String authToken) async {
    try {
      return _dbService.updateItem<Challenge>(udpatedChallenge, _tableName);
    } catch (error) {
      throw (error);
    }
  }

  Future<void> deleteItem(String id, String authToken) async {
    try {
      await _dbService.deleteItem(id, _tableName, _tableName);
    } catch (error) {
      throw (error);
    }
  }
}
