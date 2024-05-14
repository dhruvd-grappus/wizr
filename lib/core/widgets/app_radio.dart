import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/core/theme/app_colors.dart';

class AppRadio<T> extends StatefulWidget {
  const AppRadio({
    required this.value,
    required this.onChanged,
    required this.isSelected,
    required this.title,
    super.key,
  });
  final bool isSelected;
  final T value;
  final void Function(T) onChanged;
  final Widget title;

  @override
  State<AppRadio<T>> createState() => _AppRadioState<T>();
}

class _AppRadioState<T> extends State<AppRadio<T>> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey(widget.value),
      behavior: HitTestBehavior.translucent,
      onTap: () {
        widget.onChanged(
          widget.value,
        ); // Notify the parent about the selected value
      },
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 15.w,
            height: 15.h,
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.isSelected ? AppColors.yellow : AppColors.purple1,
              ),
              color: widget.isSelected ? AppColors.yellow : AppColors.white,
              shape: BoxShape.circle,
            ),
            child: widget.isSelected
                ? Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  )
                : Container(),
          ),
          const SizedBox(width: 8),
          widget.title,
        ],
      ),
    );
  }
}
