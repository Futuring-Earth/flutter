import 'package:app/core/models/user.dart';
import 'package:app/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  final User user;
  final Function innerWidget;
  final double height;
  final double width;

  AuthWrapper({@required this.innerWidget, this.user, this.height, this.width});

  Future<User> _getUserToDisplayId(BuildContext ctx) async {
    User currentUser;
    if (this.user != null)
      currentUser = this.user;
    else
      currentUser =
          await Provider.of<AuthService>(ctx, listen: false).currentUser();
    return currentUser;
  }

  Widget _authWrapper(BuildContext ctx, double height, double width) {
    return Builder(builder: (BuildContext _context) {
      return FutureBuilder<User>(
        future: _getUserToDisplayId(ctx),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
            return this.innerWidget(context, snapshot.data, height, width);
          } else {
            return SpinKitWanderingCubes(
              color: Theme.of(ctx).accentColor,
              size: 50.0,
            );
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _authWrapper(context, this.height, this.width);
  }
}
