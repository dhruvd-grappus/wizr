// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/views/widgets/wizr_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.child, super.key});

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        context.pushNamed(RouteNames.discoverPage);
      case 1:
        context.pushNamed(RouteNames.learn2Page);
      case 2:
        context.pushNamed(RouteNames.landingPage);
      case 3:
        context.pushNamed(RouteNames.financePage);
      case 4:
        context.pushNamed(RouteNames.growPage);
    }
  }

  final tabIcons = [
    'assets/icons/ic_discover.svg',
    'assets/icons/ic_learn.svg',
    'assets/icons/ic_home.svg',
    'assets/icons/ic_finance.svg',
    'assets/icons/ic_grow.svg'
  ];
  final tabTexts = ['Discover', 'Learn', 'Home', 'Finance', 'Grow'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: WizrBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeCircleColor: const Color(0xffCBFB62),
        borderRadius: BorderRadius.zero,
        domeHeight: 17.h,
        domeCircleSize: 45.h,
        barColor: Colors.white,
        onTabChange: _onItemTapped,
        tabs: List.generate(
          tabIcons.length,
          (index) => WizrTab(
            icon: Transform.rotate(
              angle: _selectedIndex == index ? -17 * pi / 180 : 0,
              child: SvgPicture.asset(
                tabIcons[index],
                color: _selectedIndex == index ? Colors.black : null,
              ),
            ),
            title: Text(
              tabTexts[index],
              style: context.textTheme.labelSmall!
                  .withColor(
                    _selectedIndex == index
                        ? const Color(0xff161C20)
                        : const Color(0xff838F97),
                  )
                  .responsiveFont(context),
            ),
          ),
        ),
      ),
      body: SafeArea(child: widget.child),
    );
  }
}
