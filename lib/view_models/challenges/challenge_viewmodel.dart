import 'package:flutter/foundation.dart';

import '../../models/challenge.dart';
import '../../services/challenge_graph_service.dart' as dbService;

class ChallengeViewModel with ChangeNotifier {
  String _authToken;
  // String _userId;
  List<Challenge> _challenges = [];
  List<Challenge> get challanges {
    return [..._challenges];
  }

  // ChallengeViewModel({this.authToken, this.userId, this.challenges});
  ChallengeViewModel();

  void update(String authToken, String userId, List<Challenge> challanges) {
    this._authToken = authToken;
    // this._userId = userId;
    this._challenges = challanges;
  }

  Challenge findById(String id) {
    return _challenges.firstWhere((item) => item.id == id);
  }

  Future<Challenge> addChallenge(Challenge challenge) async {
    try {
      _challenges.add(challenge);
      notifyListeners();
      return dbService.ChallengeGraphService.addChallenge(
          challenge, _authToken);
    } catch (error) {
      final addedItemIndex =
          _challenges.indexWhere((item) => item.id == challenge.id);
      _challenges.removeAt(addedItemIndex);
      notifyListeners();
      throw Exception(error);
    }
  }

  Future<void> fetchAndSetChallenges([bool filterByUser = false]) async {
    _challenges = await dbService.ChallengeGraphService.fetchChallenges(
        filterByUser: filterByUser, authToken: _authToken);
    notifyListeners();
  }

  Future<void> deleteChallenge(String id) async {
    final existingItemIndex = _challenges.indexWhere((item) => item.id == id);
    var existingChallange = _challenges[existingItemIndex];
    try {
      _challenges.removeAt(existingItemIndex);
      notifyListeners();
      await dbService.ChallengeGraphService.deleteItem(id, _authToken);
    } catch (error) {
      _challenges.insert(existingItemIndex, existingChallange);
      notifyListeners();
      throw Exception(error);
    }
    existingChallange = null;
  }

  Future<bool> updateChallenge(Challenge udpatedChallenge) async {
    final itemIndex =
        _challenges.indexWhere((item) => item.id == udpatedChallenge.id);
    if (itemIndex >= 0) {
      _challenges[itemIndex] = udpatedChallenge;
      notifyListeners();
      return dbService.ChallengeGraphService.updateChallenges(
          udpatedChallenge, _authToken);
    } else {
      return false;
    }
  }
}
