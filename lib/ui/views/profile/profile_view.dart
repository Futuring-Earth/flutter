import 'package:app/core/models/user.dart';
import 'package:app/ui/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/profile_view';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Center(
      child: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: _buildUserInfo(user, context),
      ),
    );
  }

  Widget _buildUserInfo(User user, BuildContext ctx) {
    return Column(
      children: [
        Avatar(
          photoUrl: user.photoUrl,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 2.0,
        ),
        SizedBox(height: 8),
        if (user.displayName != null)
          Text(
            user.displayName,
            style: TextStyle(color: Theme.of(ctx).textTheme.headline6.color),
          ),
        SizedBox(height: 8),
      ],
    );
  }
}
