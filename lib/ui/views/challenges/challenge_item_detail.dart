import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../view_models/challenges/challenge_viewmodel.dart';
// import '../../services/auth_service.dart';

class ChallengeItemDetail extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ChallengeItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container();
    // final challenge = Provider.of<ChallengeViewModel>(context, listen: false);
    // final authData = Provider.of<Auth>(context, listen: false);
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: GridTile(
    //     child: GestureDetector(
    //       onTap: () {
    //         Navigator.of(context).pushNamed(
    //             ChallengeDetailScreen.routeName,
    //             arguments: challenge.id,
    //             );
    //       },
    //       child: Hero(
    //         tag: challenge.id,
    //         child: FadeInImage(
    //           placeholder:
    //               AssetImage('assets/images/challenge-placeholder.png'),
    //           image: NetworkImage(challenge.imageUrl),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //     footer: GridTileBar(),
    //   ),
    // );
  }
}
