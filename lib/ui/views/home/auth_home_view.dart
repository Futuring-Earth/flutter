import 'package:app/core/models/user.dart';
import 'package:app/ui/views/home/auth_widget.dart';
import 'package:app/ui/views/home/email_link_error_presenter.dart';
import 'package:flutter/material.dart';

class AuthHomeView extends StatelessWidget {
  final AsyncSnapshot<User> userSnapshot;

  const AuthHomeView({this.userSnapshot, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmailLinkErrorPresenter.create(
      context,
      child: AuthWidget(userSnapshot: userSnapshot),
    );
  }
}
