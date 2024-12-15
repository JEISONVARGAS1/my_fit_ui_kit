import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String image;
  String phone;
  String address;
  DateTime dateCreate;
  DateTime dateUpdate;
  DocumentReference? id;
  String addressDescription;

  UserModel({
    this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phone,
    required this.address,
    required this.dateCreate,
    required this.dateUpdate,
    required this.addressDescription,
  });

  factory UserModel.fromJson(json, DocumentReference id) => UserModel(
        id: id,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        image: json["image"] ?? "",
        phone: json["phone"] ?? "",
        address: json["address"] ?? "",
        dateCreate: json["date_create"].toDate(),
        dateUpdate: json["date_update"].toDate(),
        addressDescription: json["address_description"] ?? "",
      );

  factory UserModel.init() => UserModel(
        name: "",
        image: "",
        email: "",
        phone: "",
        address: "",
        addressDescription: "",
        dateCreate: DateTime.now(),
        dateUpdate: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "image": image,
        "phone": phone,
        "address": address,
        "date_create": dateCreate,
        "date_update": dateUpdate,
        "address_description": addressDescription,
      };

  Map<String, dynamic> toJsonUpdate() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "date_update": dateUpdate,
        "address_description": addressDescription,
      };

  UserModel copyWith({
    String? name,
    String? email,
    String? image,
    String? phone,
    String? address,
    DateTime? dateCreate,
    DateTime? dateUpdate,
    DocumentReference? id,
    String? addressDescription,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        dateUpdate: dateUpdate ?? this.dateUpdate,
        dateCreate: dateCreate ?? this.dateCreate,
        addressDescription: addressDescription ?? this.addressDescription,
      );
}
