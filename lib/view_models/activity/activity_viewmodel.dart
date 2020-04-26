import 'package:flutter/foundation.dart';

import '../../models/action.dart';
import '../../services/action_graph_service.dart' as dbService;

class ActivityViewModel with ChangeNotifier {
  String _authToken;
  List<Action> _actions = [];
  List<Action> get actions {
    return [..._actions];
  }

  ActivityViewModel();

  void update(String authToken, List<Action> actions) {
    this._authToken = authToken;
    this._actions = actions;
  }

  Action findById(String id) {
    return _actions.firstWhere((item) => item.id == id);
  }

  Future<void> fetchAndSetActions() async {
    _actions = await dbService.ActionGraphService.fetchActions(_authToken);
    notifyListeners();
  }

  Future<bool> updateAction(Action udpatedAction) async {
    final itemIndex =
        _actions.indexWhere((item) => item.id == udpatedAction.id);
    if (itemIndex >= 0) {
      _actions[itemIndex] = udpatedAction;
      notifyListeners();
      return dbService.ActionGraphService.updateActions(
          udpatedAction, _authToken);
    } else {
      return false;
    }
  }
}
