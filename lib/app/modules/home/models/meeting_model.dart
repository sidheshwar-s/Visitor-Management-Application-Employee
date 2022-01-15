import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vms_employee_flutter/app/modules/home/models/employee_model.dart';
import 'package:vms_employee_flutter/app/modules/home/models/member_model.dart';
import 'package:vms_employee_flutter/app/modules/home/models/visitor_model.dart';

class MeetingModel {
  final String? id;
  final VisitorModel? visitor;
  final EmployeeModel? employee;
  final DateTime? meetingRaisedTime;
  final DateTime? meetingRequestTime;
  final bool? accepted;
  final bool? rescheduled;
  final String? status;
  final List<MemberModel>? additionalMembers;
  final List<String>? otherBelongings;
  final bool? isInProgress;
  final String? purpose;
  final String? vehicleNumber;
  final String? companyId;
  final DateTime? counterEndTime;
  MeetingModel({
    this.id,
    this.visitor,
    this.employee,
    this.meetingRaisedTime,
    this.meetingRequestTime,
    this.accepted,
    this.rescheduled,
    this.status,
    this.additionalMembers,
    this.otherBelongings,
    this.isInProgress,
    this.purpose,
    this.vehicleNumber,
    this.companyId,
    this.counterEndTime,
  });

  MeetingModel copyWith({
    String? id,
    VisitorModel? visitor,
    EmployeeModel? employee,
    DateTime? meetingRaisedTime,
    DateTime? meetingRequestTime,
    bool? accepted,
    bool? rescheduled,
    String? status,
    List<MemberModel>? additionalMembers,
    List<String>? otherBelongings,
    bool? isInProgress,
    String? purpose,
    String? vehicleNumber,
    String? companyId,
    DateTime? counterEndTime,
  }) {
    return MeetingModel(
      id: id ?? this.id,
      visitor: visitor ?? this.visitor,
      employee: employee ?? this.employee,
      meetingRaisedTime: meetingRaisedTime ?? this.meetingRaisedTime,
      meetingRequestTime: meetingRequestTime ?? this.meetingRequestTime,
      accepted: accepted ?? this.accepted,
      rescheduled: rescheduled ?? this.rescheduled,
      status: status ?? this.status,
      additionalMembers: additionalMembers ?? this.additionalMembers,
      otherBelongings: otherBelongings ?? this.otherBelongings,
      isInProgress: isInProgress ?? this.isInProgress,
      purpose: purpose ?? this.purpose,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      companyId: companyId ?? this.companyId,
      counterEndTime: counterEndTime ?? this.counterEndTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'visitor': visitor?.toMap(),
      'employee': employee?.toMap(),
      'meetingRaisedTime': meetingRaisedTime?.millisecondsSinceEpoch,
      'meetingRequestTime': meetingRequestTime?.millisecondsSinceEpoch,
      'accepted': accepted,
      'rescheduled': rescheduled,
      'status': status,
      'additionalMembers': additionalMembers?.map((x) => x.toMap()).toList(),
      'otherBelongings': otherBelongings,
      'isInProgress': isInProgress,
      'purpose': purpose,
      'vehicleNumber': vehicleNumber,
      'companyId': companyId,
      'counterEndTime': counterEndTime?.millisecondsSinceEpoch,
    };
  }

  factory MeetingModel.fromMap(Map<String, dynamic> map) {
    return MeetingModel(
      id: map['_id'] ?? '',
      visitor:
          map['visitor'] != null ? VisitorModel.fromMap(map['visitor']) : null,
      employee: map['employee'] != null
          ? EmployeeModel.fromMap(map['employee'])
          : null,
      meetingRaisedTime: map['meetingRaisedTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['meetingRaisedTime'])
          : null,
      meetingRequestTime: map['meetingRequestTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['meetingRequestTime'])
          : null,
      accepted: map['accepted'],
      rescheduled: map['rescheduled'],
      status: map['status'],
      additionalMembers: map['additionalMembers'] != null
          ? List<MemberModel>.from(
              map['additionalMembers']?.map((x) => MemberModel.fromMap(x)))
          : null,
      otherBelongings: List<String>.from(map['otherBelongings']),
      isInProgress: map['isInProgress'],
      purpose: map['purpose'],
      vehicleNumber: map['vehicleNumber'],
      companyId: map['company'],
      counterEndTime: map['counterEndTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['counterEndTime'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MeetingModel.fromJson(String source) =>
      MeetingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MeetingModel(id: $id, visitor: $visitor, employee: $employee, meetingRaisedTime: $meetingRaisedTime, meetingRequestTime: $meetingRequestTime, accepted: $accepted, rescheduled: $rescheduled, status: $status, additionalMembers: $additionalMembers, otherBelongings: $otherBelongings, isInProgress: $isInProgress, purpose: $purpose, vehicleNumber: $vehicleNumber, companyId: $companyId, counterEndTime: $counterEndTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeetingModel &&
        other.id == id &&
        other.visitor == visitor &&
        other.employee == employee &&
        other.meetingRaisedTime == meetingRaisedTime &&
        other.meetingRequestTime == meetingRequestTime &&
        other.accepted == accepted &&
        other.rescheduled == rescheduled &&
        other.status == status &&
        listEquals(other.additionalMembers, additionalMembers) &&
        listEquals(other.otherBelongings, otherBelongings) &&
        other.isInProgress == isInProgress &&
        other.purpose == purpose &&
        other.vehicleNumber == vehicleNumber &&
        other.companyId == companyId &&
        other.counterEndTime == counterEndTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        visitor.hashCode ^
        employee.hashCode ^
        meetingRaisedTime.hashCode ^
        meetingRequestTime.hashCode ^
        accepted.hashCode ^
        rescheduled.hashCode ^
        status.hashCode ^
        additionalMembers.hashCode ^
        otherBelongings.hashCode ^
        isInProgress.hashCode ^
        purpose.hashCode ^
        vehicleNumber.hashCode ^
        companyId.hashCode ^
        counterEndTime.hashCode;
  }
}
