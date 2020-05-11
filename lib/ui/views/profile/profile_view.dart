import 'package:app/core/models/user.dart';
import 'package:app/core/services/auth/auth_service.dart';
import 'package:app/core/services/user_db_Service.dart';
import 'package:app/ui/views/profile/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/profile_view';
  final User user;

  ProfileView ({this.user});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double _height= mediaQuery.size.height -
            Scaffold.of(context).appBarMaxHeight -
            mediaQuery.padding.top;
    final double _width = mediaQuery.size.width;
    return Container(
      color: Theme.of(context).backgroundColor,
      height: _height,
      width: _width,
      child: _profilePageUIWrapper(context, _height, _width),
    ); 
  }


  Future<String> getUserToDisplayId(BuildContext ctx) async
  {
    User currentUser; 
    if (this.user != null)
      currentUser =  this.user;
    else
      currentUser = await Provider.of<AuthService>(ctx, listen: false).currentUser();
        // .currentUser().then((value) => currentUser = value);

    return currentUser?.uid;
  }

  Widget _profilePageUIWrapper(BuildContext ctx, double height, double width) {
    return Builder(
      builder: (BuildContext _context) {
      return FutureBuilder<String>(
        future: getUserToDisplayId(ctx), 
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return _profilePageUI(context, snapshot.data, height, width);
        } else {
          return SpinKitWanderingCubes(
            color: Theme.of(ctx).accentColor,
            size: 50.0,
          );
        }
      },
      );
      }
    );
  }


  Widget _profilePageUI(BuildContext ctx, String userId, double height, double width) {
    return Builder(
      builder: (BuildContext _context) {
        return StreamBuilder<User>(
            stream: FirestoreUserDBService.instance.userStream (userId: userId), //authService.onAuthStateChanged,
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
                  : SpinKitWanderingCubes(
                      color: Theme.of(ctx).accentColor,
                      size: 50.0,
                    );
            },
          );
      }
    );
  }
}