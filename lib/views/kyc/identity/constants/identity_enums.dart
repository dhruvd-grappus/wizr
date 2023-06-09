import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/utils/asset_paths.dart';

enum IdentityProofType {
  drivingLicense(AssetIcons.car),
  voter(AssetIcons.voter),
  passport(AssetIcons.notebook);

  const IdentityProofType(this.icon);
  final String icon;
}

extension IdentityUtil on IdentityProofType {
  String title(BuildContext context) {
    switch (this) {
      case IdentityProofType.drivingLicense:
        return context.l10n.drivingLicense;
      case IdentityProofType.voter:
        return context.l10n.voterId;
      case IdentityProofType.passport:
        return context.l10n.passport;
    }
  }

  String description(BuildContext context) {
    return context.l10n.uploadYourDoc(title(context));
  }

  String tabToUploadDesc(BuildContext context) {
    return context.l10n.tapToUploadDoc(title(context));
  }
}
