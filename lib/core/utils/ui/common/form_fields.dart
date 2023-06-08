import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/typography/text_styles.dart';
import '../../responsive_utils.dart';

class CurvedFormField extends StatefulWidget {
  const CurvedFormField({super.key});

  @override
  State<CurvedFormField> createState() => _CurvedFormFieldState();
}

class _CurvedFormFieldState extends State<CurvedFormField> {
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
      child: TextFormField(
        cursorColor: Colors.black,
        autofocus: true,
        focusNode: focusNode,
        style: context.textTheme.bodyMedium,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          focusColor: Colors.white,
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
