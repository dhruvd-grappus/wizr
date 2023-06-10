import 'dart:developer';

import 'package:flutter/material.dart';
part 'custom_layout.dart';

abstract class _SubSwiper extends StatefulWidget {
  final IndexedWidgetBuilder? itemBuilder;
  final int itemCount;
  final int? index;
  final ValueChanged<int>? onIndexChanged;
  final int? duration;
  final Curve curve;
  final double? itemWidth;
  final double? itemHeight;
  final bool loop;
  final Axis? scrollDirection;
  final AxisDirection? axisDirection;

  const _SubSwiper({
    Key? key,
    required this.loop,
    this.itemHeight,
    this.itemWidth,
    this.duration,
    required this.curve,
    this.itemBuilder,
    this.index,
    required this.itemCount,
    this.scrollDirection = Axis.horizontal,
    this.axisDirection = AxisDirection.left,
    this.onIndexChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState();

  int getCorrectIndex(int indexNeedsFix) {
    if (itemCount == 0) return 0;
    var value = indexNeedsFix % itemCount;
    if (value < 0) {
      value += itemCount;
    }
    return value;
  }
}

class StackSwiper extends _SubSwiper {
  const StackSwiper({
    Key? key,
    required Curve curve,
    int? duration,
    ValueChanged<int>? onIndexChanged,
    double? itemHeight,
    double? itemWidth,
    IndexedWidgetBuilder? itemBuilder,
    int? index,
    required bool loop,
    required int itemCount,
    Axis? scrollDirection,
    AxisDirection? axisDirection,
  }) : super(
    loop: loop,
    key: key,
    itemWidth: itemWidth,
    itemHeight: itemHeight,
    itemBuilder: itemBuilder,
    curve: curve,
    duration: duration,
    index: index,
    onIndexChanged: onIndexChanged,
    itemCount: itemCount,
    scrollDirection: scrollDirection,
    axisDirection: axisDirection,
  );

  @override
  State<StatefulWidget> createState() => _StackViewState();
}

class _StackViewState extends _CustomLayoutStateBase<StackSwiper> {
  late List<double> scales;
  late List<double> offsets;
  late List<double> opacity;

  void _updateValues() {
    if (widget.scrollDirection == Axis.horizontal) {
      double space = (_swiperWidth - widget.itemWidth!) / 2;
      offsets = [-space, -space / 3 * 2, -space / 3, 0.0, _swiperWidth];
    } else {
      double space = (_swiperHeight - widget.itemHeight!) / 2;
      offsets = [-space, -space / 3 * 2, -space / 3, 0.0, _swiperHeight];
    }
  }

  @override
  void didUpdateWidget(StackSwiper oldWidget) {
    _updateValues();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void afterRender() {
    super.afterRender();

    //length of the values array below
    _animationCount = 5;

    //Array below this line, '0' index is 1.0 ,witch is the first item show in swiper.
    _startIndex = -3;
    scales = [0.7, 0.8, 0.9, 1.0, 1.0];
    opacity = [0.0, 0.5, 1.0, 1.0, 1.0];

    _updateValues();
  }

  @override
  Widget _buildItem(int i, int realIndex, double animationValue) {
    //double s = _getValue(scales, animationValue, i);
    double f = _getValue(offsets, animationValue, i);
    //double o = _getValue(opacity, animationValue, i);

    final offset = widget.scrollDirection == Axis.horizontal
        ? Offset(f, 0.0)
        : Offset(0.0, f);

    Alignment alignment = widget.scrollDirection == Axis.horizontal
        ? Alignment.centerLeft
        : Alignment.topCenter;

    return Opacity(
      opacity: 1.0,
      child: Transform.translate(
        key: ValueKey<int>(_currentIndex + i),
        offset: offset,
        child: Transform.scale(
          scale: 1.0,
          alignment: alignment,
          child: SizedBox(
            width: widget.itemWidth ?? double.infinity,
            height: widget.itemHeight ?? double.infinity,
            child: widget.itemBuilder!(context, realIndex),
          ),
        ),
      ),
    );
  }
}
