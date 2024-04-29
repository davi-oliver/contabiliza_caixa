import 'package:mobx/mobx.dart';
part 'companies_store.g.dart';

class CompaniesStore = _CompaniesStoreBase with _$CompaniesStore;

abstract class _CompaniesStoreBase with Store {
  ObservableList companies = ObservableList();

  @observable
  bool loading = false;

  @action
  void setLoading (v) => loading = v;
}