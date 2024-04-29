import 'package:mobx/mobx.dart';
part 'stock_store.g.dart';

class StockStore = _StockStoreBase with _$StockStore;

abstract class _StockStoreBase with Store {
   ObservableList products = ObservableList();

  @observable
  bool loading = false;

  @action
  void setLoading (v) => loading = v;
}