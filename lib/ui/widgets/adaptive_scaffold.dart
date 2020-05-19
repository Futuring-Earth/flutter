//import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class AdaptiveScaffold extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final Widget body;
  final Widget drawer;
  final Widget bottomNavigationBar;
  final Function centerButtonAction;

  AdaptiveScaffold(
      {@required this.title,
      @required this.body,
      this.actions,
      this.centerButtonAction,
      this.drawer,
      this.bottomNavigationBar});

  PreferredSizeWidget getAppBar() {
    if (kIsWeb) {
      return AppBar(
        title: Text(
          title,
        ),
        actions: actions,
      );
    }

    // if (Platform.isIOS) {
    //   return CupertinoNavigationBar(
    //     middle: Text(
    //       title,
    //     ),
    //     trailing: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: actions,
    //     ),
    //   );
    // }

    return AppBar(
      title: Text(
        title,
      ),
      actions: actions,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final PreferredSizeWidget appBar = getAppBar();

    //SafeArea is basically a glorified Padding widget.
    // If you wrap another widget with SafeArea , it adds any necessary
    // padding needed to keep your widget from being blocked by the system
    // status bar, notches, holes, rounded corners and other "creative"
    // features by manufactures.
    final pageBody = SafeArea(
      child: Container(
        child: body,
        height: mediaQuery.size.height -
            appBar.preferredSize.height -
            mediaQuery.padding.top,
      ),
    );

    Widget getScaffold() {
      if (kIsWeb) {
        return Scaffold(
          appBar: appBar,
          body: pageBody,
          bottomNavigationBar: this.bottomNavigationBar,
          drawer: this.drawer,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => centerButtonAction(),
          ),
        );
      }

      // if (Platform.isIOS)
      //   return CupertinoPageScaffold(
      //     child: pageBody,
      //     navigationBar: appBar,
      //   );

      return Scaffold(
        appBar: appBar,
        body: pageBody,
        bottomNavigationBar: this.bottomNavigationBar,
        drawer: this.drawer,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => centerButtonAction(),
        ),
      );
    }

    return getScaffold();
  }
}
