import 'package:flutter/material.dart';
import 'package:wizr/views/landing/snap_eight.dart';
import 'package:wizr/views/landing/snap_five.dart';
import 'package:wizr/views/landing/snap_four.dart';
import 'package:wizr/views/landing/snap_nine.dart';
import 'package:wizr/views/landing/snap_one.dart';
import 'package:wizr/views/landing/snap_seven.dart';
import 'package:wizr/views/landing/snap_six.dart';
import 'package:wizr/views/landing/snap_three.dart';
import 'package:wizr/views/landing/snap_two.dart';
import 'package:wizr/views/landing/widgets/landing_app_bar.dart';
import 'package:wizr/views/landing/widgets/stack_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // snapped widgets
    final snapWidgets = <Widget>[
      const SnapOne(),
      const SnapTwo(),
      const SnapThree(),
      const SnapFour(),
      const SnapFive(),
      const SnapSix(),
      const SnapSeven(),
      const SnapEight(),
      const SnapNine(),
    ];

    return Column(
      children: [
        // app bar
        const LandingAppBar(),
        Expanded(
          child: StackSwiper(
            curve: Curves.ease,
            duration: 500,
            itemBuilder: (BuildContext context, int index) {
              return snapWidgets[index];
            },
            itemCount: snapWidgets.length,
            scrollDirection: Axis.vertical,
            itemWidth: MediaQuery.of(context).size.width,
            itemHeight: MediaQuery.of(context)
                .size
                .height - // total height// top AppBar height
                kBottomNavigationBarHeight,
            loop: false,
          ),
        ),

      ],
    );
  }
}
