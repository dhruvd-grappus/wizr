part of 'course_card.dart';

class StarRater extends StatefulWidget {
  const StarRater({
    required this.onRatingChanged,
    super.key,
    this.starSize = 17,
  });

  final int starSize;
  final void Function(int rating) onRatingChanged;

  @override
  State<StarRater> createState() => _StarRaterState();
}

class _StarRaterState extends State<StarRater> {
  int rating = 4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Container(
          height: widget.starSize.h,
          width: widget.starSize.w,
          margin: const EdgeInsets.only(right: 2).responsive(context),
          child: GestureDetector(
            // onTap: () {
            //   rating = rating == 1 ? 0 : index + 1;
            //   setState(() {
            //     rating = rating;
            //   });
            //   widget.onRatingChanged(rating);
            // },
            child: SvgPicture.asset(
              AssetIcons.star,
              // ignore: deprecated_member_use
              color: index == 0 && rating == 0
                  ? AppColors.yellow
                  : index <= rating - 1
                      ? AppColors.yellow
                      : AppColors.greyTextColor,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
