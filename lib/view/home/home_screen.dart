import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infotask/controllers/home_controller.dart';
import 'package:infotask/util/responces.dart';
import 'package:infotask/view/audit/widgets/color_convertion.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class HomeScree extends StatelessWidget {
  HomeScree({super.key});

  final HomeController getxController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Image.asset(
          'assets/images/company-logo-name (1).png',
          height: R.sh(38, context),
        ),
        elevation: 2,
        scrolledUnderElevation: 5,
        shadowColor: Colors.blueGrey,
      ),
      body: Obx(() {
        if (getxController.isLoading.isTrue) {
          return Center(
            // LOADING
            child: Lottie.network(
              "https://assets1.lottiefiles.com/packages/lf20_tbrwjiv5.json",
            ),
          );
        }
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: R.sh(26, context)),
            ),
            //slider
            SliverToBoxAdapter(
              child: CarouselSlider.builder(
                // itemCount: getxController.homeData.value.dtContent!.length,
                itemCount: getxController.homeData.value.dtContent == null
                    ? 0
                    : getxController.homeData.value.dtContent!.length,
                itemBuilder: (context, index, realIndex) {
                  var dtContent = getxController.homeData.value.dtContent;
                  if (dtContent == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Container(
                    width: R.sw(310, context),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF0973F4).withOpacity(0.7),
                          const Color(0xFF0973F4),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(R.sw(15, context)),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: R.sw(16, context),
                        vertical: R.sh(10, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dtContent[index].title!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: R.sw(18, context),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          dtContent[index].companyName!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: R.sh(10, context)),
                        Text(
                          dtContent[index].description!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: R.sw(16, context),
                              fontWeight: FontWeight.normal),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('dd MMM yyyy')
                                  .format(dtContent[index].scheduleFromDate!),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: R.sw(14, context),
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              dtContent[index].scheduleToDate == null
                                  ? ''
                                  : DateFormat('dd MMM yyyy')
                                      .format(dtContent[index].scheduleToDate!),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: R.sw(14, context),
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.15,
                  height: R.sh(200, context),
                  autoPlay: false,
                ),
              ),
            ),
            //monthly stats
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: R.sw(10, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: R.sh(20, context)),
                    Text(
                      'Monthly Status',
                      style: TextStyle(
                        fontSize: R.sw(26, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: R.sh(10, context),
                    ),
                    GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: R.sh(10, context),
                        crossAxisSpacing: R.sw(10, context),
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      itemCount:
                          getxController.homeData.value.dtMonthlyStat!.length,
                      itemBuilder: (context, index) {
                        var dtMonthlyStat =
                            getxController.homeData.value.dtMonthlyStat!;
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xFFC9EEFF),
                              borderRadius:
                                  BorderRadius.circular(R.sw(10, context))),
                          padding: EdgeInsets.symmetric(
                              horizontal: R.sw(10, context)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: R.sw(10, context),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.date_range_outlined),
                                  SizedBox(
                                    width: R.sw(4, context),
                                  ),
                                  Text(
                                    dtMonthlyStat[index].statisticMonth!,
                                    style: TextStyle(
                                      fontSize: 23,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: R.sh(10, context),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "LTIF : ",
                                    style: TextStyle(
                                        fontSize: R.sw(16, context),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    dtMonthlyStat[index].ltif.toString(),
                                    style: TextStyle(
                                        fontSize: R.sw(16, context),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[100],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mth Vlu : ",
                                    style: TextStyle(
                                        fontSize: R.sw(16, context),
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.justify,
                                  ),
                                  Text(
                                    dtMonthlyStat[index].monthVal.toString(),
                                    style: TextStyle(
                                        fontSize: R.sw(16, context),
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.grey[100],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "TRCF : ",
                                    style: TextStyle(
                                        fontSize: R.sw(16, context),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    dtMonthlyStat[index].trcf.toString(),
                                    style: TextStyle(
                                        fontSize: R.sw(16, context),
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: R.sh(10, context),
                    ),
                    // ABSTRACT DATA
                    Text(
                      'Abstract Data',
                      style: TextStyle(
                        fontSize: R.sw(26, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: R.sh(8, context),
                    ),
                    ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          getxController.homeData.value.dtAbstract!.length,
                      itemBuilder: (context, index) {
                        var dtAbstract =
                            getxController.homeData.value.dtAbstract!;
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: dtAbstract[index].colour!.toColor(),
                              borderRadius:
                                  BorderRadius.circular(R.sw(10, context))),
                          padding: EdgeInsets.symmetric(
                              horizontal: R.sw(20, context),
                              vertical: R.sh(14, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dtAbstract[index].item!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: R.sw(14, context),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                dtAbstract[index].count!.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: R.sw(14, context),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: R.sh(8, context),
                      ),
                    ),
                    SizedBox(height: R.sh(20, context)),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
