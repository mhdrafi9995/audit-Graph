import 'package:flutter/material.dart';
import 'package:infotask/util/responces.dart';

class StatusGraph extends StatelessWidget {
  const StatusGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: R.sh(20, context), left: R.sw(20, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: R.sw(20, context),
                height: R.sh(20, context),
                decoration: BoxDecoration(
                    color: const Color(0xffffa800),
                    borderRadius: BorderRadius.circular(4)),
              ),
              SizedBox(
                width: R.sw(10, context),
              ),
              Text(
                "Audit Inprogress",
                style: TextStyle(
                    fontSize: R.sw(16, context), fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: R.sh(11, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: R.sw(20, context),
                height: R.sh(20, context),
                decoration: BoxDecoration(
                    color: const Color(0xff3699ff),
                    borderRadius: BorderRadius.circular(4)),
              ),
              SizedBox(
                width: R.sw(10, context),
              ),
              Text(
                "Upcoming Audits in Next 7 Days",
                style: TextStyle(
                    fontSize: R.sw(16, context), fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: R.sh(11, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: R.sw(20, context),
                height: R.sh(20, context),
                decoration: BoxDecoration(
                    color: const Color(0xff00a65a),
                    borderRadius: BorderRadius.circular(4)),
              ),
              SizedBox(
                width: R.sw(10, context),
              ),
              Text(
                "Closed Audits",
                style: TextStyle(
                    fontSize: R.sw(16, context), fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: R.sh(11, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: R.sw(20, context),
                height: R.sh(20, context),
                decoration: BoxDecoration(
                    color: const Color(0xffff2a3f),
                    borderRadius: BorderRadius.circular(4)),
              ),
              SizedBox(
                width: R.sw(10, context),
              ),
              Text(
                "Pending Audit Actions",
                style: TextStyle(
                    fontSize: R.sw(16, context), fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
