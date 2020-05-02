import 'package:provider/provider.dart';

import 'package:app/core/services/auth/http_auth_service.dart';
import './core/services/http_service.dart';
import './core/view_models/activity/activity_viewmodel.dart';
import './core/view_models/challenges/challenge_viewmodel.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  ChangeNotifierProvider.value(
    value: Auth(),
  )
];

List<SingleChildCloneableWidget> dependentServices = [
  ChangeNotifierProxyProvider<Auth, ChallengeViewModel>(
    create: (ctx) => ChallengeViewModel(ctx),
    update: (ctx, auth, previousInstance) => previousInstance
      ..update(
        auth.token,
        auth.userId,
        previousInstance == null ? [] : previousInstance.challanges,
      ),
    // update: (ctx, auth, previuosInstance) => ActivityViewModel(
    //   auth.token,
    //   auth.userId,
    //   previuosInstance == null ? [] : previuosInstance.actions,
    // ),
  ),
  ChangeNotifierProxyProvider<Auth, ActivityViewModel>(
    create: (ctx) => ActivityViewModel(),
    update: (ctx, auth, previuosInstance) => previuosInstance
      ..update(
        auth.token,
        previuosInstance == null ? [] : previuosInstance.actions,
      ),
  ),
  ProxyProvider<Auth, HttpService>(
    create: (ctx) => HttpService(),
    update: (ctx, auth, previuosInstance) => previuosInstance
      ..update(
        auth.token,
        auth.userId,
      ),
  ),
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  // StreamProvider<User>(
  //   builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
  // )
];
