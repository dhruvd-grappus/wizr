import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnapSeven extends StatelessWidget {
  const SnapSeven({super.key});

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
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '04',
                  style: TextStyle(
                    fontFamily: 'Quintus',
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    height: 1,
                    color: Color(0xffBCBB9D),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grow',
                      style: TextStyle(
                        fontFamily: 'Patron',
                        fontWeight: FontWeight.w700,
                        fontSize: 39,
                        height: 1,
                        color: Color(0xff1D1B21),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'beyond limits',
                      style: TextStyle(
                        fontFamily: 'Quintus',
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        height: 1,
                        color: Color(0xffBCBB9D),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Fuel your growth with inspiring content!\nListen to podcasts, receive mentor advice,\nand gain insights from our blog.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1,
                        color: Color(0xff292F1E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff292F1E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 290,
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(left: 6, right: 14),
                          child: Image.asset('assets/images/img_lerner.png'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/wizr_logo.svg',
                              colorFilter: const ColorFilter.mode(
                                Color(0xffBCBB9D),
                                BlendMode.srcIn,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Learners',
                                style: TextStyle(
                                  fontFamily: 'Patron',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  height: 0.9,
                                  letterSpacing: 0.2,
                                  color: Color(0xffDCDFC4),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: 'Under Development');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffCBFB62),
                            shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.fromLTRB(
                              20,
                              15,
                              20,
                              15,
                            ), //content padding inside button
                          ),
                          child: const Text(
                            'Watch more',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff292F1E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19)
                        .copyWith(top: 24),
                    child: const Text(
                      'Listen to skilling certification holders share their\ntransformative stories.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1,
                        color: Color(0xffDCDFC4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /**/
        ],
      ),
    );
  }
}
