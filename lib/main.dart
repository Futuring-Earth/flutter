import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:app/views/activity/activity_view.dart';
import 'package:app/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './view_models/activity/activity_viewmodel.dart';
import './view_models/challenges/challenge_viewmodel.dart';
import './views/activity/activity_view.dart';
import './views/tabs_view.dart';
import './views/profile/profile_view.dart';
import './views/inspiration/inspiration_view.dart';
import './views/challenges/challenges_view.dart';
import './views/challenges/edit_challenge_view.dart';
import 'services/auth_service.dart';
import 'themes/gallery_theme_data.dart';
import 'views/auth_view.dart';
import 'views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);

  //This global variable can be use to know when the app
  //is running on the web. If kisweb = true is a web app
  //to use the variable:
  //  import 'package:flutter/foundation.dart' show kIsWeb;
  bool kisweb;
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      kisweb = false;
    } else {
      kisweb = true;
    }
  } catch (e) {
    kisweb = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ChallengeViewModel>(
          create: (ctx) => ChallengeViewModel(),
          update: (ctx, auth, previousInstance) => previousInstance
            ..update(
              auth.token,
              auth.userId,
              previousInstance == null ? [] : previousInstance.challanges,
            ),
        ),
        ChangeNotifierProxyProvider<Auth, ActivityViewModel>(
          create: (ctx) => ActivityViewModel(),
          update: (ctx, auth, previuosItems) => previuosItems
            ..update(
              auth.token,
              previuosItems == null ? [] : previuosItems.actions,
            ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Futuring',
          theme: GalleryThemeData.lightThemeData,
          darkTheme: GalleryThemeData.darkThemeData,
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   accentColor: Colors.grey,
          //   fontFamily: 'Lato',
          //   textTheme: ThemeData.light().textTheme.copyWith(
          //         headline6: TextStyle(
          //           fontFamily: 'OpenSans',
          //           fontWeight: FontWeight.bold,
          //           fontSize: 18,
          //         ),
          //         button: TextStyle(color: Colors.white),
          //       ),
          //   appBarTheme: AppBarTheme(
          //     textTheme: ThemeData.light().textTheme.copyWith(
          //           headline6: TextStyle(
          //             fontFamily: 'OpenSans',
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //   ),
          // ),
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
