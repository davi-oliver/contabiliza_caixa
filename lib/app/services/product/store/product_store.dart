import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {

  ObservableList products = ObservableList();

  @observable
  bool loading = false;

  @action
  void setLoading (v) => loading = v;
  
}