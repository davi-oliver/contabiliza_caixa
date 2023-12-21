import 'package:ga_proj/models/item.dart';
import 'package:ga_proj/models/product.dart';
import 'package:ga_proj/models/sale.dart';
import 'package:mobx/mobx.dart';
part 'store_sale.g.dart';

class SaleStore = _SaleStoreBase with _$SaleStore;

abstract class _SaleStoreBase with Store {


  @observable
  ObservableList<ItemType> listItensPayment = ObservableList<ItemType>();

  @observable
  ObservableList<Product> listItensProduct = ObservableList<Product>();

  @observable
  ObservableList<SaleModel> listSaleDay = ObservableList<SaleModel>();

  @observable
  ObservableList<SaleModel> listSaleMounth = ObservableList<SaleModel>();

  @action 
  void addListSaleMounth(SaleModel item) {
    listSaleMounth.add(item);
  }

  @action 
  void addListSaleDay(SaleModel item) {
    listSaleDay.add(item);
  }

  @action
  void addListItensProduct(Product item) {
    listItensProduct.add(item);
  }

  @action 
  void addListItensPayment(ItemType item) {
    listItensPayment.add(item);
  }

  var itemSelectedPayment ;

  @action
  void setItemSelectedPayment(ItemType item) {
    itemSelectedPayment = item;
  }

  @observable
  var itemSelectedProduct;

  @action
  void setItemSelectedProduct(Product item) {
    itemSelectedProduct = item;
  }
  
}