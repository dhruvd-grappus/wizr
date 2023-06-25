import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';

class SnapThree extends StatelessWidget {
  const SnapThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffA198AC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(top: 30, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '02',
                  style: TextStyle(
                    fontFamily: 'Quintus',
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    height: 1,
                    color: Color(0xffF5F4F6),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Learn',
                      style: TextStyle(
                        fontFamily: 'Patron',
                        fontWeight: FontWeight.w700,
                        fontSize: 39,
                        height: 1,
                        color: Color(0xff1D1B21),
                      ),
                    ),
                    const SizedBox(height: 19),
                    const Text(
                      'with Purpose',
                      style: TextStyle(
                        fontFamily: 'Quintus',
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        height: 1,
                        color: Color(0xffF5F4F6),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const Text(
                      'Receive unbiased and personalized course'
                      '\nrecommendations from across India and '
                      'the\nworld. Filter, compare and enrol',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                        color: Color(0xff161C20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff50495A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                ),
                Positioned(
                  left: 36,
                  right: 32,
                  bottom: 55,
                  top: 52,
                  child: Transform.rotate(
                    angle: -math.pi / 24,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffF5F4F6),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3, // soften the shadow
                            spreadRadius: 4, //extend the shadow
                            offset: Offset(
                              -5, // Move to right 5  horizontally
                              5, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: -16,
                            bottom: 0,
                            child: SvgPicture.asset(
                              'assets/images/bg_zigzag_shadow.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 30,
                            right: -20,
                            bottom: -32,
                            child: Transform.rotate(
                              angle: math.pi / 24,
                              child: Image.asset(
                                'assets/images/course_model.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 9,
                            left: 18,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(36),
                                    color: const Color(0xffF9F3F0)
                                        .withOpacity(.10),
                                  ),
                                  padding: const EdgeInsets.all(9),
                                  child: const Text(
                                    'Find the perfect\ncourse',
                                    style: TextStyle(
                                      fontFamily: 'Patron',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25,
                                      color: Color(0xff1D1B21),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Based on your profile get\nunbiased'
                                  ' course\nrecommendations.',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.02,
                                    color: Color(0xff50495A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    /*Fluttertoast.showToast(
                                      msg: 'Under Development',
                                    );*/
                                    context.pushNamed(RouteNames.courseRecommendationPage);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff1D1B21),
                                    shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                      32,
                                      16,
                                      32,
                                      16,
                                    ), //content padding inside button
                                  ),
                                  child: const Text(
                                    'Explore',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      height: 1,
                                      color: Color(0xffF5F4F6),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'In just 5 steps!',
                                  style: TextStyle(
                                    fontFamily: 'Quintus',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                    color: Color(0xff50495A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: kBottomNavigationBarHeight,
          )
        ],
      ),
    );
  }
}
