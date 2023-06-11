import 'dart:developer';

import 'package:flutter/material.dart';
part 'custom_layout.dart';

abstract class _SubSwiper extends StatefulWidget {
  const _SubSwiper({
    required this.loop,
    required this.curve,
    required this.itemCount,
    super.key,
    this.itemHeight,
    this.itemWidth,
    this.duration,
    this.itemBuilder,
    this.index,
    this.scrollDirection = Axis.horizontal,
    this.axisDirection = AxisDirection.left,
    this.onIndexChanged,
  });
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
    required super.curve,
    required super.loop,
    required super.itemCount,
    super.key,
    super.duration,
    super.onIndexChanged,
    super.itemHeight,
    super.itemWidth,
    super.itemBuilder,
    super.index,
    super.scrollDirection = null,
    super.axisDirection = null,
  });

  @override
  State<StatefulWidget> createState() => _StackViewState();
}

class _StackViewState extends _CustomLayoutStateBase<StackSwiper> {
  late List<double> scales;
  late List<double> offsets;
  late List<double> opacity;

  void _updateValues() {
    if (widget.scrollDirection == Axis.horizontal) {
      final space = (_swiperWidth - widget.itemWidth!) / 2;
      offsets = [-space, -space / 3 * 2, -space / 3, 0.0, _swiperWidth];
    } else {
      final space = (_swiperHeight - widget.itemHeight!) / 2;
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
    final f = _getValue(offsets, animationValue, i);
    //double o = _getValue(opacity, animationValue, i);

    final offset =
        widget.scrollDirection == Axis.horizontal ? Offset(f, 0) : Offset(0, f);

    final alignment = widget.scrollDirection == Axis.horizontal
        ? Alignment.centerLeft
        : Alignment.topCenter;

    return Opacity(
      opacity: 1,
      child: Transform.translate(
        key: ValueKey<int>(_currentIndex + i),
        offset: offset,
        child: Transform.scale(
          scale: 1,
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
