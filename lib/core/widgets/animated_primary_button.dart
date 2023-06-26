// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/widgets/rect_clipper.dart';

class AnimatedPrimaryButton extends StatefulWidget {
  const AnimatedPrimaryButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.textStyle,
    this.selectedTextStyle,
    this.height = 50,
    this.width,
    this.isActive,
    this.color = Colors.black,
    this.borderColor = Colors.transparent,
    this.borderRadius = 0,
    this.borderWidth = 0,
    this.selectedColor = AppColors.yellow,
    this.animationDuration = const Duration(milliseconds: 250),
    this.padding,
    this.margin,
    this.transitionType = TransitionType.LEFT_TO_RIGHT,
    this.isReverse = false,
    this.showAnimEffect = true,
  });

  final String text;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final double? height;
  final double? width;
  final bool? isActive;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Color selectedColor;
  final Duration animationDuration;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TransitionType transitionType;
  final bool showAnimEffect;
  final bool isReverse;
  final VoidCallback? onPressed;

  @override
  State<AnimatedPrimaryButton> createState() => _AnimatedPrimaryButtonState();
}

class _AnimatedPrimaryButtonState extends State<AnimatedPrimaryButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> slideAnimation;

  //Animation? scaleAnimation;
  double? slideBegin;
  double? slideEnd;

  /// [return] animationController of check status and animation
  AnimationController? get animationController => _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    if (widget.transitionType == TransitionType.RIGHT_TO_LEFT ||
        widget.transitionType == TransitionType.BOTTOM_TO_TOP) {
      slideBegin = 1.0;
      slideEnd = 0.0;
    } else {
      slideBegin = 0.0;
      slideEnd = 1.0;
    }

    slideAnimation = Tween(begin: slideBegin, end: slideEnd).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );
    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textNormal = Text(
      widget.text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: widget.textStyle ??
          (context.textTheme.labelLarge!.responsiveFont(context).copyWith(
                color: widget.onPressed != null
                    ? Colors.white
                    : AppColors.midnightGreyDark,
              )),
    );

    final textSelected = Text(
      widget.text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: widget.selectedTextStyle ??
          (context.textTheme.labelLarge!.responsiveFont(context).copyWith(
                color: widget.onPressed != null
                    ? Colors.white
                    : AppColors.midnightGreyDark,
              )),
    );

    final body = Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.onPressed != null
                ? widget.color
                : AppColors.midnightGrey,
            border: Border.all(
              color: widget.onPressed != null
                  ? widget.borderColor
                  : Colors.transparent,
              width: widget.borderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          padding: widget.padding ??
              EdgeInsets.fromLTRB(
                18.w,
                13.h,
                18.w,
                13.h,
              ),
          child: Align(
            child: textNormal,
          ),
        ),
        if (widget.onPressed != null)
          AnimatedBuilder(
            animation: _controller,
            child: Container(
              decoration: BoxDecoration(
                color: widget.selectedColor,
                border: Border.all(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              padding: widget.padding ??
                  EdgeInsets.fromLTRB(
                    18.w,
                    13.h,
                    18.w,
                    13.h,
                  ),
              child: Align(
                child: textSelected,
              ),
            ),
            builder: (context, child) {
              return ClipPath(
                clipper:
                    RectClipper(slideAnimation.value, widget.transitionType),
                child: child,
              );
            },
          ),
      ],
    );
    return Container(
      width: widget.width,
      height: widget.height,
      constraints: BoxConstraints(
        minHeight: 40.h,
        minWidth: 63.w,
      ),
      margin: widget.margin,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: body,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  void onPressed() {
    if (widget.showAnimEffect) {
      _controller.forward();
    }
    widget.onPressed?.call();
  }
}

enum TransitionType {
  LEFT_TO_RIGHT,
  RIGHT_TO_LEFT,
  TOP_TO_BOTTOM,
  BOTTOM_TO_TOP,
  CENTER_ROUNDED,
}
