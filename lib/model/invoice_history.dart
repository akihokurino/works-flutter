import 'package:works_flutter/model/invoice.dart';
import 'package:works_flutter/model/supplier.dart';

class InvoiceHistory {
  final String id;
  final Invoice invoice;
  final Supplier supplier;

  InvoiceHistory({required this.id, required this.invoice, required this.supplier});
}
