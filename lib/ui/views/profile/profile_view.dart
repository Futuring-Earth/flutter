import 'package:app/core/models/user.dart';
// import 'package:app/core/services/auth/auth_service.dart';
import 'package:app/core/services/user_db_Service.dart';
import 'package:app/ui/views/profile/profile_header.dart';
import 'package:app/ui/widgets/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/profile_view';
  final User user;

  ProfileView({this.user});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double _height = mediaQuery.size.height -
        Scaffold.of(context).appBarMaxHeight -
        mediaQuery.padding.top;
    final double _width = mediaQuery.size.width;
    return Container(
      color: Theme.of(context).backgroundColor,
      height: _height,
      width: _width,
      child: AuthWrapper(
          innerWidget: _profilePageUI,
          user: this.user,
          height: _height,
          width: _width),
    );
  }

  Widget _profilePageUI(
      BuildContext ctx, User user, double height, double width) {
    return Builder(builder: (BuildContext _context) {
      return StreamBuilder<User>(
        stream: FirestoreUserDBService.instance
            .userStream(userId: user.uid), //authService.onAuthStateChanged,
        builder: (BuildContext _context, AsyncSnapshot<User> _snapshot) {
          var _userData = _snapshot.data;
          return _snapshot.hasData
              ? Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: height * 0.50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ProfileHeader(width, height, _userData),
                        // ProfileDashboard(),
                        // ProfileActiveList()
                      ],
                    ),
                  ),
                )
              : SpinKitFadingCircle(
                  color: Theme.of(ctx).accentColor,
                  size: 50.0,
                );
        },
      );
    });
  }
}
