import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({
    required this.name,
    super.key,
    this.backgroundColor = AppColors.purpleBackground,
    this.highlightColor = AppColors.yellow,
    this.animationDuration = const Duration(milliseconds: 250),
    this.showAnimEffect = true,
    this.onTap,
    this.onInfoIconTap,
  });

  final String name;
  final Color backgroundColor;
  final Color highlightColor;
  final Duration animationDuration;
  final bool showAnimEffect;
  final VoidCallback? onTap;
  final VoidCallback? onInfoIconTap;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> with TickerProviderStateMixin {
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
              color: _colorAnim.value,
              height: 106.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        widget.name,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: AppColors.purpleText,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 13.87.h,
                    right: 13.87.w,
                    child: IconButton(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.black,
                      ),
                      onPressed: widget.onInfoIconTap,
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
