import 'package:flutter/material.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';

class TabHeader extends StatefulWidget {
  TabHeader({
    required this.tabTiles,
    required this.width,
    required this.onChanged,
    super.key,
  }) : assert(tabTiles.isNotEmpty, 'Tab List cannot be empty');
  final List<String> tabTiles;
  final double width;
  final ValueChanged<String> onChanged;

  @override
  State<TabHeader> createState() => _TabHeaderState();
}

class _TabHeaderState extends State<TabHeader> {
  String selectedTab = '';

  @override
  void initState() {
    selectedTab = widget.tabTiles[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          widget.tabTiles.length,
          (index) {
            return InkWell(
              onTap: () {
                if (widget.tabTiles[index] != selectedTab) {
                  setState(() {
                    selectedTab = widget.tabTiles[index];
                  });
                  widget.onChanged(selectedTab);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                width: (widget.width / widget.tabTiles.length) - 8,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: widget.tabTiles[index] == selectedTab
                      ? AppColors.tabColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                  child: Text(
                    widget.tabTiles[index],
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: context.textTheme.labelLarge?.withColor(
                      widget.tabTiles[index] == selectedTab
                          ? AppColors.white
                          : AppColors.greyTextColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
