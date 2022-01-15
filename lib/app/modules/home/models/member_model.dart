import 'dart:convert';

class MemberModel {
  final String? name;
  final String? phone;
  MemberModel({
    this.name,
    this.phone,
  });

  MemberModel copyWith({
    String? name,
    String? phone,
  }) {
    return MemberModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      name: map['name'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberModel.fromJson(String source) =>
      MemberModel.fromMap(json.decode(source));

  @override
  String toString() => 'MemberModel(name: $name, phone: $phone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MemberModel && other.name == name && other.phone == phone;
  }

  @override
  int get hashCode => name.hashCode ^ phone.hashCode;
}
