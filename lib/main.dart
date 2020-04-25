import 'package:app/views/activity/activity_view.dart';
import 'package:app/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './view_models/activity/activity_viewmodel.dart';
import './views/activity/activity_view.dart';
import './views/tabs_view.dart';
import './views/profile/profile_view.dart';
import './views/chat/chat_view.dart';
import './views/projects/projects_view.dart';
import 'services/auth_service.dart';
import 'views/auth_view.dart';
import 'views/splash_view.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
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
        ChangeNotifierProxyProvider<Auth, ActivityViewModel>(
          builder: (ctx, auth, previuosVM) => ActivityViewModel(
            auth.token,
            auth.userId,
            previuosVM == null ? [] : previuosVM.actions,
          ),
        ),
        // ChangeNotifierProvider.value(
        //   value: ActivityViewModel(),
        // ),
        // ChangeNotifierProvider.value(
        //   value: ProfileViewModel(),
        // ),
        // ChangeNotifierProvider.value(
        //   value: MarketViewModel(),
        // ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Futuring',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.yellow,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  button: TextStyle(color: Colors.white),
                ),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
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
            ChatView.routeName: (ctx) => ChatView(),
            ProjectsView.routeName: (ctx) => ProjectsView(),
            SettingsView.routeName: (ctx) => SettingsView(),
          },
        ),
      ),
    );
  }
}
