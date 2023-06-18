import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:infotask/controllers/graph_controller.dart';
import 'package:infotask/util/responces.dart';

class AuditInfo extends StatelessWidget {
  final GraphController controller;
  const AuditInfo({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        itemCount: controller.auditListData.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: R.sw(20, context), vertical: R.sh(10, context)),
          decoration: BoxDecoration(
              color: Color(0xFFA0C49D),
              borderRadius: BorderRadius.circular(R.sw(15, context))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Audit No : ${controller.auditListData[index].auditNo}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Audit Type DESC : ${controller.auditListData[index].auditTypeDesc ?? '---'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Audit Location : ${controller.auditListData[index].auditLocation ?? '---'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Audit StatusProgras : ${controller.auditListData[index].auditStatus}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Audit Title : ${controller.auditListData[index].auditTitle ?? '---'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: R.sh(10, context),
        ),
      );
    });
  }
}
