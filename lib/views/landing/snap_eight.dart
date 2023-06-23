import 'package:flutter/material.dart';

class SnapEight extends StatelessWidget {
  const SnapEight({super.key});

  @override
  Widget build(BuildContext context) {
    final wizrAchieves = <String>[
      'assets/images/img_achieve1.png',
      'assets/images/img_achieve2.png',
      'assets/images/img_achieve3.png',
      'assets/images/img_achieve4.png',
      'assets/images/img_achieve5.png',
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff292F1E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        children: [
          RichText(
            text: const TextSpan(
              text: 'Life ',
              style: TextStyle(
                fontFamily: 'Quintus',
                fontWeight: FontWeight.w700,
                fontSize: 40,
                height: 1,
                color: Color(0xffCBFB62),
              ),
              children: [
                TextSpan(
                  text: 'at WiZR',
                  style: TextStyle(
                    fontFamily: 'Patron',
                    fontWeight: FontWeight.w700,
                    fontSize: 39,
                    height: 1,
                    color: Color(0xffF8F5F2),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'WiZR has been doing a bunch of things\nand stuff and here '
            "are a bunch of stats\nthat'll eventually need some",
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1,
              color: Color(0xffDCDFC4),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 300,
            child: Image.asset(
              'assets/images/img_life_at_wizr.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: wizrAchieves.length,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Image.asset(wizrAchieves[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
