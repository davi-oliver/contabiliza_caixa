import 'package:mobx/mobx.dart';
part 'global_store.g.dart';

class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  @observable 
  bool loading = false;

  @action
  void setLoading(value) => loading = value;
}