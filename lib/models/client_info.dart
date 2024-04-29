
class CompanyInfo {
  final Company? company;
  final Address? address;

  CompanyInfo({
    required this.company,
    required this.address,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      company: Company.fromJson(json['company']),
      address: Address.fromJson(json['address']),
    );
  }
}

class Company {
  final int? id;
  final String? createdAt;
  final String? name;
  final String? phone;
  final String? email;
  final int? addressId;

  Company({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.phone,
    required this.email,
    required this.addressId,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      addressId: json['address_id'],
    );
  }
}

class Address {
  final int? id;
  final String? street;
  final String? city;
  final int? number;
  final String? neighborhood;

  Address({
    required this.id,
    required this.street,
    required this.city,
    required this.number,
    required this.neighborhood,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      street: json['street'],
      number: json['number'],
      city: json['city'],
      neighborhood: json['neighborhood'],
    );
  }
}