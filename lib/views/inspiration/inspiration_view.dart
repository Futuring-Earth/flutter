import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../view_models/activity/activity_viewmodel.dart';

class InspirationView extends StatelessWidget {
  static const routeName = '/chat_view';

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<ActivityViewModel>(context);

    return Container(
      child: Center(
          child: Text(
              'Here you can find inspiration by seeing what others are doing...')),
    );
  }
}
