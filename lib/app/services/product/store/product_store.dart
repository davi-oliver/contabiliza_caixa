import 'package:ga_proj/models/product.dart';
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {

  ObservableList<Product> products = ObservableList<Product>();

  @action 
  void addProduct(Product item) {
    products.add(item);
  }

  @action 
  void clearProducts() {
    products.clear();
  }

  @observable
  bool loading = false;

  @action
  void setLoading (v) => loading = v;
  
}