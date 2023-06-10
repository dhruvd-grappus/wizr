import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnapSix extends StatelessWidget {
  const SnapSix({super.key});

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
                  '03',
                  style: TextStyle(
                    fontFamily: 'Quintus',
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    height: 1,
                    color: Color(0xff5B8FCF),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Finance',
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
                      'your Goals',
                      style: TextStyle(
                        fontFamily: 'Quintus',
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        height: 1,
                        color: Color(0xff5B8FCF),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Break free from financial limitations! Unlock\nyour success with an instant credit line for\ncourses and productivity tools.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1,
                        color: Color(0xff102031),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 34),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff5B8FCF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 58,
                    right: 34,
                    child: Image.asset(
                      'assets/images/group_finance.png',
                      width: 242,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      top: 22,
                    ),
                    child: Text(
                      '01  Credit Line',
                      style: TextStyle(
                        fontFamily: 'Patron',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        height: 1.4,
                        letterSpacing: 0.3,
                        color: Color(0xff102031),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 22,
                    right: 25,
                    bottom: 84,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Know your\nCredit Line',
                          style: TextStyle(
                            fontFamily: 'Patron',
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            height: 1.4,
                            letterSpacing: 0.3,
                            color: Color(0xffF5F4F6),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Unlock financial flexibility and convenience with\na credit line get access to funds whenever you\nneed them!',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1,
                            color: Color(0xffffffff),
                          ),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: 'Under Development');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1D1B21),
                            shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.fromLTRB(
                              40,
                              20,
                              40,
                              20,
                            ), //content padding inside button
                          ),
                          child: const Text(
                            'Check Now',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xffF5F4F6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
