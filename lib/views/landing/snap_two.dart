import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnapTwo extends StatelessWidget {
  const SnapTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF9F3F0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(top: 30, bottom: 24),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 11,
            bottom: 0,
            right: 12,
            child: Container(
              height: 455.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffDFB19D),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '01',
                      style: TextStyle(
                        fontFamily: 'Quintus',
                        fontWeight: FontWeight.w700,
                        fontSize: 40.spMin,
                        height: 1,
                        color: const Color(0xffB7704E),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover',
                          style: TextStyle(
                            fontFamily: 'Patron',
                            fontWeight: FontWeight.w700,
                            fontSize: 39.h,
                            height: 1,
                            color: const Color(0xff2B1911),
                          ),
                        ),
                        SizedBox(height: 19.h),
                        const Text(
                          'Your Potential',
                          style: TextStyle(
                            fontFamily: 'Quintus',
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                            height: 1,
                            color: Color(0xffB7704E),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Unleash your inner superhero!\nDiscover your '
                          'super powers'
                          ' and find out how\nskilled you are. Get top-notch',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            height: 1.42,
                            color: const Color(0xff161C20),
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
                    Positioned(
                      left: 16.w,
                      top: 32.h,
                      child: Transform.rotate(
                        angle: -8 * math.pi / 180,
                        child: Container(
                          height: 224.h,
                          width: 213.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffB7704E),
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
                              SvgPicture.asset(
                                'assets/images/bg_arrow_shadow.svg',
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset('assets/images/tetrist.png'),
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
                                        'Career Discovery',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          height: 1,
                                          color: Color(0xffEDF0F1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'Discover your\nperfect Career',
                                      style: TextStyle(
                                        fontFamily: 'Patron',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        letterSpacing: 0.02,
                                        color: Color(0xffEDF0F1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 18,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                      msg: 'Under Development',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff1D1B21),
                                    shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                      37,
                                      16,
                                      37,
                                      16,
                                    ),
                                  ),
                                  child: const Text(
                                    'Play Now',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      height: 1,
                                      color: Color(0xffF5F4F6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 0,
                      child: Transform.rotate(
                        angle: 8 * math.pi / 180,
                        child: Container(
                          height: 224.h,
                          width: 213.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffB7704E),
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
                              SvgPicture.asset(
                                'assets/images/bg_arrow_shadow.svg',
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 30,
                                right: -12,
                                bottom: 0,
                                child: Image.asset(
                                  'assets/images/exp_model.png',
                                  fit: BoxFit.fitHeight,
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
                                        'Expertise Discovery',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          height: 1,
                                          color: Color(0xffEDF0F1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'Know your\nExpertise Level',
                                      style: TextStyle(
                                        fontFamily: 'Patron',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        letterSpacing: 0.02,
                                        color: Color(0xffEDF0F1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 18,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                      msg: 'Under Development',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff1D1B21),
                                    shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                      24,
                                      16,
                                      24,
                                      16,
                                    ),
                                  ),
                                  child: const Text(
                                    'Take the Quiz!',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      height: 1,
                                      color: Color(0xffF5F4F6),
                                    ),
                                  ),
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
              SizedBox(
                height: kBottomNavigationBarHeight + 10.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
