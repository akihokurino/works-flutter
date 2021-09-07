import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:works_flutter/infra/graphql/api.dart';
import 'package:works_flutter/infra/graphql/converter.dart';
import 'package:works_flutter/infra/graphql_client.dart';
import 'package:works_flutter/model/errors.dart';
import 'package:works_flutter/model/supplier.dart';

class _Provider extends StateNotifier<_State> {
  _Provider() : super(_State.init());

  Future<void> getList(bool isRefresh) async {
    if (!isRefresh) {
      state = state.setShouldHud(true);
    }

    final payload = GetMeQuery();
    final resp = await GQClient().query(QueryOptions(document: payload.document));
    final decoded = GetMe$Query.fromJson(resp);
    state = state.setSuppliers(decoded.me.model().suppliers);

    if (!isRefresh) {
      state = state.setShouldHud(false);
    }
  }

  Future<AppError?> create(String name, String subject, String subjectTemplate, int billingAmount, GraphQLBillingType billingType,
      int endYear, int endMonth) async {
    if (name.isEmpty || subject.isEmpty || billingAmount == 0) {
      return AppError("不正な入力です");
    }

    String endYm = "";
    if (billingType == GraphQLBillingType.oneTime) {
      endYm = "$endYear-${endMonth.toString().padLeft(2, "0")}";
    }

    state = state.setShouldHud(true);

    final payload = CreateSupplierMutation(
        variables: CreateSupplierArguments(
      name: name,
      subject: subject,
      subjectTemplate: subjectTemplate,
      billingAmount: billingAmount,
      billingType: billingType,
      endYm: endYm,
    ));
    final resp = await GQClient().mutation(MutationOptions(document: payload.document, variables: payload.variables.toJson()));
    final decoded = CreateSupplier$Mutation.fromJson(resp);
    state = state.appendSupplier(decoded.createSupplier.model());

    state = state.setShouldHud(false);
  }

  Future<AppError?> update(
      Supplier supplier, String name, String subject, String subjectTemplate, int billingAmount, int endYear, int endMonth) async {
    if (name.isEmpty || subject.isEmpty || billingAmount == 0) {
      return AppError("不正な入力です");
    }

    String endYm = "";
    if (supplier.billingType == GraphQLBillingType.oneTime) {
      endYm = "$endYear-$endMonth";
    }

    state = state.setShouldHud(true);

    final payload = UpdateSupplierMutation(
        variables: UpdateSupplierArguments(
      id: supplier.id,
      name: name,
      subject: subject,
      subjectTemplate: subjectTemplate,
      billingAmount: billingAmount,
      endYm: endYm,
    ));
    final resp = await GQClient().mutation(MutationOptions(document: payload.document, variables: payload.variables.toJson()));
    final decoded = UpdateSupplier$Mutation.fromJson(resp);
    state = state.replaceSupplier(decoded.updateSupplier.model());

    state = state.setShouldHud(false);
  }

  Future<AppError?> delete(Supplier supplier) async {
    state = state.setShouldHud(true);

    final payload = DeleteSupplierMutation(variables: DeleteSupplierArguments(id: supplier.id));
    await GQClient().mutation(MutationOptions(document: payload.document, variables: payload.variables.toJson()));
    state = state.deleteSupplier(supplier);

    state = state.setShouldHud(false);
  }
}

class _State {
  final bool shouldShowHud;
  final List<Supplier> suppliers;

  _State({required this.shouldShowHud, required this.suppliers});

  static _State init() {
    return _State(shouldShowHud: false, suppliers: []);
  }

  _State setShouldHud(bool should) {
    return _State(shouldShowHud: should, suppliers: suppliers);
  }

  _State setSuppliers(List<Supplier> items) {
    return _State(shouldShowHud: shouldShowHud, suppliers: items);
  }

  _State appendSupplier(Supplier item) {
    List<Supplier> current = suppliers;
    current.insert(0, item);
    return _State(shouldShowHud: shouldShowHud, suppliers: current);
  }

  _State replaceSupplier(Supplier item) {
    List<Supplier> current = suppliers;
    final index = current.indexWhere((v) => v.id == item.id);
    current[index] = item;
    return _State(shouldShowHud: shouldShowHud, suppliers: current);
  }

  _State deleteSupplier(Supplier item) {
    List<Supplier> current = suppliers;
    current.removeWhere((v) => v.id == item.id);
    return _State(shouldShowHud: shouldShowHud, suppliers: current);
  }
}

final supplierProvider = StateNotifierProvider<_Provider, _State>((_) => _Provider());
