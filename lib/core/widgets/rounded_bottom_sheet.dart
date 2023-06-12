import 'package:flutter/material.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

void showRoundedBottomSheet(BuildContext context, Widget sheet) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    elevation: 0,
    builder: (_) => sheet,
  );
}

class RoundedBottomSheet extends StatelessWidget {
  const RoundedBottomSheet({
    required this.body,
    super.key,
    this.bodyColor = Colors.white,
  });
  final Widget body;
  final Color bodyColor;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: bodyColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: body,
        )
      ],
    );
  }
}
