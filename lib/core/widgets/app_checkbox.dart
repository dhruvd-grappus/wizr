import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    required this.onChanged,
    this.value = true,
    super.key,
    this.widget,
    this.text,
    this.borderColor,
    this.uncheckedColor,
  });

  final Widget? widget;
  final String? text;
  final ValueChanged<bool> onChanged;
  final bool value;
  final Color? borderColor;
  final Color? uncheckedColor;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool _isChecked = true;

  @override
  void initState() {
    _isChecked = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChanged(
          _isChecked,
        ); // Notify the parent about the selected value
      },
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 18.toResponsiveWidth(context),
            height: 18.toResponsiveHeight(context),
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              border: Border.all(
                color: _isChecked
                    ? AppColors.yellow
                    : widget.borderColor ?? AppColors.yellow,
              ),
              color: _isChecked
                  ? AppColors.yellow
                  : widget.uncheckedColor ?? AppColors.offWhiteBackground,
              borderRadius: BorderRadius.circular(6),
            ),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              firstChild: _isChecked
                  ? SvgPicture.asset(
                      AssetIcons.checkbox,
                      width: 16.toResponsiveWidth(context),
                      height: 16.toResponsiveHeight(context),
                    )
                  : Container(),
              secondChild: !_isChecked
                  ? SvgPicture.asset(
                      AssetIcons.checkbox,
                      width: 16.toResponsiveWidth(context),
                      height: 16.toResponsiveHeight(context),
                    )
                  : Container(),
              crossFadeState: CrossFadeState.showFirst,
            ),
          ),
          const SizedBox(width: 8),
          if (widget.widget != null)
            widget.widget!
          else
            Text(
              widget.text!,
              style: context.textTheme.labelSmall?.opacity50,
            )
        ],
      ),
    );
  }
}
