import 'package:flutter/material.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class CurvedTextFormField extends StatefulWidget {
  const CurvedTextFormField({
    required this.controller,
    this.prefix,
    this.focusedBorderColor,
    super.key,
    this.hint,
    this.fillColor,
    this.textInputType = TextInputType.name,
  });
  final TextEditingController controller;
  final String? hint;
  final Widget? prefix;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final TextInputType textInputType;
  @override
  State<CurvedTextFormField> createState() => _CurvedTextFormFieldState();
}

class _CurvedTextFormFieldState extends State<CurvedTextFormField> {
  final FocusNode focusNode = FocusNode();

  bool hasFocus = false;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.toResponsiveHeight(context),
      decoration: BoxDecoration(
        color: widget.fillColor ??
            (hasFocus ? Colors.white : Colors.black.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(12.toResponsiveHeight(context)),
        border: Border.all(
          color: hasFocus
              ? widget.focusedBorderColor ?? Colors.blue
              : AppColors.borderGray,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16).responsive(context),
      child: TextFormField(
        cursorColor: Colors.black,
        autofocus: true,
        focusNode: focusNode,
        keyboardType: widget.textInputType,
        style: context.textTheme.bodyMedium,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          focusColor: Colors.white,
          hintText: widget.hint,
          hintStyle: context.textTheme.labelMedium!
              .withColor(AppColors.purpleText.withOpacity(0.5)),
          prefix: widget.prefix,
        ),
      ),
    );
  }
}

class CurvedDropdownField extends StatefulWidget {
  const CurvedDropdownField({super.key});

  @override
  CurvedDropdownFieldState createState() => CurvedDropdownFieldState();
}

class CurvedDropdownFieldState extends State<CurvedDropdownField> {
  final FocusNode focusNode = FocusNode();

  bool hasFocus = false;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.toResponsiveHeight(context),
      decoration: BoxDecoration(
        color: hasFocus ? Colors.white : Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.toResponsiveHeight(context)),
        border:
            Border.all(color: hasFocus ? Colors.blue : AppColors.borderGray),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16).responsive(context),
      child: DropdownButtonFormField<String>(
        focusNode: focusNode,
        iconEnabledColor: Colors.black,
        value: 'a',
        dropdownColor: Colors.white,
        onChanged: (value) {
          // TODO(dhruv): onChanged
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          focusColor: Colors.white,
        ),
        items: ['a', 'b', 'c']
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e, style: context.textTheme.bodyMedium),
              ),
            )
            .toList(),
      ),
    );
  }
}
