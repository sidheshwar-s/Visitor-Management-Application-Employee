import 'dart:convert';
import 'package:flutter/foundation.dart';

class VisitorLogModel {
  final String? message;
  final List<VisitorLogVisitors> visitors;
  VisitorLogModel({
    this.message,
    required this.visitors,
  });

  VisitorLogModel copyWith({
    String? message,
    List<VisitorLogVisitors>? visitors,
  }) {
    return VisitorLogModel(
      message: message ?? this.message,
      visitors: visitors ?? this.visitors,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'visitors': visitors.map((x) => x.toMap()).toList(),
    };
  }

  factory VisitorLogModel.fromMap(Map<String, dynamic> map) {
    return VisitorLogModel(
      message: map['message'],
      visitors: List<VisitorLogVisitors>.from(
          map['visitors']?.map((x) => VisitorLogVisitors.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory VisitorLogModel.fromJson(String source) =>
      VisitorLogModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'VisitorLogModel(message: $message, visitors: $visitors)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VisitorLogModel &&
        other.message == message &&
        listEquals(other.visitors, visitors);
  }

  @override
  int get hashCode => message.hashCode ^ visitors.hashCode;
}

class VisitorLogVisitors {
  final String? name;
  final String? companyName;
  final String? selfieLink;
  final String? id;
  VisitorLogVisitors({
    this.name,
    this.companyName,
    this.selfieLink,
    this.id,
  });

  VisitorLogVisitors copyWith({
    String? name,
    String? companyName,
    String? selfieLink,
    String? id,
  }) {
    return VisitorLogVisitors(
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      selfieLink: selfieLink ?? this.selfieLink,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'companyName': companyName,
      'selfieLink': selfieLink,
      'id': id,
    };
  }

  factory VisitorLogVisitors.fromMap(Map<String, dynamic> map) {
    return VisitorLogVisitors(
      name: map['name'],
      companyName: map['companyName'],
      selfieLink: map['selfieLink'],
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VisitorLogVisitors.fromJson(String source) =>
      VisitorLogVisitors.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VisitorLogVisitors(name: $name, companyName: $companyName, selfieLink: $selfieLink, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VisitorLogVisitors &&
        other.name == name &&
        other.companyName == companyName &&
        other.selfieLink == selfieLink &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        companyName.hashCode ^
        selfieLink.hashCode ^
        id.hashCode;
  }
}
