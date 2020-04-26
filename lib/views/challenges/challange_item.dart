import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './edit_challenge_view.dart';
import '../../view_models/challenges/challenge_viewmodel.dart';
import '../../models/challenge.dart';

class ChallengeItem extends StatelessWidget {
  final Challenge challenge;

  ChallengeItem(this.challenge);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(challenge.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(challenge.imageUrl),
      ),
      subtitle: Text(challenge.description),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.update),
              onPressed: () {
                Navigator.of(context).pushNamed(EditChallengesView.routeName,
                    arguments: challenge.id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<ChallengeViewModel>(context, listen: false)
                      .deleteChallenge(challenge.id);
                } catch (error) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text(
                        'Deleting failed!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
