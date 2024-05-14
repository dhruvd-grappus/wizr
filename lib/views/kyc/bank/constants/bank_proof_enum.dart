import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';

enum BankProofType { cancelledCheque, passbook, statement }

extension BankUtitl on BankProofType {
  String title(BuildContext context) {
    switch (this) {
      case BankProofType.cancelledCheque:
        return context.l10n.cancelledCheque;
      case BankProofType.passbook:
        return context.l10n.bankPassbook;
      case BankProofType.statement:
        return context.l10n.bankStatement;
    }
  }

  String description(BuildContext context) {
    return context.l10n.uploadYourDoc(title(context));
  }

  String tabToUploadDesc(BuildContext context) {
    return context.l10n.tapToUploadDoc(title(context));
  }
}
