// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMe$Query$Me$SupplierConnection$SupplierEdge$Supplier
    _$GetMe$Query$Me$SupplierConnection$SupplierEdge$SupplierFromJson(
        Map<String, dynamic> json) {
  return GetMe$Query$Me$SupplierConnection$SupplierEdge$Supplier()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..billingAmountIncludeTax = json['billingAmountIncludeTax'] as int
    ..billingAmountExcludeTax = json['billingAmountExcludeTax'] as int
    ..billingType = _$enumDecode(
        _$GraphQLBillingTypeEnumMap, json['billingType'],
        unknownValue: GraphQLBillingType.artemisUnknown)
    ..endYm = json['endYm'] as String?
    ..subject = json['subject'] as String
    ..subjectTemplate = json['subjectTemplate'] as String;
}

Map<String, dynamic>
    _$GetMe$Query$Me$SupplierConnection$SupplierEdge$SupplierToJson(
            GetMe$Query$Me$SupplierConnection$SupplierEdge$Supplier instance) =>
        <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
          'billingAmountIncludeTax': instance.billingAmountIncludeTax,
          'billingAmountExcludeTax': instance.billingAmountExcludeTax,
          'billingType': _$GraphQLBillingTypeEnumMap[instance.billingType],
          'endYm': instance.endYm,
          'subject': instance.subject,
          'subjectTemplate': instance.subjectTemplate,
        };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$GraphQLBillingTypeEnumMap = {
  GraphQLBillingType.monthly: 'Monthly',
  GraphQLBillingType.oneTime: 'OneTime',
  GraphQLBillingType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetMe$Query$Me$SupplierConnection$SupplierEdge
    _$GetMe$Query$Me$SupplierConnection$SupplierEdgeFromJson(
        Map<String, dynamic> json) {
  return GetMe$Query$Me$SupplierConnection$SupplierEdge()
    ..node = GetMe$Query$Me$SupplierConnection$SupplierEdge$Supplier.fromJson(
        json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetMe$Query$Me$SupplierConnection$SupplierEdgeToJson(
        GetMe$Query$Me$SupplierConnection$SupplierEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
    };

GetMe$Query$Me$SupplierConnection _$GetMe$Query$Me$SupplierConnectionFromJson(
    Map<String, dynamic> json) {
  return GetMe$Query$Me$SupplierConnection()
    ..edges = (json['edges'] as List<dynamic>)
        .map((e) => GetMe$Query$Me$SupplierConnection$SupplierEdge.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetMe$Query$Me$SupplierConnectionToJson(
        GetMe$Query$Me$SupplierConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
    };

GetMe$Query$Me$Sender _$GetMe$Query$Me$SenderFromJson(
    Map<String, dynamic> json) {
  return GetMe$Query$Me$Sender()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..tel = json['tel'] as String
    ..postalCode = json['postalCode'] as String
    ..address = json['address'] as String;
}

Map<String, dynamic> _$GetMe$Query$Me$SenderToJson(
        GetMe$Query$Me$Sender instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'tel': instance.tel,
      'postalCode': instance.postalCode,
      'address': instance.address,
    };

GetMe$Query$Me$Bank _$GetMe$Query$Me$BankFromJson(Map<String, dynamic> json) {
  return GetMe$Query$Me$Bank()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..code = json['code'] as String
    ..accountType = _$enumDecode(
        _$GraphQLBankAccountTypeEnumMap, json['accountType'],
        unknownValue: GraphQLBankAccountType.artemisUnknown)
    ..accountNumber = json['accountNumber'] as String;
}

Map<String, dynamic> _$GetMe$Query$Me$BankToJson(
        GetMe$Query$Me$Bank instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'accountType': _$GraphQLBankAccountTypeEnumMap[instance.accountType],
      'accountNumber': instance.accountNumber,
    };

const _$GraphQLBankAccountTypeEnumMap = {
  GraphQLBankAccountType.savings: 'Savings',
  GraphQLBankAccountType.checking: 'Checking',
  GraphQLBankAccountType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetMe$Query$Me _$GetMe$Query$MeFromJson(Map<String, dynamic> json) {
  return GetMe$Query$Me()
    ..id = json['id'] as String
    ..supplierList = GetMe$Query$Me$SupplierConnection.fromJson(
        json['supplierList'] as Map<String, dynamic>)
    ..sender = json['sender'] == null
        ? null
        : GetMe$Query$Me$Sender.fromJson(json['sender'] as Map<String, dynamic>)
    ..bank = json['bank'] == null
        ? null
        : GetMe$Query$Me$Bank.fromJson(json['bank'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetMe$Query$MeToJson(GetMe$Query$Me instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplierList': instance.supplierList.toJson(),
      'sender': instance.sender?.toJson(),
      'bank': instance.bank?.toJson(),
    };

GetMe$Query _$GetMe$QueryFromJson(Map<String, dynamic> json) {
  return GetMe$Query()
    ..me = GetMe$Query$Me.fromJson(json['me'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetMe$QueryToJson(GetMe$Query instance) =>
    <String, dynamic>{
      'me': instance.me.toJson(),
    };

GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$Invoice
    _$GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$InvoiceFromJson(
        Map<String, dynamic> json) {
  return GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$Invoice()
    ..id = json['id'] as String
    ..issueYmd = json['issueYmd'] as String
    ..paymentDueOnYmd = json['paymentDueOnYmd'] as String
    ..invoiceNumber = json['invoiceNumber'] as String
    ..paymentStatus = _$enumDecode(
        _$GraphQLPaymentStatusEnumMap, json['paymentStatus'],
        unknownValue: GraphQLPaymentStatus.artemisUnknown)
    ..invoiceStatus = _$enumDecode(
        _$GraphQLInvoiceStatusEnumMap, json['invoiceStatus'],
        unknownValue: GraphQLInvoiceStatus.artemisUnknown)
    ..recipientName = json['recipientName'] as String
    ..subject = json['subject'] as String
    ..totalAmount = json['totalAmount'] as int
    ..tax = json['tax'] as int;
}

Map<String,
    dynamic> _$GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$InvoiceToJson(
        GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$Invoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'issueYmd': instance.issueYmd,
      'paymentDueOnYmd': instance.paymentDueOnYmd,
      'invoiceNumber': instance.invoiceNumber,
      'paymentStatus': _$GraphQLPaymentStatusEnumMap[instance.paymentStatus],
      'invoiceStatus': _$GraphQLInvoiceStatusEnumMap[instance.invoiceStatus],
      'recipientName': instance.recipientName,
      'subject': instance.subject,
      'totalAmount': instance.totalAmount,
      'tax': instance.tax,
    };

const _$GraphQLPaymentStatusEnumMap = {
  GraphQLPaymentStatus.unPaid: 'UnPaid',
  GraphQLPaymentStatus.paid: 'Paid',
  GraphQLPaymentStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$GraphQLInvoiceStatusEnumMap = {
  GraphQLInvoiceStatus.unSubmitted: 'UnSubmitted',
  GraphQLInvoiceStatus.submitted: 'Submitted',
  GraphQLInvoiceStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetInvoiceList$Query$InvoiceConnection$InvoiceEdge
    _$GetInvoiceList$Query$InvoiceConnection$InvoiceEdgeFromJson(
        Map<String, dynamic> json) {
  return GetInvoiceList$Query$InvoiceConnection$InvoiceEdge()
    ..node =
        GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$Invoice.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetInvoiceList$Query$InvoiceConnection$InvoiceEdgeToJson(
        GetInvoiceList$Query$InvoiceConnection$InvoiceEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
    };

GetInvoiceList$Query$InvoiceConnection
    _$GetInvoiceList$Query$InvoiceConnectionFromJson(
        Map<String, dynamic> json) {
  return GetInvoiceList$Query$InvoiceConnection()
    ..edges = (json['edges'] as List<dynamic>)
        .map((e) => GetInvoiceList$Query$InvoiceConnection$InvoiceEdge.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetInvoiceList$Query$InvoiceConnectionToJson(
        GetInvoiceList$Query$InvoiceConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
    };

GetInvoiceList$Query _$GetInvoiceList$QueryFromJson(Map<String, dynamic> json) {
  return GetInvoiceList$Query()
    ..invoiceList = GetInvoiceList$Query$InvoiceConnection.fromJson(
        json['invoiceList'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetInvoiceList$QueryToJson(
        GetInvoiceList$Query instance) =>
    <String, dynamic>{
      'invoiceList': instance.invoiceList.toJson(),
    };

GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Invoice
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$InvoiceFromJson(
        Map<String, dynamic> json) {
  return GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Invoice()
    ..id = json['id'] as String
    ..issueYmd = json['issueYmd'] as String
    ..paymentDueOnYmd = json['paymentDueOnYmd'] as String
    ..invoiceNumber = json['invoiceNumber'] as String
    ..paymentStatus = _$enumDecode(
        _$GraphQLPaymentStatusEnumMap, json['paymentStatus'],
        unknownValue: GraphQLPaymentStatus.artemisUnknown)
    ..invoiceStatus = _$enumDecode(
        _$GraphQLInvoiceStatusEnumMap, json['invoiceStatus'],
        unknownValue: GraphQLInvoiceStatus.artemisUnknown)
    ..recipientName = json['recipientName'] as String
    ..subject = json['subject'] as String
    ..totalAmount = json['totalAmount'] as int
    ..tax = json['tax'] as int;
}

Map<String, dynamic>
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$InvoiceToJson(
            GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Invoice
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'issueYmd': instance.issueYmd,
          'paymentDueOnYmd': instance.paymentDueOnYmd,
          'invoiceNumber': instance.invoiceNumber,
          'paymentStatus':
              _$GraphQLPaymentStatusEnumMap[instance.paymentStatus],
          'invoiceStatus':
              _$GraphQLInvoiceStatusEnumMap[instance.invoiceStatus],
          'recipientName': instance.recipientName,
          'subject': instance.subject,
          'totalAmount': instance.totalAmount,
          'tax': instance.tax,
        };

GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Supplier
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$SupplierFromJson(
        Map<String, dynamic> json) {
  return GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Supplier()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..billingAmountIncludeTax = json['billingAmountIncludeTax'] as int
    ..billingAmountExcludeTax = json['billingAmountExcludeTax'] as int
    ..billingType = _$enumDecode(
        _$GraphQLBillingTypeEnumMap, json['billingType'],
        unknownValue: GraphQLBillingType.artemisUnknown)
    ..endYm = json['endYm'] as String?
    ..subject = json['subject'] as String
    ..subjectTemplate = json['subjectTemplate'] as String;
}

Map<String, dynamic>
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$SupplierToJson(
            GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Supplier
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
          'billingAmountIncludeTax': instance.billingAmountIncludeTax,
          'billingAmountExcludeTax': instance.billingAmountExcludeTax,
          'billingType': _$GraphQLBillingTypeEnumMap[instance.billingType],
          'endYm': instance.endYm,
          'subject': instance.subject,
          'subjectTemplate': instance.subjectTemplate,
        };

GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistoryFromJson(
        Map<String, dynamic> json) {
  return GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory()
    ..invoice =
        GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Invoice
            .fromJson(json['invoice'] as Map<String, dynamic>)
    ..supplier =
        GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory$Supplier
            .fromJson(json['supplier'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistoryToJson(
            GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory
                instance) =>
        <String, dynamic>{
          'invoice': instance.invoice.toJson(),
          'supplier': instance.supplier.toJson(),
        };

GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdgeFromJson(
        Map<String, dynamic> json) {
  return GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge()
    ..node =
        GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory
            .fromJson(json['node'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdgeToJson(
            GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge
                instance) =>
        <String, dynamic>{
          'node': instance.node.toJson(),
        };

GetInvoiceHistoryList$Query$InvoiceHistoryConnection
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnectionFromJson(
        Map<String, dynamic> json) {
  return GetInvoiceHistoryList$Query$InvoiceHistoryConnection()
    ..edges = (json['edges'] as List<dynamic>)
        .map((e) =>
            GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$GetInvoiceHistoryList$Query$InvoiceHistoryConnectionToJson(
            GetInvoiceHistoryList$Query$InvoiceHistoryConnection instance) =>
        <String, dynamic>{
          'edges': instance.edges.map((e) => e.toJson()).toList(),
        };

GetInvoiceHistoryList$Query _$GetInvoiceHistoryList$QueryFromJson(
    Map<String, dynamic> json) {
  return GetInvoiceHistoryList$Query()
    ..invoiceHistoryList =
        GetInvoiceHistoryList$Query$InvoiceHistoryConnection.fromJson(
            json['invoiceHistoryList'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetInvoiceHistoryList$QueryToJson(
        GetInvoiceHistoryList$Query instance) =>
    <String, dynamic>{
      'invoiceHistoryList': instance.invoiceHistoryList.toJson(),
    };

Authenticate$Mutation$Me _$Authenticate$Mutation$MeFromJson(
    Map<String, dynamic> json) {
  return Authenticate$Mutation$Me()..id = json['id'] as String;
}

Map<String, dynamic> _$Authenticate$Mutation$MeToJson(
        Authenticate$Mutation$Me instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

Authenticate$Mutation _$Authenticate$MutationFromJson(
    Map<String, dynamic> json) {
  return Authenticate$Mutation()
    ..authenticate = Authenticate$Mutation$Me.fromJson(
        json['authenticate'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Authenticate$MutationToJson(
        Authenticate$Mutation instance) =>
    <String, dynamic>{
      'authenticate': instance.authenticate.toJson(),
    };

CreateSupplier$Mutation$Supplier _$CreateSupplier$Mutation$SupplierFromJson(
    Map<String, dynamic> json) {
  return CreateSupplier$Mutation$Supplier()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..billingAmountIncludeTax = json['billingAmountIncludeTax'] as int
    ..billingAmountExcludeTax = json['billingAmountExcludeTax'] as int
    ..billingType = _$enumDecode(
        _$GraphQLBillingTypeEnumMap, json['billingType'],
        unknownValue: GraphQLBillingType.artemisUnknown)
    ..endYm = json['endYm'] as String?
    ..subject = json['subject'] as String
    ..subjectTemplate = json['subjectTemplate'] as String;
}

Map<String, dynamic> _$CreateSupplier$Mutation$SupplierToJson(
        CreateSupplier$Mutation$Supplier instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'billingAmountIncludeTax': instance.billingAmountIncludeTax,
      'billingAmountExcludeTax': instance.billingAmountExcludeTax,
      'billingType': _$GraphQLBillingTypeEnumMap[instance.billingType],
      'endYm': instance.endYm,
      'subject': instance.subject,
      'subjectTemplate': instance.subjectTemplate,
    };

CreateSupplier$Mutation _$CreateSupplier$MutationFromJson(
    Map<String, dynamic> json) {
  return CreateSupplier$Mutation()
    ..createSupplier = CreateSupplier$Mutation$Supplier.fromJson(
        json['createSupplier'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateSupplier$MutationToJson(
        CreateSupplier$Mutation instance) =>
    <String, dynamic>{
      'createSupplier': instance.createSupplier.toJson(),
    };

UpdateSupplier$Mutation$Supplier _$UpdateSupplier$Mutation$SupplierFromJson(
    Map<String, dynamic> json) {
  return UpdateSupplier$Mutation$Supplier()..id = json['id'] as String;
}

Map<String, dynamic> _$UpdateSupplier$Mutation$SupplierToJson(
        UpdateSupplier$Mutation$Supplier instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateSupplier$Mutation _$UpdateSupplier$MutationFromJson(
    Map<String, dynamic> json) {
  return UpdateSupplier$Mutation()
    ..updateSupplier = UpdateSupplier$Mutation$Supplier.fromJson(
        json['updateSupplier'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateSupplier$MutationToJson(
        UpdateSupplier$Mutation instance) =>
    <String, dynamic>{
      'updateSupplier': instance.updateSupplier.toJson(),
    };

RegisterBank$Mutation$Bank _$RegisterBank$Mutation$BankFromJson(
    Map<String, dynamic> json) {
  return RegisterBank$Mutation$Bank()..id = json['id'] as String;
}

Map<String, dynamic> _$RegisterBank$Mutation$BankToJson(
        RegisterBank$Mutation$Bank instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

RegisterBank$Mutation _$RegisterBank$MutationFromJson(
    Map<String, dynamic> json) {
  return RegisterBank$Mutation()
    ..registerBank = RegisterBank$Mutation$Bank.fromJson(
        json['registerBank'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RegisterBank$MutationToJson(
        RegisterBank$Mutation instance) =>
    <String, dynamic>{
      'registerBank': instance.registerBank.toJson(),
    };

RegisterSender$Mutation$Sender _$RegisterSender$Mutation$SenderFromJson(
    Map<String, dynamic> json) {
  return RegisterSender$Mutation$Sender()..id = json['id'] as String;
}

Map<String, dynamic> _$RegisterSender$Mutation$SenderToJson(
        RegisterSender$Mutation$Sender instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

RegisterSender$Mutation _$RegisterSender$MutationFromJson(
    Map<String, dynamic> json) {
  return RegisterSender$Mutation()
    ..registerSender = RegisterSender$Mutation$Sender.fromJson(
        json['registerSender'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RegisterSender$MutationToJson(
        RegisterSender$Mutation instance) =>
    <String, dynamic>{
      'registerSender': instance.registerSender.toJson(),
    };

DeleteBank$Mutation _$DeleteBank$MutationFromJson(Map<String, dynamic> json) {
  return DeleteBank$Mutation()..deleteBank = json['deleteBank'] as bool;
}

Map<String, dynamic> _$DeleteBank$MutationToJson(
        DeleteBank$Mutation instance) =>
    <String, dynamic>{
      'deleteBank': instance.deleteBank,
    };

DeleteSender$Mutation _$DeleteSender$MutationFromJson(
    Map<String, dynamic> json) {
  return DeleteSender$Mutation()..deleteSender = json['deleteSender'] as bool;
}

Map<String, dynamic> _$DeleteSender$MutationToJson(
        DeleteSender$Mutation instance) =>
    <String, dynamic>{
      'deleteSender': instance.deleteSender,
    };

DeleteSupplier$Mutation _$DeleteSupplier$MutationFromJson(
    Map<String, dynamic> json) {
  return DeleteSupplier$Mutation()
    ..deleteSupplier = json['deleteSupplier'] as bool;
}

Map<String, dynamic> _$DeleteSupplier$MutationToJson(
        DeleteSupplier$Mutation instance) =>
    <String, dynamic>{
      'deleteSupplier': instance.deleteSupplier,
    };

DownloadInvoicePDF$Mutation _$DownloadInvoicePDF$MutationFromJson(
    Map<String, dynamic> json) {
  return DownloadInvoicePDF$Mutation()
    ..downloadInvoicePdf = json['downloadInvoicePdf'] as String;
}

Map<String, dynamic> _$DownloadInvoicePDF$MutationToJson(
        DownloadInvoicePDF$Mutation instance) =>
    <String, dynamic>{
      'downloadInvoicePdf': instance.downloadInvoicePdf,
    };

DeleteInvoice$Mutation _$DeleteInvoice$MutationFromJson(
    Map<String, dynamic> json) {
  return DeleteInvoice$Mutation()
    ..deleteInvoice = json['deleteInvoice'] as bool;
}

Map<String, dynamic> _$DeleteInvoice$MutationToJson(
        DeleteInvoice$Mutation instance) =>
    <String, dynamic>{
      'deleteInvoice': instance.deleteInvoice,
    };

ConnectMisoca$Mutation _$ConnectMisoca$MutationFromJson(
    Map<String, dynamic> json) {
  return ConnectMisoca$Mutation()
    ..connectMisoca = json['connectMisoca'] as bool;
}

Map<String, dynamic> _$ConnectMisoca$MutationToJson(
        ConnectMisoca$Mutation instance) =>
    <String, dynamic>{
      'connectMisoca': instance.connectMisoca,
    };

RefreshMisoca$Mutation _$RefreshMisoca$MutationFromJson(
    Map<String, dynamic> json) {
  return RefreshMisoca$Mutation()
    ..refreshMisoca = json['refreshMisoca'] as bool;
}

Map<String, dynamic> _$RefreshMisoca$MutationToJson(
        RefreshMisoca$Mutation instance) =>
    <String, dynamic>{
      'refreshMisoca': instance.refreshMisoca,
    };

GetInvoiceListArguments _$GetInvoiceListArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetInvoiceListArguments(
    supplierId: json['supplierId'] as String,
  );
}

Map<String, dynamic> _$GetInvoiceListArgumentsToJson(
        GetInvoiceListArguments instance) =>
    <String, dynamic>{
      'supplierId': instance.supplierId,
    };

CreateSupplierArguments _$CreateSupplierArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateSupplierArguments(
    name: json['name'] as String,
    billingAmount: json['billingAmount'] as int,
    billingType: _$enumDecode(_$GraphQLBillingTypeEnumMap, json['billingType'],
        unknownValue: GraphQLBillingType.artemisUnknown),
    endYm: json['endYm'] as String,
    subject: json['subject'] as String,
    subjectTemplate: json['subjectTemplate'] as String,
  );
}

Map<String, dynamic> _$CreateSupplierArgumentsToJson(
        CreateSupplierArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'billingAmount': instance.billingAmount,
      'billingType': _$GraphQLBillingTypeEnumMap[instance.billingType],
      'endYm': instance.endYm,
      'subject': instance.subject,
      'subjectTemplate': instance.subjectTemplate,
    };

UpdateSupplierArguments _$UpdateSupplierArgumentsFromJson(
    Map<String, dynamic> json) {
  return UpdateSupplierArguments(
    id: json['id'] as String,
    name: json['name'] as String,
    billingAmount: json['billingAmount'] as int,
    endYm: json['endYm'] as String,
    subject: json['subject'] as String,
    subjectTemplate: json['subjectTemplate'] as String,
  );
}

Map<String, dynamic> _$UpdateSupplierArgumentsToJson(
        UpdateSupplierArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'billingAmount': instance.billingAmount,
      'endYm': instance.endYm,
      'subject': instance.subject,
      'subjectTemplate': instance.subjectTemplate,
    };

RegisterBankArguments _$RegisterBankArgumentsFromJson(
    Map<String, dynamic> json) {
  return RegisterBankArguments(
    name: json['name'] as String,
    code: json['code'] as String,
    accountType: _$enumDecode(
        _$GraphQLBankAccountTypeEnumMap, json['accountType'],
        unknownValue: GraphQLBankAccountType.artemisUnknown),
    accountNumber: json['accountNumber'] as String,
  );
}

Map<String, dynamic> _$RegisterBankArgumentsToJson(
        RegisterBankArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'accountType': _$GraphQLBankAccountTypeEnumMap[instance.accountType],
      'accountNumber': instance.accountNumber,
    };

RegisterSenderArguments _$RegisterSenderArgumentsFromJson(
    Map<String, dynamic> json) {
  return RegisterSenderArguments(
    name: json['name'] as String,
    email: json['email'] as String,
    tel: json['tel'] as String,
    postalCode: json['postalCode'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$RegisterSenderArgumentsToJson(
        RegisterSenderArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'tel': instance.tel,
      'postalCode': instance.postalCode,
      'address': instance.address,
    };

DeleteBankArguments _$DeleteBankArgumentsFromJson(Map<String, dynamic> json) {
  return DeleteBankArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$DeleteBankArgumentsToJson(
        DeleteBankArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

DeleteSenderArguments _$DeleteSenderArgumentsFromJson(
    Map<String, dynamic> json) {
  return DeleteSenderArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$DeleteSenderArgumentsToJson(
        DeleteSenderArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

DeleteSupplierArguments _$DeleteSupplierArgumentsFromJson(
    Map<String, dynamic> json) {
  return DeleteSupplierArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$DeleteSupplierArgumentsToJson(
        DeleteSupplierArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

DownloadInvoicePDFArguments _$DownloadInvoicePDFArgumentsFromJson(
    Map<String, dynamic> json) {
  return DownloadInvoicePDFArguments(
    invoiceId: json['invoiceId'] as String,
  );
}

Map<String, dynamic> _$DownloadInvoicePDFArgumentsToJson(
        DownloadInvoicePDFArguments instance) =>
    <String, dynamic>{
      'invoiceId': instance.invoiceId,
    };

DeleteInvoiceArguments _$DeleteInvoiceArgumentsFromJson(
    Map<String, dynamic> json) {
  return DeleteInvoiceArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$DeleteInvoiceArgumentsToJson(
        DeleteInvoiceArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ConnectMisocaArguments _$ConnectMisocaArgumentsFromJson(
    Map<String, dynamic> json) {
  return ConnectMisocaArguments(
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$ConnectMisocaArgumentsToJson(
        ConnectMisocaArguments instance) =>
    <String, dynamic>{
      'code': instance.code,
    };
