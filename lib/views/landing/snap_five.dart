import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';

class SnapFive extends StatelessWidget {
  const SnapFive({super.key});

  @override
  Widget build(BuildContext context) {
    final courseList = <String>[
      'assets/images/course_collection.png',
      'assets/images/course_collection2.png',
      'assets/images/course_collection3.png',
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF5F4F6),
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
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '02',
                  style: TextStyle(
                    fontFamily: 'Quintus',
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    height: 1,
                    color: Color(0xffA198AC),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Learn',
                      style: TextStyle(
                        fontFamily: 'Patron',
                        fontWeight: FontWeight.w700,
                        fontSize: 39,
                        height: 1,
                        color: Color(0xff1D1B21),
                      ),
                    ),
                    SizedBox(height: 19),
                    Text(
                      'with Purpose',
                      style: TextStyle(
                        fontFamily: 'Quintus',
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        height: 1,
                        color: Color(0xffA198AC),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Receive unbiased and personalized course\nrecommendations from across India and the\nworld. Filter, compare and enrol',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1,
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
                    color: const Color(0xffA198AC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 11,
                  ).copyWith(top: 80.h),
                  padding: const EdgeInsets.symmetric(vertical: 19)
                      .copyWith(left: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child: Container()),
                      Text(
                        'Explore our course collections',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Patron',
                          fontWeight: FontWeight.w700,
                          fontSize: 25.h,
                          height: 1.4,
                          letterSpacing: 0.3,
                          color: AppColors.purpleBackground,
                        ).responsiveFont(context),
                      ),
                      SizedBox(height: 15.h),
                      const Text(
                        'To find a course with ease, choose from our\ncurated collection.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1,
                          color: AppColors.purpleBackground,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Under Development');
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
                          ),
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
                      const SizedBox(
                        height: kBottomNavigationBarHeight,
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 10,
                  child: SizedBox(
                    height: 242,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: courseList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          courseList[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
