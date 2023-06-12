import 'package:flutter/material.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class ORDivider extends StatelessWidget {
  const ORDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: 117.toResponsiveWidth(context),
          color: Colors.grey,
        ),
        SizedBox(
          width: 12.toResponsiveWidth(context),
        ),
        Text(
          'OR',
          style: context.textTheme.labelLarge!.responsiveFont(context).black,
        ),
        SizedBox(
          width: 12.toResponsiveWidth(context),
        ),
        Container(
          height: 1,
          width: 117.toResponsiveWidth(context),
          color: Colors.grey,
        ),
      ],
    );
  }
}
