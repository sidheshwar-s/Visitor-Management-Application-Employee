import 'dart:convert';

class EmployeeModel {
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? uid;
  final String? image;
  final String? department;
  final String? designation;
  final bool? isOnVacationMode;
  final String? role;
  final String? companyId;
  final DateTime? createdAt;
  final String? status;
  EmployeeModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.uid,
    this.image,
    this.department,
    this.designation,
    this.isOnVacationMode,
    this.role,
    this.companyId,
    this.createdAt,
    this.status,
  });

  EmployeeModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? password,
    String? uid,
    String? image,
    String? department,
    String? designation,
    int? totalMeetingsDone,
    bool? isOnVacationMode,
    String? role,
    String? companyId,
    DateTime? createdAt,
    String? status,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      image: image ?? this.image,
      department: department ?? this.department,
      designation: designation ?? this.designation,
      isOnVacationMode: isOnVacationMode ?? this.isOnVacationMode,
      role: role ?? this.role,
      companyId: companyId ?? this.companyId,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'uid': uid,
      'image': image,
      'department': department,
      'designation': designation,
      'isOnVacationMode': isOnVacationMode,
      'role': role,
      'companyId': companyId,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'status': status,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['_id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      password: map['password'],
      uid: map['uid'],
      image: map['image']['url'],
      department: map['department'],
      designation: map['designation'],
      isOnVacationMode: map['isOnVacationMode'],
      role: map['role'],
      companyId: map['company'],
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt']).toLocal()
          : null,
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EmployeeModel(id: $id, name: $name, phone: $phone, email: $email, password: $password, uid: $uid, image: $image, department: $department, designation: $designation,  isOnVacationMode: $isOnVacationMode, role: $role, companyId: $companyId, createdAt: $createdAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmployeeModel &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        other.uid == uid &&
        other.image == image &&
        other.department == department &&
        other.designation == designation &&
        other.isOnVacationMode == isOnVacationMode &&
        other.role == role &&
        other.companyId == companyId &&
        other.createdAt == createdAt &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode ^
        uid.hashCode ^
        image.hashCode ^
        department.hashCode ^
        designation.hashCode ^
        isOnVacationMode.hashCode ^
        role.hashCode ^
        companyId.hashCode ^
        createdAt.hashCode ^
        status.hashCode;
  }
}
