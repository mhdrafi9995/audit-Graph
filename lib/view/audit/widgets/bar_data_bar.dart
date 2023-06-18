import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:infotask/controllers/graph_controller.dart';
import 'package:infotask/util/responces.dart';
import 'package:infotask/view/audit/widgets/color_convertion.dart';

class BarGraph extends StatelessWidget {
  final GraphController graphController;
  const BarGraph({super.key, required this.graphController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BarChart(
        BarChartData(
          maxY: 90,
          minY: 0,

          gridData: const FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          // barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text(
                  graphController.auditGraphData[value.toInt()].count
                      .toString(),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                getTitlesWidget: (value, meta) => SideTitleWidget(
                  axisSide: AxisSide.bottom,
                  child: value == 1
                      ? Icon(
                          Icons.refresh_outlined,
                          color: Color(0xffffa800),
                          size: R.sw(26, context),
                        )
                      : value == 2
                          ? Icon(
                              Icons.more_horiz_outlined,
                              color: Color(0xff3699ff),
                              size: R.sw(26, context),
                            )
                          : value == 3
                              ? Icon(
                                  Icons.check_box_outlined,
                                  color: Color(0xff00a65a),
                                  size: R.sw(26, context),
                                )
                              : Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Color(0xffff2a3f),
                                  size: R.sw(26, context),
                                ),
                ),
                showTitles: true,
              ),
            ),
          ),
          barGroups: [
            for (int i = 0; i < graphController.auditGraphData.length; i++) ...[
              BarChartGroupData(
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: graphController.auditGraphData[i].count.toDouble(),
                    color: graphController.auditGraphData[i].colour
                        .toOriginalColor(),
                    width: 50,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ],
              ),
            ]
          ],
        ),
      );
    });
  }
}
