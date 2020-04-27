import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

//import '../../view_models/activity/activity_viewmodel.dart';

class ActivityView extends StatelessWidget {
  static const routeName = '/activity_view';

  @override
  Widget build(BuildContext context) {
    //final vm = Provider.of<ActivityViewModel>(context);

    return Container(
      child: Center(child: Text('Home Page')),
    );
  }
}

// import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// //import '../../view_models/activity/activity_viewmodel.dart';
// import 'package:app/widgets/pie_chart.dart';

// class ActivityView extends StatelessWidget {
//   static const routeName = '/activity_view';
//   const ActivityView({
//     this.heroLabel,
//     this.heroAmount,
//     this.wholeAmount,
//     this.segments,
//   });

//   /// The amounts to assign each item.
//   final List<CustomPieChartSegment> segments;
//   final String heroLabel;
//   final double heroAmount;
//   final double wholeAmount;
//   @override
//   Widget build(BuildContext context) {
//     //final vm = Provider.of<ActivityViewModel>(context);

//     return Container(
//       child: Column(
//         children: [
//           // CustomPieChart(
//           //   heroLabel: heroLabel,
//           //   heroAmount: heroAmount,
//           //   wholeAmount: wholeAmount,
//           //   segments: segments,
//           // ),
//           Center(child: Text('Home Page')),
//         ],
//       ),
//     );
//   }
// }
