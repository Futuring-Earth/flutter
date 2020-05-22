import 'package:app/core/models/user.dart';
import 'package:app/ui/views/auth_widget.dart';
import 'package:app/ui/views/email_link_error_presenter.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final AsyncSnapshot<User> userSnapshot;

  const HomeView({this.userSnapshot, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmailLinkErrorPresenter.create(
      context,
      child: AuthWidget(userSnapshot: userSnapshot),
    );
  }
}
