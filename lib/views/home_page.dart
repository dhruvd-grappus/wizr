import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
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
    switch(index) {
      case 0: context.pushNamed(RouteNames.discoverPage);
      case 1: context.pushNamed(RouteNames.learnPage);
      case 2: context.pushNamed(RouteNames.landingPage);
      case 3: context.pushNamed(RouteNames.financePage);
      case 4: context.pushNamed(RouteNames.growPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: WizrBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeCircleColor: const Color(0xffCBFB62),
        borderRaduis: BorderRadius.zero,
        domeHeight: 17,
        domeCircleSize: 45,
        barColor: Colors.white,
        onTabChange: _onItemTapped,
        tabs: [
          WizrTab(
            icon: SvgPicture.asset('assets/icons/ic_discover.svg'),
            title: Text(
              'Discover',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: _selectedIndex == 0
                    ? const Color(0xff161C20)
                    : const Color(0xff838F97),
              ),
            ),
          ),
          WizrTab(
            icon: SvgPicture.asset('assets/icons/ic_learn.svg'),
            title: Text(
              'Learn',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: _selectedIndex == 1
                    ? const Color(0xff161C20)
                    : const Color(0xff838F97),
              ),
            ),
          ),
          WizrTab(
            icon: SvgPicture.asset('assets/icons/ic_home.svg'),
            title: Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: _selectedIndex == 2
                    ? const Color(0xff161C20)
                    : const Color(0xff838F97),
              ),
            ),
          ),
          WizrTab(
            icon: SvgPicture.asset('assets/icons/ic_finance.svg'),
            title: Text(
              'Finance',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: _selectedIndex == 3
                    ? const Color(0xff161C20)
                    : const Color(0xff838F97),
              ),
            ),
          ),
          WizrTab(
            icon: SvgPicture.asset('assets/icons/ic_grow.svg'),
            title: Text(
              'Grow',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: _selectedIndex == 4
                    ? const Color(0xff161C20)
                    : const Color(0xff838F97),
              ),
            ),
          ),
        ],
      ),
      body: widget.child,
    );
  }
}
