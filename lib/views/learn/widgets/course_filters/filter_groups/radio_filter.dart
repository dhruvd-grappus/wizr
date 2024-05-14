part of 'filter_group.dart';

class RadioFilterGroup extends _FilterGroup<int> {
  RadioFilterGroup({
    required super.title,
    required super.filterValues,
    required this.onSelected,
    super.isExpanded,
    super.key,
  });
  final void Function(List<int>) onSelected;
  final ValueNotifier<int> selectedValue = ValueNotifier(0);
  @override
  Widget expansionBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: ValueListenableBuilder(
        valueListenable: selectedValue,
        builder: (context, selected, __) {
          return Column(
            children: filterValues.map((filterValue) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppRadio(
                      value: filterValue.filter,
                      onChanged: (e) {
                        selectedValue.value = e;
                      },
                      isSelected: selected == filterValue.filter,
                      title: filterValue.customWidget!(filterValue.filter),
                    ),
                    Text(
                      '8484',
                      style: context.textTheme.labelLarge!
                          .withColor(AppColors.purpleDark.withOpacity(0.5)),
                    )
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
