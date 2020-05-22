// import 'package:app/core/services/auth/apple_sign_in_available.dart';
import 'package:app/core/services/auth/auth_service_adapter.dart';
import 'package:app/ui/views/auth_widget_builder.dart';
import 'package:app/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './provider_setup.dart';
import './locator.dart';
import './ui/layout/futuring_settings.dart';
import 'core/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
  setupLocator();
  // final appleSignInAvailable = await AppleSignInAvailable.check();
  // runApp(MyApp(appleSignInAvailable: appleSignInAvailable));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({this.initialAuthServiceType = AuthServiceType.firebase
      //,this.appleSignInAvailable
      });
  final AuthServiceType initialAuthServiceType;
  // final AppleSignInAvailable appleSignInAvailable;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: InitialProviderSetup(
              initialAuthServiceType: this.initialAuthServiceType)
          // ,appleSignInAvailable: this.appleSignInAvailable)
          .providers,
      child: AuthWidgetBuilder(
          builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
        return MaterialApp(
          //navigatorKey: NavigationService.instance.navigatorKey,
          //navigatorKey: locator<CustomNavigationService>().navigatorKey,
          initialRoute:
              '/', //Routes.homeViewRoute, //'/', // this is equal to the widget defined as 'home'
          theme: FuturingSettings.globalTheme,
          home: HomeView(userSnapshot: userSnapshot),
          // EmailLinkErrorPresenter.create(
          //   context,
          //   child: AuthWidget(userSnapshot: userSnapshot),
          // ),
          routes: FuturingSettings.getGlobalRoutes(context),
          //onGenerateRoute: Router().onGenerateRoute,
        );
      }),

      // child: Consumer<Auth>(
      //   builder: (ctx, auth, _) => MaterialApp(
      //     title: 'Futuring',
      //     theme: FuturingSettings.globalTheme,
      //     home: auth.isAuth
      //         ? TabsScreen()
      //         : FutureBuilder(
      //             future: auth.tryAutoLogin(),
      //             builder: (ctx, authResultSnapshot) =>
      //                 authResultSnapshot.connectionState ==
      //                         ConnectionState.waiting
      //                     ? SplashView()
      //                     : AuthView(),
      //           ),
      //     routes: FuturingSettings.getGlobalRoutes(ctx),
      //   ),
      // ),
    );
  }
}
