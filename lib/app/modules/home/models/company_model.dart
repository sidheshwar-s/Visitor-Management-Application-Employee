import 'dart:convert';

class CompanyModel {
  final String? id;
  final String? name;
  final String? address;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final DateTime? updatedAt;
  CompanyModel({
    this.id,
    this.name,
    this.address,
    this.createdAt,
    this.expiresAt,
    this.updatedAt,
  });

  CompanyModel copyWith({
    String? id,
    String? name,
    String? address,
    DateTime? createdAt,
    DateTime? expiresAt,
    DateTime? updatedAt,
  }) {
    return CompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'expiresAt': expiresAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['_id'],
      name: map['name'],
      address: map['address'],
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt']).toLocal()
          : null,
      expiresAt: map['expiresAt'] != null
          ? DateTime.parse(map['expiresAt']).toLocal()
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt']).toLocal()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CompanyModel(id: $id, name: $name, address: $address, createdAt: $createdAt, expiresAt: $expiresAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanyModel &&
        other.id == id &&
        other.name == name &&
        other.address == address &&
        other.createdAt == createdAt &&
        other.expiresAt == expiresAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        createdAt.hashCode ^
        expiresAt.hashCode ^
        updatedAt.hashCode;
  }
}
