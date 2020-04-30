import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './ui/views/tabs_view.dart';
import './core/services/auth_service.dart';
import './provider_setup.dart';
import './ui/views/auth_view.dart';
import './ui/views/splash_view.dart';
import './locator.dart';
import './ui/layout/futuring_settings.dart';

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
          theme: FuturingSettings.globalTheme,
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
          routes: FuturingSettings.getGlobalRoutes(ctx),
        ),
      ),
    );
  }
}
