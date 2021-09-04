import 'package:works_flutter/infra/graphql/api.dart';

class Invoice {
  final String id;
  final String issueYMD;
  final String paymentDueOnYMD;
  final String invoiceNumber;
  final GraphQLPaymentStatus paymentStatus;
  final GraphQLInvoiceStatus invoiceStatus;
  final String recipientName;
  final String subject;
  final int totalAmount;
  final int tax;

  Invoice(
      {required this.id,
      required this.issueYMD,
      required this.paymentDueOnYMD,
      required this.invoiceNumber,
      required this.paymentStatus,
      required this.invoiceStatus,
      required this.recipientName,
      required this.subject,
      required this.totalAmount,
      required this.tax});

  String paymentStatusText() {
    switch (paymentStatus) {
      case GraphQLPaymentStatus.unPaid:
        return "未支払";
      case GraphQLPaymentStatus.paid:
        return "支払済";
      default:
        return "";
    }
  }

  String invoiceStatusText() {
    switch (invoiceStatus) {
      case GraphQLInvoiceStatus.unSubmitted:
        return "未請求";
      case GraphQLInvoiceStatus.submitted:
        return "請求済";
      default:
        return "";
    }
  }
}
