import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
     @observable
  int selectedMenuItem = 0;

  @action
  void setSelectedMenuItem(int value) => selectedMenuItem = value;

  @observable
  bool visibilityNotification = false;

  @action
  void setVisibilityNotification(bool value) => visibilityNotification = value;

  @observable
  bool visibilityProfile = false;

  @action
  void setVisibilityProfile(bool value) => visibilityProfile = value;
}