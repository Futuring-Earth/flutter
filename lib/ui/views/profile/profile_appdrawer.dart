// import 'package:app/core/services/auth/auth_service_interface.dart';
import 'package:app/constants/strings.dart';
import 'package:app/core/services/auth/auth_service.dart';
import 'package:app/ui/views/settings/settings_view.dart';
import 'package:app/ui/widgets/platform_alert_dialog.dart';
import 'package:app/ui/widgets/platform_exception_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//import 'package:app/core/services/auth/http_auth_service.dart';
// import '../../helpers/custom_route.dart';

class ProfileDrawer extends StatelessWidget {
//   Future<void> _signOut(BuildContext context) async {
//     try {
//       final auth = Provider.of<Auth>(context);
//       await auth.logout();
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> _confirmSignOut(BuildContext context) async {
//     final didRequestSignOut = await PlatformAlertDialog(
//       title: 'Logout',
//       content: 'Are you sure that you want to logout?',
//       cancelActionText: 'Cancel',
//       defaultActionText: 'Logout',
//     ).show(context);
//     if (didRequestSignOut == true) {
//       _signOut(context);
//     }
//   }

  Future<void> _signOut(BuildContext context) async {
    try {
      final AuthService auth = Provider.of<AuthService>(context, listen: false);
      await auth.signOut();
    } on PlatformException catch (e) {
      await PlatformExceptionAlertDialog(
        title: Strings.logoutFailed,
        exception: e,
      ).show(context);
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final bool didRequestSignOut = await PlatformAlertDialog(
      title: Strings.logout,
      content: Strings.logoutAreYouSure,
      cancelActionText: Strings.cancel,
      defaultActionText: Strings.logout,
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Profile Options:'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(SettingsView.routeName);
              // Navigator.of(context).pushReplacement(
              //   CustomRoute(
              //     builder: (ctx) => OrdersScreen(),
              //   ),
              // );
            },
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => _confirmSignOut(context)
              //  {
              //   bool response = await _confirmSignOut(context);

              //   Navigator.of(context).pop();
              //   Navigator.of(context).pushReplacementNamed('/');
              //   // Navigator.of(context)
              //   //     .pushReplacementNamed(UserProductsScreen.routeName);
              //   Provider.of<Auth>(context, listen: false).logout();
              // },
              ),
        ],
      ),
    );
  }
}
