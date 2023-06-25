import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';

class LevelTile extends StatefulWidget {
  const LevelTile({
    required this.label,
    required this.bodyText,
    required this.iconPath,
    super.key,
    this.backgroundColor = AppColors.purpleBackground,
    this.highlightColor = AppColors.yellow,
    this.animationDuration = const Duration(milliseconds: 250),
    this.showAnimEffect = true,
    this.onTap,
  });

  final String label;
  final String bodyText;
  final String iconPath;
  final Color backgroundColor;
  final Color highlightColor;
  final Duration animationDuration;
  final bool showAnimEffect;
  final VoidCallback? onTap;

  @override
  State<LevelTile> createState() => _LevelTileState();
}

class _LevelTileState extends State<LevelTile> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnim;

  /// [return] animationController of check status and animation
  AnimationController? get animationController => _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    // color tween
    _colorAnim = ColorTween(
      begin: widget.backgroundColor,
      end: widget.highlightColor,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: widget.highlightColor,
          child: AnimatedBuilder(
            animation: _colorAnim,
            builder: (context, child) => Ink(
              height: 116.h,
              color: _colorAnim.value,
              padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    widget.iconPath,
                    width: 90,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.label,
                          style: context.textTheme.headlineSmall,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          widget.bodyText,
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void onTap() {
    if (widget.showAnimEffect) {
      _controller.forward();
    }
    widget.onTap?.call();
  }
}
