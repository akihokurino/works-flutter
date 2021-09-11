import 'package:works_flutter/model/bank.dart';
import 'package:works_flutter/model/invoice.dart';
import 'package:works_flutter/model/invoice_history.dart';
import 'package:works_flutter/model/me.dart';
import 'package:works_flutter/model/sender.dart';
import 'package:works_flutter/model/supplier.dart';

import 'api.dart';

extension GetMe on GetMe$Query$Me {
  Me model() {
    Sender? _sender;
    if (sender != null) {
      _sender = Sender(
          id: sender!.id,
          name: sender!.name,
          email: sender!.email,
          tel: sender!.tel,
          postalCode: sender!.postalCode,
          address: sender!.address);
    }

    Bank? _bank;
    if (bank != null) {
      _bank = Bank(id: bank!.id, name: bank!.name, code: bank!.code, accountType: bank!.accountType, accountNumber: bank!.accountNumber);
    }

    return Me(
      id: id,
      suppliers: supplierList
          .map((v) => Supplier(
                id: v.id,
                name: v.name,
                billingAmountIncludeTax: v.billingAmountIncludeTax,
                billingAmountExcludeTax: v.billingAmountExcludeTax,
                billingType: v.billingType,
                endYm: v.endYm,
                subject: v.subject,
                subjectTemplate: v.subjectTemplate,
              ))
          .toList(),
      sender: _sender,
      bank: _bank,
    );
  }
}

extension CreateSupplier on CreateSupplier$Mutation$Supplier {
  Supplier model() {
    return Supplier(
      id: id,
      name: name,
      billingAmountIncludeTax: billingAmountIncludeTax,
      billingAmountExcludeTax: billingAmountExcludeTax,
      billingType: billingType,
      endYm: endYm,
      subject: subject,
      subjectTemplate: subjectTemplate,
    );
  }
}

extension UpdateSupplier on UpdateSupplier$Mutation$Supplier {
  Supplier model() {
    return Supplier(
      id: id,
      name: name,
      billingAmountIncludeTax: billingAmountIncludeTax,
      billingAmountExcludeTax: billingAmountExcludeTax,
      billingType: billingType,
      endYm: endYm,
      subject: subject,
      subjectTemplate: subjectTemplate,
    );
  }
}

extension GetInvoiceList on GetInvoiceList$Query$InvoiceConnection$InvoiceEdge$Invoice {
  Invoice model() {
    return Invoice(
      id: id,
      issueYMD: issueYmd,
      paymentDueOnYMD: paymentDueOnYmd,
      invoiceNumber: invoiceNumber,
      paymentStatus: paymentStatus,
      invoiceStatus: invoiceStatus,
      recipientName: recipientName,
      subject: subject,
      totalAmount: totalAmount,
      tax: tax,
    );
  }
}

extension GetInvoiceHistoryList on GetInvoiceHistoryList$Query$InvoiceHistoryConnection$InvoiceHistoryEdge$InvoiceHistory {
  InvoiceHistory model() {
    return InvoiceHistory(
        id: invoice.id,
        invoice: Invoice(
          id: invoice.id,
          issueYMD: invoice.issueYmd,
          paymentDueOnYMD: invoice.paymentDueOnYmd,
          invoiceNumber: invoice.invoiceNumber,
          paymentStatus: invoice.paymentStatus,
          invoiceStatus: invoice.invoiceStatus,
          recipientName: invoice.recipientName,
          subject: invoice.subject,
          totalAmount: invoice.totalAmount,
          tax: invoice.tax,
        ),
        supplier: Supplier(
          id: supplier.id,
          name: supplier.name,
          billingAmountIncludeTax: supplier.billingAmountIncludeTax,
          billingAmountExcludeTax: supplier.billingAmountExcludeTax,
          billingType: supplier.billingType,
          endYm: supplier.endYm,
          subject: supplier.subject,
          subjectTemplate: supplier.subjectTemplate,
        ));
  }
}
