import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'package:app/core/services/auth/http_auth_service.dart';
import 'package:app/core/services/image_picker_service.dart';
// import 'package:app/core/services/auth/auth_service_interface.dart';
// import 'package:app/core/services/auth/firebase_auth_service.dart';

import './core/services/http_based/http_service.dart';

import './core/view_models/activity/activity_viewmodel.dart';
import './core/view_models/challenges/challenge_viewmodel.dart';

// import 'package:app/core/services/auth/apple_sign_in_available.dart';
import 'package:app/core/services/auth/auth_service.dart';
import 'package:app/core/services/auth/auth_service_adapter.dart';
import 'package:app/core/services/auth/firebase_email_link_handler.dart';
import 'package:app/core/services/auth/email_secure_store.dart';

class InitialProviderSetup {
  InitialProviderSetup({this.initialAuthServiceType = AuthServiceType.firebase
      // ,this.appleSignInAvailable
      });
  final AuthServiceType initialAuthServiceType;
  // final AppleSignInAvailable appleSignInAvailable;

  List<SingleChildCloneableWidget> get providers {
    return [
      ...independentServices,
      ...dependentServices,
      ...uiConsumableProviders
    ];
  }

  List<SingleChildCloneableWidget> get independentServices {
    return [
      ChangeNotifierProvider.value(
        value: Auth(),
      ),
      Provider<ImagePickerService>(
        create: (_) => ImagePickerService(),
      ),
      // Provider<AppleSignInAvailable>.value(value: appleSignInAvailable),
      Provider<AuthService>(
        create: (_) => AuthServiceAdapter(
          initialAuthServiceType: initialAuthServiceType,
        ),
        dispose: (_, AuthService authService) => authService.dispose(),
      ),
      Provider<EmailSecureStore>(
        create: (_) => EmailSecureStore(
          flutterSecureStorage: FlutterSecureStorage(),
        ),
      ),
      // Provider<UserHandler>(
      //   create: (ctx) {
      //     User user;
      //     Provider.of<AuthService>(ctx, listen: true).onAuthStateChanged.first.then((value) => user = value);
      //     return UserHandler.create(currentUser: user);
      //   },
      // ),
    ];
  }

  List<SingleChildCloneableWidget> get dependentServices {
    return [
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
      ProxyProvider2<AuthService, EmailSecureStore, FirebaseEmailLinkHandler>(
        update: (_, AuthService authService, EmailSecureStore storage, __) =>
            FirebaseEmailLinkHandler.createAndConfigure(
          auth: authService,
          userCredentialsStorage: storage,
        ),
        dispose: (_, linkHandler) => linkHandler.dispose(),
      ),
      // ProxyProvider<AuthService, UserHandler>(
      //   update: (ctx, auth, previuosInstance) { User currentUser2;
      //    auth.currentUser().then((value) => currentUser2 = value);
      //    return UserHandler
      //             .create(currentUser: currentUser2);
      //   },
      // ),
    ];
  }

  List<SingleChildCloneableWidget> get uiConsumableProviders {
    return [
      // StreamProvider<User>(
      //   builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
      // )
    ];
  }
}
