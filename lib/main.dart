import 'package:app/views/activity/activity_view.dart';
import 'package:app/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './views/activity/activity_view.dart';
import './views/tabs_view.dart';
import './views/profile/profile_view.dart';
import './views/inspiration/inspiration_view.dart';
import './views/challenges/challenges_view.dart';
import './views/challenges/edit_challenge_view.dart';
import 'services/auth_service.dart';
import './provider_setup.dart';
import 'views/auth_view.dart';
import 'views/splash_view.dart';
import './locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Futuring',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.grey,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  button: TextStyle(color: Colors.white),
                ),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ),
          home: auth.isAuth
              ? TabsScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashView()
                          : AuthView(),
                ),
          routes: {
            ProfileView.routeName: (ctx) => ProfileView(),
            ActivityView.routeName: (ctx) => ActivityView(),
            InspirationView.routeName: (ctx) => InspirationView(),
            ChallengesView.routeName: (ctx) => ChallengesView(),
            SettingsView.routeName: (ctx) => SettingsView(),
            EditChallengesView.routeName: (ctx) => EditChallengesView(),
          },
        ),
      ),
    );
  }
}
