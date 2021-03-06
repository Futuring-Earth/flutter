import 'package:app/ui/views/home/home_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenTypeLayout(
        tablet: HomeViewMobile(),
        mobile: HomeViewMobile(),
      ), //.showCursorOnHover.moveUpOnHover,
    );
  }
}
