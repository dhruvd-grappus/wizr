import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/widgets/app_checkbox.dart';
import 'package:wizr/core/widgets/app_radio.dart';
part 'checkbox_filter.dart';
part 'radio_filter.dart';

class FilterValue<T> extends StatelessWidget {
  const FilterValue({required this.filter, super.key, this.customWidget});

  final T filter;
  final Widget Function(T)? customWidget;

  @override
  Widget build(BuildContext context) {
    return customWidget?.call(filter) ?? Text(filter.toString());
  }
}

sealed class _FilterGroup<T> extends StatelessWidget {
  const _FilterGroup({
    required this.title,
    required this.filterValues,
    super.key,
    this.isExpanded = false,
  });
  final String title;
  final List<FilterValue<T>> filterValues;
  Widget expansionBody(BuildContext context) {
    throw UnimplementedError(context.toString());
  }

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: isExpanded,
      title: Text(
        title,
        style: context.textTheme.bodyMedium!.withColor(AppColors.purpleText),
      ),
      trailing: SvgPicture.asset(
        AssetIcons.dropDown,
        // ignore: deprecated_member_use
        color: AppColors.purple1,
        width: 20.w,
      ),
      children: [expansionBody(context)],
    );
  }
}
