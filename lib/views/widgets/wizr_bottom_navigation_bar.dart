// ignore_for_file: no_leading_underscores_for_local_identifiers, lines_longer_than_80_chars, cascade_invocations
// ignore_for_file: avoid_returning_widgets

import 'dart:math';
import 'package:flutter/material.dart';

class WizrBottomNavigationBar extends StatelessWidget {
  /// An animated bottom navigation that makes your app looks better
  /// with customizable attrinutes
  ///
  /// Give an [onTabChange] callback to specify what will happen whenever a tab is selected.
  /// [tabs] are of type MoltenTab, use them to display selectable tabs.
  const WizrBottomNavigationBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChange,
    super.key,
    this.barHeight = kBottomNavigationBarHeight,
    this.barColor,
    this.domeHeight = 15.0,
    this.domeWidth = 100,
    this.domeCircleColor,
    this.domeCircleSize = 50.0,
    this.margin = EdgeInsets.zero,
    this.duration,
    this.curve = Curves.linear,
    this.borderColor,
    this.borderSize = 0,
    this.borderRadius,
  });

  /// specify a Height for the bar, Default is kBottomNavigationBarHeight
  final double barHeight;

  /// specify a Height for the Dome above tabs, Default is 15.0
  final double domeHeight;

  /// If [domeWidth] is null, it will be set to 100
  final double domeWidth;

  /// If a null value is passed, the [domeCircleColor] will be Theme.primaryColor
  final Color? domeCircleColor;

  /// The size of the inner circle representing a seleted tab
  ///
  /// Note that [domeCircleSize] must be less than or equal to (barHeight + domeHeight)
  final double domeCircleSize;

  /// Spacing around the bar, Default is [EdgeInsets.zero]
  final EdgeInsets margin;

  /// specify a color to be used as a background color, Default is Theme.bottomAppBarColor
  ///
  /// If the opacity is less than 1, it will automatically be 1
  final Color? barColor;

  /// List of [WizrTab], each wil have an icon as the main widget, selcted color and unselected color
  final List<WizrTab> tabs;

  /// The currently selected tab
  final int selectedIndex;

  /// A callback function that will be triggered whenever a [WizrTab] is clicked, and will return it's index.
  final void Function(int index) onTabChange;

  /// Select a [Curve] value for the dome animation. Default is [Curves.linear]
  final Curve curve;

  /// How long the animation should last, Default is Duration(milliseconds: 150)
  final Duration? duration;

  /// Applied to all 4 border sides, Default is 0
  final double borderSize;

  /// Applied to all border sides
  final Color? borderColor;

  /// How much each angle is curved.
  /// Default is: (topLeft: Radius.circular(10), topRight: Radius.circular(10))
  ///
  /// Note that high raduis values may decrease the dome width.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final _borderRaduis = borderRadius ??
            const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            );

        final _barColor =
            barColor?.withOpacity(1) ?? Theme.of(context).colorScheme.surface;

        final _domeCircleColor = domeCircleColor?.withOpacity(1) ??
            Theme.of(context).colorScheme.primary;

        final _tabWidth =
            (constraints.biggest.width - margin.horizontal) / tabs.length;

        final double _domeWidth = min(domeWidth, _tabWidth);

        assert(
          domeCircleSize <= (barHeight + domeHeight),
          'domeCircleSize must be less than or equal to (barHeight + domeHeight)',
        );
        final selectedTab = tabs[selectedIndex];
        return Container(
          height: barHeight + domeHeight,
          margin: margin,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: barHeight,
                decoration: BoxDecoration(
                  color: _barColor,
                  borderRadius: _borderRaduis,
                  border: Border.all(
                    width: borderSize,
                    color: (borderColor == null || borderSize < 1)
                        ? _barColor
                        : borderColor!,
                  ),
                ),
              ),
              // border for the dome
              _animatedPositionedDome(
                top: 0,
                tabWidth: _tabWidth,
                domeWidth: _domeWidth - _borderRaduis.topRight.x,
                domeHeight: domeHeight,
                domeColor:
                    borderSize > 0 ? (borderColor ?? _barColor) : _barColor,
              ),
              // Actual dome
              _animatedPositionedDome(
                top: borderSize < 1 ? 1 : (borderSize + 0.2),
                tabWidth: _tabWidth,
                domeWidth: _domeWidth - borderSize - _borderRaduis.topRight.x,
                domeHeight: domeHeight,
                domeColor: _barColor,
              ),
              AnimatedPositioned(
                top: 0,
                bottom: selectedTab.title == null ? 0 : 16,
                curve: curve,
                duration: duration ?? const Duration(milliseconds: 150),
                left: _tabWidth * selectedIndex,
                width: _normalizeDomeOnEdge(_tabWidth, selectedIndex),
                child: Center(
                  child: Container(
                    height: domeCircleSize,
                    decoration: BoxDecoration(
                      color: _domeCircleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              ...tabs.asMap().entries.map((entry) {
                final index = entry.key;
                final isSelected = index == selectedIndex;
                final title = entry.value.title;
                return AnimatedPositioned(
                  curve: curve,
                  duration: duration ?? const Duration(milliseconds: 150),
                  top: isSelected ? 0 : domeHeight,
                  bottom: 0,
                  left: _tabWidth * index,
                  width: _normalizeDomeOnEdge(_tabWidth, index),
                  child: Column(
                    children: [
                      Expanded(
                        child: _TabWrapper(
                          tab: entry.value,
                          onTab: () => onTabChange(index),
                          isSelected: isSelected,
                          circleSize: domeCircleSize,
                        ),
                      ),
                      // const SizedBox(height: 8),
                      if (title != null) title,
                      if (title != null) const SizedBox(height: 6),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _animatedPositionedDome({
    required double top,
    required double domeWidth,
    required double domeHeight,
    required Color domeColor,
    required double tabWidth,
  }) {
    return AnimatedPositioned(
      curve: curve,
      duration: duration ?? const Duration(milliseconds: 150),
      top: top,
      left: tabWidth * selectedIndex,
      child: AnimatedContainer(
        duration: duration ?? const Duration(milliseconds: 150),
        width: _normalizeDomeOnEdge(tabWidth, selectedIndex),
        child: Center(
          child: _TabDome(
            color: domeColor,
            height: domeHeight,
            width: domeWidth,
          ),
        ),
      ),
    );
  }

  double _normalizeDomeOnEdge(double x, int index) {
    double newPos;
    if (index == 0) {
      newPos = x + borderSize;
    } else if (index == tabs.length - 1) {
      newPos = x - borderSize;
    } else {
      newPos = x;
    }

    return newPos;
  }
}

/// Wraps the [WizrTab] with extra attributes.
class _TabWrapper extends StatelessWidget {
  const _TabWrapper({
    required this.tab,
    required this.isSelected,
    required this.onTab,
    required this.circleSize,
  });
  final WizrTab tab;
  final bool isSelected;
  final void Function() onTab;
  final double circleSize;
  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(
        color: isSelected
            ? tab.selectedColor ?? Colors.white
            : tab.unselectedColor ?? Colors.grey,
      ),
      child: SizedBox(
        height: circleSize,
        width: circleSize,
        child: Material(
          shape: const CircleBorder(
            side: BorderSide(width: 0, color: Colors.transparent),
          ),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: onTab,
            child: tab.icon,
          ),
        ),
      ),
    );
  }
}

class WizrTab {
  /// This represents each tab in the navigation bar.
  ///
  /// [icon] must not be null
  WizrTab({
    required this.icon,
    this.selectedColor,
    this.title,
    this.unselectedColor,
  });

  /// Can be any [Widget].
  final Widget icon;

  /// title when tab is selected
  final Widget? title;

  /// The [icon] color when the tab is selected
  ///
  /// White if not set
  final Color? selectedColor;

  /// The [icon] color when the tab is unselected
  ///
  /// Grey if not set
  final Color? unselectedColor;
}

class _TabDome extends StatelessWidget {
  const _TabDome({
    required this.color,
    required this.height,
    required this.width,
  });
  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: _DomePainter(color: color),
          size: Size(width, height),
        );
      },
    );
  }
}

class _DomePainter extends CustomPainter {
  _DomePainter({
    required this.color,
  });
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    final path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(
      0,
      size.height,
      size.width,
      size.height,
      size.width,
      size.height,
    );
    path.cubicTo(
      size.width * 0.94,
      size.height,
      size.width * 0.83,
      size.height * 0.65,
      size.width * 0.72,
      size.height * 0.31,
    );
    path.cubicTo(
      size.width * 0.67,
      size.height * 0.12,
      size.width * 0.59,
      size.height * 0.01,
      size.width * 0.51,
      0,
    );
    path.cubicTo(
      size.width * 0.51,
      0,
      size.width * 0.51,
      0,
      size.width * 0.51,
      0,
    );
    path.cubicTo(
      size.width * 0.42,
      -0.01,
      size.width * 0.34,
      size.height * 0.11,
      size.width * 0.27,
      size.height * 0.31,
    );
    path.cubicTo(
      size.width * 0.17,
      size.height * 0.65,
      size.width * 0.06,
      size.height,
      0,
      size.height,
    );
    path.cubicTo(0, size.height, 0, size.height, 0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
