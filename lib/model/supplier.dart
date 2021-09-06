import 'package:works_flutter/infra/graphql/api.dart';

class Supplier {
  final String id;
  final String name;
  final int billingAmountIncludeTax;
  final int billingAmountExcludeTax;
  final GraphQLBillingType billingType;
  final String? endYm;
  final String subject;
  final String subjectTemplate;

  Supplier(
      {required this.id,
      required this.name,
      required this.billingAmountIncludeTax,
      required this.billingAmountExcludeTax,
      required this.billingType,
      required this.endYm,
      required this.subject,
      required this.subjectTemplate});

  String endYMString() {
    if (endYm == null) {
      return "";
    }

    final year = endYm!.split("-")[0];
    final month = endYm!.split("-")[1];

    return "$year年$month月";
  }
}

extension GraphQLBillingTypeText on GraphQLBillingType {
  String text() {
    switch (this) {
      case GraphQLBillingType.monthly:
        return "月々";
      case GraphQLBillingType.oneTime:
        return "納品時";
      default:
        return "";
    }
  }
}
