import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infotask/controllers/graph_controller.dart';
import 'package:infotask/util/responces.dart';
import 'package:infotask/view/audit/widgets/bar_data_bar.dart';

import 'widgets/audit_information.dart';
import 'widgets/bar_stastu.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  final GraphController getxController = Get.put(GraphController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text("Audit Graph"),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.5),
        scrolledUnderElevation: 5,
      ),
      body: Obx(() {
        if (getxController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: R.sh(20, context)),
              //bar graph section
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: R.sh(200, context),
                  child: BarGraph(
                    graphController: getxController,
                  ),
                ),
              ),
              SizedBox(height: R.sh(20, context)),
              // graph info
              const StatusGraph(),

              Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: Divider(
                  height: R.sh(40, context),
                ),
              ),

              //audit information list
              Padding(
                padding: EdgeInsets.symmetric(horizontal: R.sh(20, context)),
                child: AuditInfo(
                  controller: getxController,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
