import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vms_employee_flutter/app/modules/home/models/employee_model.dart';
import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';

class HomePageModel {
  final String? message;
  final List<MeetingModel>? requestMeetings;
  final List<MeetingModel>? todayCompletedMeetings;
  final List<MeetingModel>? inProgressMeetings;
  final EmployeeModel? employee;
  HomePageModel({
    this.message,
    this.requestMeetings,
    this.todayCompletedMeetings,
    this.inProgressMeetings,
    this.employee,
  });

  HomePageModel copyWith({
    String? message,
    List<MeetingModel>? requestMeetings,
    List<MeetingModel>? todayCompletedMeetings,
    List<MeetingModel>? inProgressMeetings,
    EmployeeModel? employee,
  }) {
    return HomePageModel(
      message: message ?? this.message,
      requestMeetings: requestMeetings ?? this.requestMeetings,
      todayCompletedMeetings:
          todayCompletedMeetings ?? this.todayCompletedMeetings,
      inProgressMeetings: inProgressMeetings ?? this.inProgressMeetings,
      employee: employee ?? this.employee,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'requestMeetings': requestMeetings?.map((x) => x.toMap()).toList(),
      'todayCompletedMeetings':
          todayCompletedMeetings?.map((x) => x.toMap()).toList(),
      'inProgressMeetings': inProgressMeetings?.map((x) => x.toMap()).toList(),
      'employee': employee?.toMap(),
    };
  }

  factory HomePageModel.fromMap(Map<String, dynamic> map) {
    return HomePageModel(
      message: map['message'],
      requestMeetings: map['requestMeetings'] != null
          ? List<MeetingModel>.from(
              map['requestMeetings']?.map((x) => MeetingModel.fromMap(x)))
          : null,
      todayCompletedMeetings: map['todayCompletedMeetings'] != null
          ? List<MeetingModel>.from(map['todayCompletedMeetings']
              ?.map((x) => MeetingModel.fromMap(x)))
          : null,
      inProgressMeetings: map['inProgressMeetings'] != null
          ? List<MeetingModel>.from(
              map['inProgressMeetings']?.map((x) => MeetingModel.fromMap(x)))
          : null,
      employee: map['employee'] != null
          ? EmployeeModel.fromMap(map['employee'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomePageModel.fromJson(String source) =>
      HomePageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomePageModel(message: $message, requestMeetings: $requestMeetings, todayCompletedMeetings: $todayCompletedMeetings, inProgressMeetings: $inProgressMeetings, employee: $employee)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomePageModel &&
        other.message == message &&
        listEquals(other.requestMeetings, requestMeetings) &&
        listEquals(other.todayCompletedMeetings, todayCompletedMeetings) &&
        listEquals(other.inProgressMeetings, inProgressMeetings) &&
        other.employee == employee;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        requestMeetings.hashCode ^
        todayCompletedMeetings.hashCode ^
        inProgressMeetings.hashCode ^
        employee.hashCode;
  }
}
