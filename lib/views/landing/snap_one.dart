import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class SnapOne extends StatelessWidget {
  const SnapOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 13,
            child: Container(
              height: 356.h,
              width: 356,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF0EAE4),
              ),
            ),
          ),
          Align(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 41.h),
                  child: const Column(
                    children: [
                      Text(
                        'Discover',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xff2B1911),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Find your dream career!\nDiscover what you're great at!",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          height: 1.3,
                          color: Color(0xffB7704E),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'assets/images/top_fold.png',
                  height: 250.h,
                  width: context.screenWidth,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Get',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 48,
                        height: 1,
                        color: Color(0xff161C20),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SvgPicture.asset(
                      'assets/icons/wizr_logo.svg',
                      height: 52,
                    ),
                  ],
                ),
                const Text(
                  'everyday!',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                    height: 1.2,
                    letterSpacing: 0.03,
                    color: Color(0xff161C20),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 49),
                  child: ElevatedButton(
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Under Development');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1D1B21),
                      minimumSize: const Size.fromHeight(35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text(
                      'Start Skilling',
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
                SizedBox(height: kBottomNavigationBarHeight + 45.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
