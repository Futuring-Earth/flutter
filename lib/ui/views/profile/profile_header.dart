import 'package:app/core/models/user.dart';
import 'package:app/ui/widgets/avatar.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final double _height;
  final double _width;
  final User _user;
  const ProfileHeader(this._width, this._height, this._user);


  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    return Center(
      child: PreferredSize(
        preferredSize: Size.fromHeight(_height),
        child: _buildUserInfo(_user, context),
      ),
    );
  }

  Widget _buildUserInfo(User user, BuildContext ctx) {
    return Column(
      children: [
        Avatar(
          photoUrl: user.photoUrl,
          radius: this._width * 0.2,
          borderColor: Theme.of(ctx).accentColor,
          borderWidth: 2.0,
        ),
        SizedBox(height: _height * 0.05),
        if (user.displayName != null)
          Text(
            user.displayName,
            style: TextStyle(color: Theme.of(ctx).textTheme.headline6.color),
          ),
        SizedBox(height: _height * 0.05),
      ],
    );
  }
}