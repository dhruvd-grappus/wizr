part of 'filter_group.dart';

class CheckboxFilterGroup extends _FilterGroup<String> {
  CheckboxFilterGroup({
    required super.title,
    required super.filterValues,
    required this.onSelected,
    super.isExpanded,
    super.key,
  });
  final void Function(List<String>) onSelected;
  final ValueNotifier<String> selectedValues = ValueNotifier('');
  @override
  Widget expansionBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: filterValues.map((filterValue) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 18.h),
                child: AppCheckBox(
                  borderColor: AppColors.purple1,
                  uncheckedColor: Colors.white,
                  value: false,
                  widget: Text(
                    filterValue.filter,
                    style: context.textTheme.bodyMedium!
                        .withColor(AppColors.purpleText),
                  ),
                  onChanged: (_) {
                    debugPrint('callback');
                  },
                ),
              ),
              Text(
                '8484',
                style: context.textTheme.labelLarge!
                    .withColor(AppColors.purpleDark.withOpacity(0.5)),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
