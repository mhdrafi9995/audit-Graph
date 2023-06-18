import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infotask/view/home/home_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../audit/audit_screen.dart';
import '../profile/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),
      child: Scaffold(
        bottomNavigationBar: WaterDropNavBar(
          inactiveIconColor: Colors.grey,
          waterDropColor: Colors.blue,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 350), curve: Curves.easeIn);
          },
          barItems: [
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.bar_chart,
              outlinedIcon: Icons.bar_chart_outlined,
            ),
            BarItem(
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_outlined,
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          children: [
            HomeScree(),
            // BAR CHART
            BarChart(),

            // profile
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
