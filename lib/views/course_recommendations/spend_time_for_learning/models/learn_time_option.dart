import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';

enum LearnTimeOption { fullTime, weekend, weekendAndEvenings, flexible }

extension LearnTimeUtil on LearnTimeOption {
  String title(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case LearnTimeOption.fullTime:
        return l10n.fullTime;
      case LearnTimeOption.weekend:
        return l10n.onlyWeekend;
      case LearnTimeOption.weekendAndEvenings:
        return l10n.weekendAndLateEvening;
      case LearnTimeOption.flexible:
        return l10n.imFlexible;
    }
  }

  String description(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case LearnTimeOption.fullTime:
        return l10n.fullTimeDesc;
      case LearnTimeOption.weekend:
        return l10n.onlyWeekendDescription;
      case LearnTimeOption.weekendAndEvenings:
        return l10n.weekendAnEveningDesc;
      case LearnTimeOption.flexible:
        return l10n.imFlexibleDesc;
    }
  }
}
