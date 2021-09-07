// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetMe$Query$Me$SupplierConnection$SupplierEdge$Supplier
    extends JsonSerializable with EquatableMixin {
  GetMe$Query$Me$SupplierConnection$SupplierEdge$Supplier();

  factory GetMe$Query$Me$SupplierConnection$SupplierEdge$Supplier.fromJson(
          Map<String, dynamic> json) =>
      _$GetMe$Query$Me$SupplierConnection$SupplierEdge$SupplierFromJson(json);

  late String id;

  late String name;

  late int billingAmountIncludeTax;

  late int billingAmountExcludeTax;

  @JsonKey(unknownEnumValue: GraphQLBillingType.artemisUnknown)
  late GraphQLBillingType billingType;

  String? endYm;

  late String subject;

  late String subjectTemplate;

  @override
  List<Object?> get props => [
        id,
        name,
        billingAmountIncludeTax,
        billingAmountExcludeTax,
        billingType,
        endYm,
        subject,
        subjectTemplate
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetMe$Query$Me$SupplierConnection$SupplierEdge$SupplierToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMe$Query$Me$SupplierConnection$SupplierEdge extends JsonSerializable
    with EquatableMixin {
  GetMe$Query$Me$SupplierConnection$SupplierEdge();

  factory GetMe$Query$Me$SupplierConnection$SupplierEdge.fromJson(
          Map<String, dynamic> json) =>
      _$GetMe$Query$Me$SupplierConnection$SupplierEdgeFromJson(json);

  late GetMe$Query$Me$SupplierConnection$SupplierEdge$Supplier node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetMe$Query$Me$SupplierConnection$SupplierEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMe$Query$Me$SupplierConnection extends JsonSerializable
    with EquatableMixin {
  GetMe$Query$Me$SupplierConnection();

  factory GetMe$Query$Me$SupplierConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GetMe$Query$Me$SupplierConnectionFromJson(json);

  late List<GetMe$Query$Me$SupplierConnection$SupplierEdge> edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetMe$Query$Me$SupplierConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMe$Query$Me$Sender extends JsonSerializable with EquatableMixin {
  GetMe$Query$Me$Sender();

  factory GetMe$Query$Me$Sender.fromJson(Map<String, dynamic> json) =>
      _$GetMe$Query$Me$SenderFromJson(json);

  late String id;

  late String name;

  late String email;

  late String tel;

  late String postalCode;

  late String address;

  @override
  List<Object?> get props => [id, name, email, tel, postalCode, address];
  @override
  Map<String, dynamic> toJson() => _$GetMe$Query$Me$SenderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMe$Query$Me$Bank extends JsonSerializable with EquatableMixin {
  GetMe$Query$Me$Bank();

  factory GetMe$Query$Me$Bank.fromJson(Map<String, dynamic> json) =>
      _$GetMe$Query$Me$BankFromJson(json);

  late String id;

  late String name;

  late String code;

  @JsonKey(unknownEnumValue: GraphQLBankAccountType.artemisUnknown)
  late GraphQLBankAccountType accountType;

  late String accountNumber;

  @override
  List<Object?> get props => [id, name, code, accountType, accountNumber];
  @override
  Map<String, dynamic> toJson() => _$GetMe$Query$Me$BankToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMe$Query$Me extends JsonSerializable with EquatableMixin {
  GetMe$Query$Me();

  factory GetMe$Query$Me.fromJson(Map<String, dynamic> json) =>
      _$GetMe$Query$MeFromJson(json);

  late String id;

  late GetMe$Query$Me$SupplierConnection supplierList;

  GetMe$Query$Me$Sender? sender;

  GetMe$Query$Me$Bank? bank;

  @override
  List<Object?> get props => [id, supplierList, sender, bank];
  @override
  Map<String, dynamic> toJson() => _$GetMe$Query$MeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMe$Query extends JsonSerializable with EquatableMixin {
  GetMe$Query();

  factory GetMe$Query.fromJson(Map<String, dynamic> json) =>
      _$GetMe$QueryFromJson(json);

  late GetMe$Query$Me me;

  @override
  List<Object?> get props => [me];
  @override
  Map<String, dynamic> toJson() => _$GetMe$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$Invoice
    extends JsonSerializable with EquatableMixin {
  GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$Invoice();

  factory GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$Invoice.fromJson(
          Map<String, dynamic> json) =>
      _$GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$InvoiceFromJson(
          json);

  late String id;

  late String issueYmd;

  late String paymentDueOnYmd;

  late String invoiceNumber;

  @JsonKey(unknownEnumValue: GraphQLPaymentStatus.artemisUnknown)
  late GraphQLPaymentStatus paymentStatus;

  @JsonKey(unknownEnumValue: GraphQLInvoiceStatus.artemisUnknown)
  late GraphQLInvoiceStatus invoiceStatus;

  late String recipientName;

  late String subject;

  late int totalAmount;

  late int tax;

  @override
  List<Object?> get props => [
        id,
        issueYmd,
        paymentDueOnYmd,
        invoiceNumber,
        paymentStatus,
        invoiceStatus,
        recipientName,
        subject,
        totalAmount,
        tax
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$InvoiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceList$Query$InvoiceConnection$InvoiceEdge
    extends JsonSerializable with EquatableMixin {
  GetInvoiceList$Query$InvoiceConnection$InvoiceEdge();

  factory GetInvoiceList$Query$InvoiceConnection$InvoiceEdge.fromJson(
          Map<String, dynamic> json) =>
      _$GetInvoiceList$Query$InvoiceConnection$InvoiceEdgeFromJson(json);

  late GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$Invoice node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetInvoiceList$Query$InvoiceConnection$InvoiceEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceList$Query$InvoiceConnection extends JsonSerializable
    with EquatableMixin {
  GetInvoiceList$Query$InvoiceConnection();

  factory GetInvoiceList$Query$InvoiceConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GetInvoiceList$Query$InvoiceConnectionFromJson(json);

  late List<GetInvoiceList$Query$InvoiceConnection$InvoiceEdge> edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetInvoiceList$Query$InvoiceConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceList$Query extends JsonSerializable with EquatableMixin {
  GetInvoiceList$Query();

  factory GetInvoiceList$Query.fromJson(Map<String, dynamic> json) =>
      _$GetInvoiceList$QueryFromJson(json);

  late GetInvoiceList$Query$InvoiceConnection invoiceList;

  @override
  List<Object?> get props => [invoiceList];
  @override
  Map<String, dynamic> toJson() => _$GetInvoiceList$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Invoice
    extends JsonSerializable with EquatableMixin {
  GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Invoice();

  factory GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Invoice.fromJson(
          Map<String, dynamic> json) =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$InvoiceFromJson(
          json);

  late String id;

  late String issueYmd;

  late String paymentDueOnYmd;

  late String invoiceNumber;

  @JsonKey(unknownEnumValue: GraphQLPaymentStatus.artemisUnknown)
  late GraphQLPaymentStatus paymentStatus;

  @JsonKey(unknownEnumValue: GraphQLInvoiceStatus.artemisUnknown)
  late GraphQLInvoiceStatus invoiceStatus;

  late String recipientName;

  late String subject;

  late int totalAmount;

  late int tax;

  @override
  List<Object?> get props => [
        id,
        issueYmd,
        paymentDueOnYmd,
        invoiceNumber,
        paymentStatus,
        invoiceStatus,
        recipientName,
        subject,
        totalAmount,
        tax
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$InvoiceToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Supplier
    extends JsonSerializable with EquatableMixin {
  GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Supplier();

  factory GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Supplier.fromJson(
          Map<String, dynamic> json) =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$SupplierFromJson(
          json);

  late String id;

  late String name;

  late int billingAmountIncludeTax;

  late int billingAmountExcludeTax;

  @JsonKey(unknownEnumValue: GraphQLBillingType.artemisUnknown)
  late GraphQLBillingType billingType;

  String? endYm;

  late String subject;

  late String subjectTemplate;

  @override
  List<Object?> get props => [
        id,
        name,
        billingAmountIncludeTax,
        billingAmountExcludeTax,
        billingType,
        endYm,
        subject,
        subjectTemplate
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$SupplierToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory
    extends JsonSerializable with EquatableMixin {
  GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory();

  factory GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory.fromJson(
          Map<String, dynamic> json) =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistoryFromJson(
          json);

  late GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Invoice
      invoice;

  late GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Supplier
      supplier;

  @override
  List<Object?> get props => [invoice, supplier];
  @override
  Map<String, dynamic> toJson() =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistoryToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge
    extends JsonSerializable with EquatableMixin {
  GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge();

  factory GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge.fromJson(
          Map<String, dynamic> json) =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdgeFromJson(
          json);

  late GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory
      node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdgeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceHistoryList$Query$InvoiceHistoryConnection
    extends JsonSerializable with EquatableMixin {
  GetInvoiceHistoryList$Query$InvoiceHistoryConnection();

  factory GetInvoiceHistoryList$Query$InvoiceHistoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnectionFromJson(json);

  late List<
          GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge>
      edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetInvoiceHistoryList$Query$InvoiceHistoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceHistoryList$Query extends JsonSerializable with EquatableMixin {
  GetInvoiceHistoryList$Query();

  factory GetInvoiceHistoryList$Query.fromJson(Map<String, dynamic> json) =>
      _$GetInvoiceHistoryList$QueryFromJson(json);

  late GetInvoiceHistoryList$Query$InvoiceHistoryConnection invoiceHistoryList;

  @override
  List<Object?> get props => [invoiceHistoryList];
  @override
  Map<String, dynamic> toJson() => _$GetInvoiceHistoryList$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Authenticate$Mutation$Me extends JsonSerializable with EquatableMixin {
  Authenticate$Mutation$Me();

  factory Authenticate$Mutation$Me.fromJson(Map<String, dynamic> json) =>
      _$Authenticate$Mutation$MeFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$Authenticate$Mutation$MeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Authenticate$Mutation extends JsonSerializable with EquatableMixin {
  Authenticate$Mutation();

  factory Authenticate$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Authenticate$MutationFromJson(json);

  late Authenticate$Mutation$Me authenticate;

  @override
  List<Object?> get props => [authenticate];
  @override
  Map<String, dynamic> toJson() => _$Authenticate$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateSupplier$Mutation$Supplier extends JsonSerializable
    with EquatableMixin {
  CreateSupplier$Mutation$Supplier();

  factory CreateSupplier$Mutation$Supplier.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSupplier$Mutation$SupplierFromJson(json);

  late String id;

  late String name;

  late int billingAmountIncludeTax;

  late int billingAmountExcludeTax;

  @JsonKey(unknownEnumValue: GraphQLBillingType.artemisUnknown)
  late GraphQLBillingType billingType;

  String? endYm;

  late String subject;

  late String subjectTemplate;

  @override
  List<Object?> get props => [
        id,
        name,
        billingAmountIncludeTax,
        billingAmountExcludeTax,
        billingType,
        endYm,
        subject,
        subjectTemplate
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$CreateSupplier$Mutation$SupplierToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateSupplier$Mutation extends JsonSerializable with EquatableMixin {
  CreateSupplier$Mutation();

  factory CreateSupplier$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateSupplier$MutationFromJson(json);

  late CreateSupplier$Mutation$Supplier createSupplier;

  @override
  List<Object?> get props => [createSupplier];
  @override
  Map<String, dynamic> toJson() => _$CreateSupplier$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateSupplier$Mutation$Supplier extends JsonSerializable
    with EquatableMixin {
  UpdateSupplier$Mutation$Supplier();

  factory UpdateSupplier$Mutation$Supplier.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateSupplier$Mutation$SupplierFromJson(json);

  late String id;

  late String name;

  late int billingAmountIncludeTax;

  late int billingAmountExcludeTax;

  @JsonKey(unknownEnumValue: GraphQLBillingType.artemisUnknown)
  late GraphQLBillingType billingType;

  String? endYm;

  late String subject;

  late String subjectTemplate;

  @override
  List<Object?> get props => [
        id,
        name,
        billingAmountIncludeTax,
        billingAmountExcludeTax,
        billingType,
        endYm,
        subject,
        subjectTemplate
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateSupplier$Mutation$SupplierToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateSupplier$Mutation extends JsonSerializable with EquatableMixin {
  UpdateSupplier$Mutation();

  factory UpdateSupplier$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateSupplier$MutationFromJson(json);

  late UpdateSupplier$Mutation$Supplier updateSupplier;

  @override
  List<Object?> get props => [updateSupplier];
  @override
  Map<String, dynamic> toJson() => _$UpdateSupplier$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterBank$Mutation$Bank extends JsonSerializable with EquatableMixin {
  RegisterBank$Mutation$Bank();

  factory RegisterBank$Mutation$Bank.fromJson(Map<String, dynamic> json) =>
      _$RegisterBank$Mutation$BankFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$RegisterBank$Mutation$BankToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterBank$Mutation extends JsonSerializable with EquatableMixin {
  RegisterBank$Mutation();

  factory RegisterBank$Mutation.fromJson(Map<String, dynamic> json) =>
      _$RegisterBank$MutationFromJson(json);

  late RegisterBank$Mutation$Bank registerBank;

  @override
  List<Object?> get props => [registerBank];
  @override
  Map<String, dynamic> toJson() => _$RegisterBank$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterSender$Mutation$Sender extends JsonSerializable
    with EquatableMixin {
  RegisterSender$Mutation$Sender();

  factory RegisterSender$Mutation$Sender.fromJson(Map<String, dynamic> json) =>
      _$RegisterSender$Mutation$SenderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$RegisterSender$Mutation$SenderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterSender$Mutation extends JsonSerializable with EquatableMixin {
  RegisterSender$Mutation();

  factory RegisterSender$Mutation.fromJson(Map<String, dynamic> json) =>
      _$RegisterSender$MutationFromJson(json);

  late RegisterSender$Mutation$Sender registerSender;

  @override
  List<Object?> get props => [registerSender];
  @override
  Map<String, dynamic> toJson() => _$RegisterSender$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteBank$Mutation extends JsonSerializable with EquatableMixin {
  DeleteBank$Mutation();

  factory DeleteBank$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteBank$MutationFromJson(json);

  late bool deleteBank;

  @override
  List<Object?> get props => [deleteBank];
  @override
  Map<String, dynamic> toJson() => _$DeleteBank$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteSender$Mutation extends JsonSerializable with EquatableMixin {
  DeleteSender$Mutation();

  factory DeleteSender$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteSender$MutationFromJson(json);

  late bool deleteSender;

  @override
  List<Object?> get props => [deleteSender];
  @override
  Map<String, dynamic> toJson() => _$DeleteSender$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteSupplier$Mutation extends JsonSerializable with EquatableMixin {
  DeleteSupplier$Mutation();

  factory DeleteSupplier$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteSupplier$MutationFromJson(json);

  late bool deleteSupplier;

  @override
  List<Object?> get props => [deleteSupplier];
  @override
  Map<String, dynamic> toJson() => _$DeleteSupplier$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DownloadInvoicePDF$Mutation extends JsonSerializable with EquatableMixin {
  DownloadInvoicePDF$Mutation();

  factory DownloadInvoicePDF$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DownloadInvoicePDF$MutationFromJson(json);

  late String downloadInvoicePdf;

  @override
  List<Object?> get props => [downloadInvoicePdf];
  @override
  Map<String, dynamic> toJson() => _$DownloadInvoicePDF$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteInvoice$Mutation extends JsonSerializable with EquatableMixin {
  DeleteInvoice$Mutation();

  factory DeleteInvoice$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteInvoice$MutationFromJson(json);

  late bool deleteInvoice;

  @override
  List<Object?> get props => [deleteInvoice];
  @override
  Map<String, dynamic> toJson() => _$DeleteInvoice$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConnectMisoca$Mutation extends JsonSerializable with EquatableMixin {
  ConnectMisoca$Mutation();

  factory ConnectMisoca$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ConnectMisoca$MutationFromJson(json);

  late bool connectMisoca;

  @override
  List<Object?> get props => [connectMisoca];
  @override
  Map<String, dynamic> toJson() => _$ConnectMisoca$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RefreshMisoca$Mutation extends JsonSerializable with EquatableMixin {
  RefreshMisoca$Mutation();

  factory RefreshMisoca$Mutation.fromJson(Map<String, dynamic> json) =>
      _$RefreshMisoca$MutationFromJson(json);

  late bool refreshMisoca;

  @override
  List<Object?> get props => [refreshMisoca];
  @override
  Map<String, dynamic> toJson() => _$RefreshMisoca$MutationToJson(this);
}

enum GraphQLBillingType {
  @JsonValue('Monthly')
  monthly,
  @JsonValue('OneTime')
  oneTime,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum GraphQLBankAccountType {
  @JsonValue('Savings')
  savings,
  @JsonValue('Checking')
  checking,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum GraphQLPaymentStatus {
  @JsonValue('UnPaid')
  unPaid,
  @JsonValue('Paid')
  paid,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum GraphQLInvoiceStatus {
  @JsonValue('UnSubmitted')
  unSubmitted,
  @JsonValue('Submitted')
  submitted,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
final GET_ME_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMe'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'me'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'supplierList'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'edges'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'node'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'name'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(
                                        value: 'billingAmountIncludeTax'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(
                                        value: 'billingAmountExcludeTax'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'billingType'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'endYm'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'subject'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'subjectTemplate'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ]))
                        ]))
                  ])),
              FieldNode(
                  name: NameNode(value: 'sender'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'tel'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'postalCode'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'bank'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'code'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'accountType'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'accountNumber'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class GetMeQuery extends GraphQLQuery<GetMe$Query, JsonSerializable> {
  GetMeQuery();

  @override
  final DocumentNode document = GET_ME_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetMe';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetMe$Query parse(Map<String, dynamic> json) => GetMe$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetInvoiceListArguments extends JsonSerializable with EquatableMixin {
  GetInvoiceListArguments({required this.supplierId});

  @override
  factory GetInvoiceListArguments.fromJson(Map<String, dynamic> json) =>
      _$GetInvoiceListArgumentsFromJson(json);

  late String supplierId;

  @override
  List<Object?> get props => [supplierId];
  @override
  Map<String, dynamic> toJson() => _$GetInvoiceListArgumentsToJson(this);
}

final GET_INVOICE_LIST_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetInvoiceList'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'supplierId')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'invoiceList'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'supplierId'),
                  value: VariableNode(name: NameNode(value: 'supplierId')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'issueYmd'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'paymentDueOnYmd'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'invoiceNumber'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'paymentStatus'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'invoiceStatus'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'recipientName'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'subject'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'totalAmount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'tax'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ]))
            ]))
      ]))
]);

class GetInvoiceListQuery
    extends GraphQLQuery<GetInvoiceList$Query, GetInvoiceListArguments> {
  GetInvoiceListQuery({required this.variables});

  @override
  final DocumentNode document = GET_INVOICE_LIST_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetInvoiceList';

  @override
  final GetInvoiceListArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetInvoiceList$Query parse(Map<String, dynamic> json) =>
      GetInvoiceList$Query.fromJson(json);
}

final GET_INVOICE_HISTORY_LIST_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetInvoiceHistoryList'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'invoiceHistoryList'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'invoice'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'issueYmd'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'paymentDueOnYmd'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'invoiceNumber'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'paymentStatus'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'invoiceStatus'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'recipientName'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'subject'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'totalAmount'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'tax'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ])),
                          FieldNode(
                              name: NameNode(value: 'supplier'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'name'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(
                                        value: 'billingAmountIncludeTax'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(
                                        value: 'billingAmountExcludeTax'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'billingType'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'endYm'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'subject'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'subjectTemplate'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ]))
                        ]))
                  ]))
            ]))
      ]))
]);

class GetInvoiceHistoryListQuery
    extends GraphQLQuery<GetInvoiceHistoryList$Query, JsonSerializable> {
  GetInvoiceHistoryListQuery();

  @override
  final DocumentNode document = GET_INVOICE_HISTORY_LIST_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetInvoiceHistoryList';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetInvoiceHistoryList$Query parse(Map<String, dynamic> json) =>
      GetInvoiceHistoryList$Query.fromJson(json);
}

final AUTHENTICATE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Authenticate'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'authenticate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class AuthenticateMutation
    extends GraphQLQuery<Authenticate$Mutation, JsonSerializable> {
  AuthenticateMutation();

  @override
  final DocumentNode document = AUTHENTICATE_MUTATION_DOCUMENT;

  @override
  final String operationName = 'Authenticate';

  @override
  List<Object?> get props => [document, operationName];
  @override
  Authenticate$Mutation parse(Map<String, dynamic> json) =>
      Authenticate$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateSupplierArguments extends JsonSerializable with EquatableMixin {
  CreateSupplierArguments(
      {required this.name,
      required this.billingAmount,
      required this.billingType,
      required this.endYm,
      required this.subject,
      required this.subjectTemplate});

  @override
  factory CreateSupplierArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateSupplierArgumentsFromJson(json);

  late String name;

  late int billingAmount;

  @JsonKey(unknownEnumValue: GraphQLBillingType.artemisUnknown)
  late GraphQLBillingType billingType;

  late String endYm;

  late String subject;

  late String subjectTemplate;

  @override
  List<Object?> get props =>
      [name, billingAmount, billingType, endYm, subject, subjectTemplate];
  @override
  Map<String, dynamic> toJson() => _$CreateSupplierArgumentsToJson(this);
}

final CREATE_SUPPLIER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateSupplier'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'billingAmount')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'billingType')),
            type: NamedTypeNode(
                name: NameNode(value: 'GraphQLBillingType'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'endYm')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'subject')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'subjectTemplate')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'createSupplier'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'name'),
                        value: VariableNode(name: NameNode(value: 'name'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'billingAmount'),
                        value: VariableNode(
                            name: NameNode(value: 'billingAmount'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'billingType'),
                        value:
                            VariableNode(name: NameNode(value: 'billingType'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'endYm'),
                        value: VariableNode(name: NameNode(value: 'endYm'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'subject'),
                        value: VariableNode(name: NameNode(value: 'subject'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'subjectTemplate'),
                        value: VariableNode(
                            name: NameNode(value: 'subjectTemplate')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'billingAmountIncludeTax'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'billingAmountExcludeTax'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'billingType'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'endYm'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'subject'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'subjectTemplate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class CreateSupplierMutation
    extends GraphQLQuery<CreateSupplier$Mutation, CreateSupplierArguments> {
  CreateSupplierMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_SUPPLIER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'CreateSupplier';

  @override
  final CreateSupplierArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateSupplier$Mutation parse(Map<String, dynamic> json) =>
      CreateSupplier$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateSupplierArguments extends JsonSerializable with EquatableMixin {
  UpdateSupplierArguments(
      {required this.id,
      required this.name,
      required this.billingAmount,
      required this.endYm,
      required this.subject,
      required this.subjectTemplate});

  @override
  factory UpdateSupplierArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateSupplierArgumentsFromJson(json);

  late String id;

  late String name;

  late int billingAmount;

  late String endYm;

  late String subject;

  late String subjectTemplate;

  @override
  List<Object?> get props =>
      [id, name, billingAmount, endYm, subject, subjectTemplate];
  @override
  Map<String, dynamic> toJson() => _$UpdateSupplierArgumentsToJson(this);
}

final UPDATE_SUPPLIER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateSupplier'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'billingAmount')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'endYm')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'subject')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'subjectTemplate')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'updateSupplier'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'id'),
                        value: VariableNode(name: NameNode(value: 'id'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'name'),
                        value: VariableNode(name: NameNode(value: 'name'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'billingAmount'),
                        value: VariableNode(
                            name: NameNode(value: 'billingAmount'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'endYm'),
                        value: VariableNode(name: NameNode(value: 'endYm'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'subject'),
                        value: VariableNode(name: NameNode(value: 'subject'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'subjectTemplate'),
                        value: VariableNode(
                            name: NameNode(value: 'subjectTemplate')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'billingAmountIncludeTax'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'billingAmountExcludeTax'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'billingType'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'endYm'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'subject'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'subjectTemplate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class UpdateSupplierMutation
    extends GraphQLQuery<UpdateSupplier$Mutation, UpdateSupplierArguments> {
  UpdateSupplierMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_SUPPLIER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'UpdateSupplier';

  @override
  final UpdateSupplierArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateSupplier$Mutation parse(Map<String, dynamic> json) =>
      UpdateSupplier$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class RegisterBankArguments extends JsonSerializable with EquatableMixin {
  RegisterBankArguments(
      {required this.name,
      required this.code,
      required this.accountType,
      required this.accountNumber});

  @override
  factory RegisterBankArguments.fromJson(Map<String, dynamic> json) =>
      _$RegisterBankArgumentsFromJson(json);

  late String name;

  late String code;

  @JsonKey(unknownEnumValue: GraphQLBankAccountType.artemisUnknown)
  late GraphQLBankAccountType accountType;

  late String accountNumber;

  @override
  List<Object?> get props => [name, code, accountType, accountNumber];
  @override
  Map<String, dynamic> toJson() => _$RegisterBankArgumentsToJson(this);
}

final REGISTER_BANK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RegisterBank'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'code')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'accountType')),
            type: NamedTypeNode(
                name: NameNode(value: 'GraphQLBankAccountType'),
                isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'accountNumber')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'registerBank'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'name'),
                        value: VariableNode(name: NameNode(value: 'name'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'code'),
                        value: VariableNode(name: NameNode(value: 'code'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'accountType'),
                        value:
                            VariableNode(name: NameNode(value: 'accountType'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'accountNumber'),
                        value: VariableNode(
                            name: NameNode(value: 'accountNumber')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class RegisterBankMutation
    extends GraphQLQuery<RegisterBank$Mutation, RegisterBankArguments> {
  RegisterBankMutation({required this.variables});

  @override
  final DocumentNode document = REGISTER_BANK_MUTATION_DOCUMENT;

  @override
  final String operationName = 'RegisterBank';

  @override
  final RegisterBankArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  RegisterBank$Mutation parse(Map<String, dynamic> json) =>
      RegisterBank$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class RegisterSenderArguments extends JsonSerializable with EquatableMixin {
  RegisterSenderArguments(
      {required this.name,
      required this.email,
      required this.tel,
      required this.postalCode,
      required this.address});

  @override
  factory RegisterSenderArguments.fromJson(Map<String, dynamic> json) =>
      _$RegisterSenderArgumentsFromJson(json);

  late String name;

  late String email;

  late String tel;

  late String postalCode;

  late String address;

  @override
  List<Object?> get props => [name, email, tel, postalCode, address];
  @override
  Map<String, dynamic> toJson() => _$RegisterSenderArgumentsToJson(this);
}

final REGISTER_SENDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RegisterSender'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'email')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'tel')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'postalCode')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'address')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'registerSender'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'name'),
                        value: VariableNode(name: NameNode(value: 'name'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'email'),
                        value: VariableNode(name: NameNode(value: 'email'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'tel'),
                        value: VariableNode(name: NameNode(value: 'tel'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'postalCode'),
                        value:
                            VariableNode(name: NameNode(value: 'postalCode'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'address'),
                        value: VariableNode(name: NameNode(value: 'address')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class RegisterSenderMutation
    extends GraphQLQuery<RegisterSender$Mutation, RegisterSenderArguments> {
  RegisterSenderMutation({required this.variables});

  @override
  final DocumentNode document = REGISTER_SENDER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'RegisterSender';

  @override
  final RegisterSenderArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  RegisterSender$Mutation parse(Map<String, dynamic> json) =>
      RegisterSender$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteBankArguments extends JsonSerializable with EquatableMixin {
  DeleteBankArguments({required this.id});

  @override
  factory DeleteBankArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteBankArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteBankArgumentsToJson(this);
}

final DELETE_BANK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteBank'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'deleteBank'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'id'),
                        value: VariableNode(name: NameNode(value: 'id')))
                  ]))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class DeleteBankMutation
    extends GraphQLQuery<DeleteBank$Mutation, DeleteBankArguments> {
  DeleteBankMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_BANK_MUTATION_DOCUMENT;

  @override
  final String operationName = 'DeleteBank';

  @override
  final DeleteBankArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteBank$Mutation parse(Map<String, dynamic> json) =>
      DeleteBank$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteSenderArguments extends JsonSerializable with EquatableMixin {
  DeleteSenderArguments({required this.id});

  @override
  factory DeleteSenderArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteSenderArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteSenderArgumentsToJson(this);
}

final DELETE_SENDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteSender'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'deleteSender'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'id'),
                        value: VariableNode(name: NameNode(value: 'id')))
                  ]))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class DeleteSenderMutation
    extends GraphQLQuery<DeleteSender$Mutation, DeleteSenderArguments> {
  DeleteSenderMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_SENDER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'DeleteSender';

  @override
  final DeleteSenderArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteSender$Mutation parse(Map<String, dynamic> json) =>
      DeleteSender$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteSupplierArguments extends JsonSerializable with EquatableMixin {
  DeleteSupplierArguments({required this.id});

  @override
  factory DeleteSupplierArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteSupplierArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteSupplierArgumentsToJson(this);
}

final DELETE_SUPPLIER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteSupplier'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'deleteSupplier'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'id'),
                        value: VariableNode(name: NameNode(value: 'id')))
                  ]))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class DeleteSupplierMutation
    extends GraphQLQuery<DeleteSupplier$Mutation, DeleteSupplierArguments> {
  DeleteSupplierMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_SUPPLIER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'DeleteSupplier';

  @override
  final DeleteSupplierArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteSupplier$Mutation parse(Map<String, dynamic> json) =>
      DeleteSupplier$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DownloadInvoicePDFArguments extends JsonSerializable with EquatableMixin {
  DownloadInvoicePDFArguments({required this.invoiceId});

  @override
  factory DownloadInvoicePDFArguments.fromJson(Map<String, dynamic> json) =>
      _$DownloadInvoicePDFArgumentsFromJson(json);

  late String invoiceId;

  @override
  List<Object?> get props => [invoiceId];
  @override
  Map<String, dynamic> toJson() => _$DownloadInvoicePDFArgumentsToJson(this);
}

final DOWNLOAD_INVOICE_P_D_F_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DownloadInvoicePDF'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'invoiceId')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'downloadInvoicePdf'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'invoiceId'),
                        value: VariableNode(name: NameNode(value: 'invoiceId')))
                  ]))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class DownloadInvoicePDFMutation extends GraphQLQuery<
    DownloadInvoicePDF$Mutation, DownloadInvoicePDFArguments> {
  DownloadInvoicePDFMutation({required this.variables});

  @override
  final DocumentNode document = DOWNLOAD_INVOICE_P_D_F_MUTATION_DOCUMENT;

  @override
  final String operationName = 'DownloadInvoicePDF';

  @override
  final DownloadInvoicePDFArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DownloadInvoicePDF$Mutation parse(Map<String, dynamic> json) =>
      DownloadInvoicePDF$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteInvoiceArguments extends JsonSerializable with EquatableMixin {
  DeleteInvoiceArguments({required this.id});

  @override
  factory DeleteInvoiceArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteInvoiceArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteInvoiceArgumentsToJson(this);
}

final DELETE_INVOICE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteInvoice'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'deleteInvoice'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'id'),
                        value: VariableNode(name: NameNode(value: 'id')))
                  ]))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class DeleteInvoiceMutation
    extends GraphQLQuery<DeleteInvoice$Mutation, DeleteInvoiceArguments> {
  DeleteInvoiceMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_INVOICE_MUTATION_DOCUMENT;

  @override
  final String operationName = 'DeleteInvoice';

  @override
  final DeleteInvoiceArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteInvoice$Mutation parse(Map<String, dynamic> json) =>
      DeleteInvoice$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ConnectMisocaArguments extends JsonSerializable with EquatableMixin {
  ConnectMisocaArguments({required this.code});

  @override
  factory ConnectMisocaArguments.fromJson(Map<String, dynamic> json) =>
      _$ConnectMisocaArgumentsFromJson(json);

  late String code;

  @override
  List<Object?> get props => [code];
  @override
  Map<String, dynamic> toJson() => _$ConnectMisocaArgumentsToJson(this);
}

final CONNECT_MISOCA_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ConnectMisoca'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'code')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'connectMisoca'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'code'),
                        value: VariableNode(name: NameNode(value: 'code')))
                  ]))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class ConnectMisocaMutation
    extends GraphQLQuery<ConnectMisoca$Mutation, ConnectMisocaArguments> {
  ConnectMisocaMutation({required this.variables});

  @override
  final DocumentNode document = CONNECT_MISOCA_MUTATION_DOCUMENT;

  @override
  final String operationName = 'ConnectMisoca';

  @override
  final ConnectMisocaArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ConnectMisoca$Mutation parse(Map<String, dynamic> json) =>
      ConnectMisoca$Mutation.fromJson(json);
}

final REFRESH_MISOCA_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RefreshMisoca'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'refreshMisoca'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class RefreshMisocaMutation
    extends GraphQLQuery<RefreshMisoca$Mutation, JsonSerializable> {
  RefreshMisocaMutation();

  @override
  final DocumentNode document = REFRESH_MISOCA_MUTATION_DOCUMENT;

  @override
  final String operationName = 'RefreshMisoca';

  @override
  List<Object?> get props => [document, operationName];
  @override
  RefreshMisoca$Mutation parse(Map<String, dynamic> json) =>
      RefreshMisoca$Mutation.fromJson(json);
}
