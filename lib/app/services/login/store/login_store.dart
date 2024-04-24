import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  TextEditingController emailController = TextEditingController();
  @observable 
  TextEditingController passwordController = TextEditingController();
  @observable
  bool isPasswordVisible = false;
  @observable
  bool isLoading = false;
  @observable
  bool isEmailValid = false;
  @observable
  bool isPasswordValid = false;
  @observable
  bool isFormValid = false;
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController phoneController = TextEditingController();
  @observable
  TextEditingController cpfController = TextEditingController();
  @observable
  TextEditingController birthController = TextEditingController();
  @observable
  TextEditingController cepController = TextEditingController();
  @observable
  TextEditingController addressController = TextEditingController();
  @observable
  TextEditingController numberController = TextEditingController();
  @observable
  TextEditingController complementController = TextEditingController();
  @observable
  TextEditingController districtController = TextEditingController();
  @observable
  TextEditingController cityController = TextEditingController();
  @observable
  TextEditingController stateController = TextEditingController();
  @observable
  TextEditingController countryController = TextEditingController();
   @observable
  TextEditingController  neighborhoodController = TextEditingController();
  @observable
  TextEditingController passwordConfirmController = TextEditingController();

  @observable 
  bool storeIsPasswordVisible = false;

  @action
  void setStoreIsPasswordVisible(value) => storeIsPasswordVisible = value;
   
   @action
   void setVisibityPassword() => isPasswordVisible = !isPasswordVisible;

}