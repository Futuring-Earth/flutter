import 'package:flutter/foundation.dart';

import '../../models/action.dart';
// import '../../services/action_graph_service.dart' as dbService;

class ActivityViewModel with ChangeNotifier {
  // String _authToken;
  List<Action> _actions = [];
  List<Action> get actions {
    return [..._actions];
  }

  ActivityViewModel();

  void update(String authToken, List<Action> actions) {
    // this._authToken = authToken;
    this._actions = actions;
  }
}
