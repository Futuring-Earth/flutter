import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/challenges/challenge_viewmodel.dart';
import './challange_item.dart';

class ChallengesView extends StatelessWidget {
  static const routeName = '/projects_view';

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<ActivityViewModel>(context);
    Future<void> _refreshProducts(BuildContext context) async {
      await Provider.of<ChallengeViewModel>(context, listen: false)
          .fetchAndSetChallenges(false);
    }

    return Container(
      child: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProducts(context),
                    child: Consumer<ChallengeViewModel>(
                      builder: (ctx, challangeData, _) => Padding(
                        padding: EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: challangeData.challanges.length,
                          itemBuilder: (_, i) => Column(
                            children: [
                              ChallengeItem(challangeData.challanges[i]),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
