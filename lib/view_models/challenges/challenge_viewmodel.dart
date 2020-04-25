import 'package:flutter/foundation.dart';

import '../../models/challenge.dart';
import '../../services/challenge_graph_service.dart' as dbService;

class ChallengeViewModel with ChangeNotifier {
  Future<void> initialize() async {
    //TODO: load the initial data and default settings
  }

  final String authToken;
  final String userId;
  List<Challenge> _challanges = [];
  List<Challenge> get challanges {
    return [..._challanges];
  }

  ChallengeViewModel(this.authToken, this.userId, this._challanges);

  Challenge findById(String id) {
    return _challanges.firstWhere((item) => item.id == id);
  }

  Future<Challenge> addChallenge(Challenge challenge) async {
    return dbService.ChallengeGraphService.addChallenge(challenge);
  }

  Future<void> fetchAndSetChallenges() async {
    _challanges = await dbService.ChallengeGraphService.fetchChallenges();
    notifyListeners();
  }

  Future<bool> updateChallenge(Challenge udpatedChallenge) async {
    final itemIndex =
        _challanges.indexWhere((item) => item.id == udpatedChallenge.id);
    if (itemIndex >= 0) {
      _challanges[itemIndex] = udpatedChallenge;
      notifyListeners();
      return dbService.ChallengeGraphService.updateChallenges(udpatedChallenge);
    } else {
      return false;
    }
  }
}
