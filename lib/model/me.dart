import 'package:works_flutter/model/bank.dart';
import 'package:works_flutter/model/sender.dart';
import 'package:works_flutter/model/supplier.dart';

class Me {
  final String id;
  final List<Supplier> suppliers;
  final Sender? sender;
  final Bank? bank;

  Me({required this.id, required this.suppliers, required this.sender, required this.bank});
}
