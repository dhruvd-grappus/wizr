import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/utils/asset_paths.dart';

enum PropertyType {
  self(AssetIcons.bank),
  rented(AssetIcons.scroll);

  const PropertyType(this.icon);
  final String icon;
}

extension PropTypeUtil on PropertyType {
  String title(BuildContext context) {
    switch (this) {
      case PropertyType.self:
        return context.l10n.selfOwned;
      case PropertyType.rented:
        return context.l10n.rented;
    }
  }

  String description(BuildContext context) {
    switch (this) {
      case PropertyType.self:
        return context.l10n.selfOwnedDescription;
      case PropertyType.rented:
        return context.l10n.rentedDescription;
    }
  }
}
