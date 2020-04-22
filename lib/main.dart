import 'package:app/view_models/activity/activity_viewmodel.dart';
import 'package:app/views/activity/activity_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ActivityViewModel(),
        ),
        // ChangeNotifierProvider.value(
        //   value: ProfileViewModel(),
        // ),
        // ChangeNotifierProvider.value(
        //   value: MarketViewModel(),
        // ),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ActivityView(),
          routes: {
            // ProfileView.routeName: (ctx) => ProfileView(),
            // MarketView.routeName: (ctx) => MarketView(),
          }),
    );
  }
}
