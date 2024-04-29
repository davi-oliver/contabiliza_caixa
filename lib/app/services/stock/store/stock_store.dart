import 'package:ga_proj/models/stock.dart';
import 'package:mobx/mobx.dart';
part 'stock_store.g.dart';

class StockStore = _StockStoreBase with _$StockStore;

abstract class _StockStoreBase with Store {
   ObservableList<StockInfo> products = ObservableList<StockInfo>();

  @action
  void addStockProduct(StockInfo product) => products.add(product);

  @action
  clearProducts() => products.clear();

  @observable
  bool loading = false;

  @action
  void setLoading (v) => loading = v;
}