import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../view_models/challenges/challenge_viewmodel.dart';
// import '../../models/challenge.dart';
// import './challenge_item_detail.dart';

class ChallengesGrid extends StatelessWidget {
  final bool showFavs;

  ChallengesGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    return Text("Placeholder");
    // final vm = Provider.of<ChallengeViewModel>(context);
    // final challenges = vm.challanges;
    // return GridView.builder(
    //   padding: const EdgeInsets.all(10.0),
    //   itemCount: challenges.length,
    //   itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
    //     // builder: (c) => challenges[i],
    //     value: challenges[i],
    //     child: ChallengeItem(
    //         // challenges[i].id,
    //         // challenges[i].title,
    //         // challenges[i].imageUrl,
    //         ),
    //   ),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     childAspectRatio: 3 / 2,
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //   ),
    // );
  }
}
