import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../view_models/activity/activity_viewmodel.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/profile_view';

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<ActivityViewModel>(context);

    return Container(
      child: Center(child: Text('Profile Page')),
    );
  }
}
