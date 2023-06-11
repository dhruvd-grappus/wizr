import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingAppBar extends StatelessWidget {
  const LandingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final textTheme = Theme.of(context).textTheme;
    //final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 22),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/icons/wizr_logo.svg'),
          Row(
            children: [
              SvgPicture.asset('assets/icons/ic_search_rounded.svg'),
              const SizedBox(width: 6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                decoration: const BoxDecoration(
                  color: Color(0xFFE1D7C9),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/ic_profile.svg',
                  height: 15,
                  width: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
