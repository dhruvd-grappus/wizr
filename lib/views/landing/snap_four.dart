import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

class SnapFour extends StatelessWidget {
  const SnapFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF5F4F6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(top: 30, bottom: 24),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 488.h,
              margin:
                  EdgeInsets.symmetric(horizontal: 11.w).copyWith(top: 207.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffA198AC),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(bottom: 12),
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
                          color: Color(0xffA198AC),
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
                              color: Color(0xffA198AC),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          const Text(
                            'Receive unbiased and personalized'
                            ' course\nrecommendations '
                            'from across India and the\nworld. Filter, '
                            'compare and enrol',
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                    ).copyWith(
                      top: 20.h,
                    ),
                    child: const _TagsScroll(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Choose a subject\nof choice',
                            style: TextStyle(
                              fontFamily: 'Patron',
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              height: 1.4,
                              letterSpacing: 0.3,
                              color: Color(0xff1D1B21),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Color(0xffF5F4F6),
                              ),
                              SizedBox(width: 18),
                              Icon(
                                Icons.arrow_forward,
                                color: Color(0xffF5F4F6),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      const Text(
                        'To find a course with ease, choose from'
                        ' our\ncurated collection.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1,
                          color: Color(0xff50495A),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: 'Under Development',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1D1B21),
                          minimumSize: const Size.fromHeight(40),
                          shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.all(
                            20,
                          ), //content padding inside button
                        ),
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 1,
                            color: Color(0xffF5F4F6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TagsScroll extends StatelessWidget {
  const _TagsScroll();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            RotatedChip(
              name: 'IT & Development',
              chipColor: Colors.black,
              actionIconColor: Colors.white,
              textColor: Colors.white,
              angle: math.pi / 40,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded_white.svg',
              ),
            ),
            RotatedChip(
              name: 'Marketing',
              angle: math.pi / 40,
              chipColor: const Color(0xffF5F4F6),
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Healthcare',
              chipColor: const Color(0xffB5CECD),
              actionIconColor: Colors.white,
              angle: -math.pi / 20,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Science',
              chipColor: const Color(0xffF5F4F6),
              actionIconColor: Colors.white,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Law',
              chipColor: const Color(0xffBACFE8),
              actionIconColor: Colors.white,
              angle: math.pi / 10,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            const SizedBox(width: 36),
            RotatedChip(
              name: 'Human Resources',
              chipColor: const Color(0xffF5F4F6),
              actionIconColor: Colors.white,
              angle: math.pi / 24,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: <Widget>[
            RotatedChip(
              name: 'Business Managenment',
              chipColor: const Color(0xffF5F4F6),
              actionIconColor: Colors.white,
              angle: -math.pi / 40,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Design',
              chipColor: Colors.black,
              actionIconColor: Colors.white,
              textColor: Colors.white,
              angle: -math.pi / 16,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded_white.svg',
              ),
            ),
            const SizedBox(width: 20),
            RotatedChip(
              name: 'Linguistics',
              chipColor: const Color(0xffF5F4F6),
              actionIconColor: Colors.white,
              angle: math.pi / 30,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Engineering',
              chipColor: const Color(0xffDFB19D),
              actionIconColor: Colors.white,
              angle: -math.pi / 24,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Personal Development',
              chipColor: const Color(0xffFEEC8D),
              actionIconColor: Colors.white,
              angle: math.pi / 29,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Arts',
              chipColor: const Color(0xffDFB19D),
              actionIconColor: Colors.white,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'BFSI',
              chipColor: const Color(0xffF5F4F6),
              actionIconColor: Colors.white,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: <Widget>[
            RotatedChip(
              name: 'Data Science',
              chipColor: const Color(0xffFEEC8D),
              actionIconColor: Colors.white,
              angle: -math.pi / 19,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Computer Science',
              chipColor: const Color(0xffDFB19D),
              actionIconColor: Colors.white,
              angle: math.pi / 32,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Teaching and Academics',
              chipColor: const Color(0xffBACFE8),
              actionIconColor: Colors.white,
              angle: math.pi / 40,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Test & Preparation',
              chipColor: const Color(0xffF5F4F6),
              actionIconColor: Colors.white,
              angle: -math.pi / 32,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Travel & Hospitality',
              chipColor: const Color(0xffB5CECD),
              actionIconColor: Colors.white,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
            RotatedChip(
              name: 'Beauty d Wellness',
              chipColor: const Color(0xffFEEC8D),
              actionIconColor: Colors.white,
              angle: -math.pi / 30,
              tailWidget: SvgPicture.asset(
                'assets/icons/ic_arrow_rounded.svg',
              ),
            ),
          ],
        )
      ],
    );
  }
}
