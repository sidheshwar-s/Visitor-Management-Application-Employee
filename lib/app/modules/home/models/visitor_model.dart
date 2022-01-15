import 'dart:convert';

import 'package:vms_employee_flutter/app/modules/home/models/company_model.dart';

class VisitorModel {
  final String? id;
  final String? name;
  final String? phone;
  final String? address;
  final String? idLink;
  final String? idType;
  final String? selfieLink;
  final CompanyModel? company;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  VisitorModel({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.idLink,
    this.idType,
    this.selfieLink,
    this.company,
    this.createdAt,
    this.updatedAt,
  });

  VisitorModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? address,
    String? idLink,
    String? idType,
    String? selfieLink,
    CompanyModel? company,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return VisitorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      idLink: idLink ?? this.idLink,
      idType: idType ?? this.idType,
      selfieLink: selfieLink ?? this.selfieLink,
      company: company ?? this.company,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'address': address,
      'idLink': idLink,
      'idType': idType,
      'selfieLink': selfieLink,
      'company': company?.toMap(),
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory VisitorModel.fromMap(Map<String, dynamic> map) {
    return VisitorModel(
      id: map['_id'],
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      idLink: map['idLink'],
      idType: map['idType'],
      selfieLink: map['selfieLink'],
      company:
          map['company'] != null ? CompanyModel.fromMap(map['company']) : null,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt']).toLocal()
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt']).toLocal()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VisitorModel.fromJson(String source) =>
      VisitorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VisitorModel(id: $id, name: $name, phone: $phone, address: $address, idLink: $idLink, idType: $idType, selfieLink: $selfieLink, company: $company, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VisitorModel &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.address == address &&
        other.idLink == idLink &&
        other.idType == idType &&
        other.selfieLink == selfieLink &&
        other.company == company &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        idLink.hashCode ^
        idType.hashCode ^
        selfieLink.hashCode ^
        company.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
