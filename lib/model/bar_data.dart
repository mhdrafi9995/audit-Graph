import 'package:infotask/model/bar_graph_model.dart';

class BarData {
  final double inProgress;
  final double upcoming;
  final double closed;
  final double pending;
  BarData({
    required this.inProgress,
    required this.upcoming,
    required this.closed,
    required this.pending,
  });

  List<IndividulBar> barData = [];
  void initializeBardat() {
    barData = [
      IndividulBar(x: 'In progress', y: inProgress),
      IndividulBar(x: 'Upcoming', y: upcoming),
      IndividulBar(x: 'Closed', y: closed),
      IndividulBar(x: 'Pending', y: pending),
    ];
  }
}
