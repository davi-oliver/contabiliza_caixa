import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'perfil_store.g.dart';

class PerfilStore = PerfilStoreBase with _$PerfilStore;

abstract class PerfilStoreBase with Store {
  TextEditingController controllerUpdateSenha = TextEditingController();

  TextEditingController controllerConfirmacaoUpdateSenha =
      TextEditingController();
}
