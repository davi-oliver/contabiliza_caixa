// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Endereco {
  String? rua;
  String? numero;

  String? bairro;
  String? cidade;
  String? estado;

  Endereco({
    this.rua,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rua': rua,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
    };
  }

  factory Endereco.fromMap(map) {
    return Endereco(
      rua: map['rua'] != null ? map['rua'] as String : null,
      numero: map['numero'] != null ? map['numero'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source) as Map<String, dynamic>);
}
