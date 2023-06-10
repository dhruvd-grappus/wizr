import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SnapNine extends StatelessWidget {
  const SnapNine({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Partner> partners = [
      Partner('assets/images/img_partner1.png', const Color(0xffBCA7E2)),
      Partner('assets/images/img_partner2.png', const Color(0xffF8F5F2)),
      Partner('assets/images/img_partner3.png', const Color(0xffF2E1C2)),
      Partner('assets/images/img_partner4.png', const Color(0xffFEEC8D)),
      Partner('assets/images/img_partner5.png', const Color(0xff46495B)),
      Partner('assets/images/img_partner6.png', const Color(0xffE2803B)),
      Partner('assets/images/img_partner7.png', const Color(0xff2EBCB4)),
      Partner('assets/images/img_partner8.png', const Color(0xffF2F2F2)),
      Partner('assets/images/img_partner9.png', const Color(0xff5B8FCF)),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          const Text(
            'We have',
            style: TextStyle(
              fontFamily: 'Patron',
              fontWeight: FontWeight.w700,
              fontSize: 39,
              height: 1,
              color: Color(0xff292F1E),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'partnered with the',
            style: TextStyle(
              fontFamily: 'Quintus',
              fontWeight: FontWeight.w700,
              fontSize: 40,
              height: 1,
              color: Color(0xffBCBB9D),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'best institutes',
            style: TextStyle(
              fontFamily: 'Patron',
              fontWeight: FontWeight.w700,
              fontSize: 39,
              height: 1,
              color: Color(0xff292F1E),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'We’ve been fortunate to have brilliant alliances\nwith esteemed institutes all over the world',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1,
              color: const Color(0xff292F1E).withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff292F1E),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 11),
            child:GridView.custom(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverStairedGridDelegate(
                pattern: const [
                  StairedGridTile(1.0, 8 / 4),
                  StairedGridTile(0.5, 0.8),
                  StairedGridTile(0.5, 4 / 4),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: 9,
                    (context, index) => PartnerLogoWidget(
                      logo: Image.asset(partners[index].logoPath),
                      background: partners[index].background,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 13),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffDCDFC4),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 11),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'In partnership\nwith',
                  style: TextStyle(
                    fontFamily: 'Patron',
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    height: 1,
                    color: Color(0xff292F1E),
                  ),
                ),
                PartnerLogoWidget(logo: Image.asset(partners[7].logoPath), background: partners[7].background,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PartnerLogoWidget extends StatelessWidget {
  const PartnerLogoWidget({super.key, required this.logo, required this.background});

  final Widget logo;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      width: 108,
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle
      ),
      child: Center(
        child: logo,
      ),
    );
  }
}

class Partner{
  Partner(this.logoPath, this.background);

  final String logoPath;
  final Color background;
}
