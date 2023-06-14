import 'package:flutter/material.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class TabHeader extends StatefulWidget {
  TabHeader({
    required this.tabTiles,
    required this.width,
    required this.onChanged,
    this.fontSize,
    super.key,
  }) : assert(tabTiles.isNotEmpty, 'Tab List cannot be empty');
  final List<String> tabTiles;
  final double width;
  final ValueChanged<String> onChanged;
  final double? fontSize;

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
      padding: const EdgeInsets.all(4)
          .copyWith(right: 0.02 * widget.width)
          .responsive(context),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          widget.tabTiles.length,
          (index) {
            return Expanded(
              child: Container(
                margin: widget.tabTiles.length > 2
                    ? null
                    : EdgeInsets.only(
                        right: marginForPosition(index),
                      ).responsive(context),
                child: InkWell(
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: widget.tabTiles[index] == selectedTab
                          ? AppColors.financeBlueDark
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20)
                          .responsive(context),
                      child: Center(
                        child: Text(
                          widget.tabTiles[index],
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: context.textTheme.labelLarge
                              ?.withColor(
                                widget.tabTiles[index] == selectedTab
                                    ? AppColors.white
                                    : AppColors.greyTextColor,
                              )
                              .copyWith(fontSize: widget.fontSize)
                              .responsiveFont(context),
                        ),
                      ),
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

  double marginForPosition(int index) {
    return index != widget.tabTiles.length - 1 ? (0.08 * widget.width) : 0;
  }
}
