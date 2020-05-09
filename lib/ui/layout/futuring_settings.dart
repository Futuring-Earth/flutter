import 'package:flutter/material.dart';

import 'package:app/ui/views/activity/activity_view.dart';
import 'package:app/ui/views/settings/settings_view.dart';
import 'package:app/ui/views/profile/profile_view.dart';
import 'package:app/ui/views/inspiration/inspiration_view.dart';
import 'package:app/ui/views/challenges/challenges_view.dart';
import 'package:app/ui/views/challenges/edit_challenge_view.dart';

class FuturingSettings {
  static ThemeData _androidTheme = ThemeData(
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
  );

  static ThemeData globalTheme = _androidTheme;

  static Map<String, Widget Function(BuildContext)> getGlobalRoutes(ctx) {
    return _getAndroidRoutes(ctx);
  }

  static Map<String, Widget Function(BuildContext)> _getAndroidRoutes(ctx) {
    return {
      ProfileView.routeName: (ctx) => ProfileView(),
      ActivityView.routeName: (ctx) => ActivityView(),
      InspirationView.routeName: (ctx) => InspirationView(),
      ChallengesView.routeName: (ctx) => ChallengesView(),
      SettingsView.routeName: (ctx) => SettingsView(),
      EditChallengesView.routeName: (ctx) => EditChallengesView(),
      //AuthWidget.routeName: (ctx) => AuthWidget(userSnapshot: userSnapshot),
      // '/': (ctx) => EmailLinkErrorPresenter.create(
      //       ctx,
      //       child: AuthWidget(userSnapshot: userSnapshot),
      //     )
    };
  }
}
