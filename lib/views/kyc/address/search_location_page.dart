import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/views/kyc/address/select_location_sheet.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/temp_map.png',
            height: context.screenHeight,
            width: context.screenWidth,
            fit: BoxFit.fill,
          ),
          const Positioned(
            bottom: 0,
            child: SelectLocationSheet(),
          ),
          Positioned(
            top: 56,
            left: 16,
            child: CustomBackButton(
              onTap: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
