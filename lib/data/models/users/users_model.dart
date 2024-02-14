// "id": 1,
// "name": "Leanne Graham",
// "username": "Bret",
// "email": "Sincere@april.biz",
// "address": {},
// "phone": "1-770-736-8031 x56442",
// "website": "hildegard.org",
// "company": {}

import 'package:task_1/data/models/users/address_model.dart';
import 'package:task_1/data/models/users/company_model.dart';

class UsersModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  UsersModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      username: json["username"] as String? ?? "",
      email: json["email"] as String? ?? "",
      address: AddressModel.fromJson(json["address"]),
      phone: json["phone"] as String? ?? "",
      website: json["website"] as String? ?? "",
      company: CompanyModel.fromJson(json["company"]),
    );
  }
}
