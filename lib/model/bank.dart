import 'package:works_flutter/infra/graphql/api.dart';

class Bank {
  final String id;
  final String name;
  final String code;
  final GraphQLBankAccountType accountType;
  final String accountNumber;

  Bank({required this.id, required this.name, required this.code, required this.accountType, required this.accountNumber});

  String accountTypeText() {
    switch (accountType) {
      case GraphQLBankAccountType.savings:
        return "普通";
      case GraphQLBankAccountType.checking:
        return "当座";
      default:
        return "";
    }
  }
}
