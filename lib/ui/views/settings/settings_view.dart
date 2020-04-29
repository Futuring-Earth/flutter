import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../view_models/activity/activity_viewmodel.dart';
import '../../widgets/adaptive_scaffold.dart';

class SettingsView extends StatelessWidget {
  static const routeName = '/settings_view';

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<ActivityViewModel>(context);

    return AdaptiveScaffold(
      title: 'Settings',
      body: Text('Settings Page'),
    );
  }
}
