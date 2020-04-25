import 'package:flutter/foundation.dart';

import '../../models/action.dart';
import '../../services/action_graph_service.dart' as dbService;

class ActivityViewModel with ChangeNotifier {
  Future<void> initialize() async {
    //TODO: load the initial data and default settings
  }

  final String authToken;
  final String userId;
  List<Action> _actions = [];
  List<Action> get actions {
    return [..._actions];
  }

  ActivityViewModel(this.authToken, this.userId, this._actions);

  Action findById(String id) {
    return _actions.firstWhere((item) => item.id == id);
  }

  Future<void> fetchAndSetActions() async {
    _actions = await dbService.ActionGraphService.fetchActions();
    notifyListeners();
  }

  Future<bool> updateAction(Action udpatedAction) async {
    final itemIndex =
        _actions.indexWhere((item) => item.id == udpatedAction.id);
    if (itemIndex >= 0) {
      _actions[itemIndex] = udpatedAction;
      notifyListeners();
      return dbService.ActionGraphService.updateActions(udpatedAction);
    } else {
      return false;
    }
  }
}
