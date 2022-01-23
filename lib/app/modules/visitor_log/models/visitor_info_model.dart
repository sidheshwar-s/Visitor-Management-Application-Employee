import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';

class VisitorInfoModel {
  final String? message;
  final List<MeetingModel>? completedMeetings;
  final List<MeetingModel>? rescheduledMeetings;
  final List<MeetingModel>? rejectedMeetings;
  VisitorInfoModel({
    this.message,
    this.completedMeetings,
    this.rescheduledMeetings,
    this.rejectedMeetings,
  });

  VisitorInfoModel copyWith({
    String? message,
    List<MeetingModel>? completedMeetings,
    List<MeetingModel>? rescheduledMeetings,
    List<MeetingModel>? rejectedMeetings,
  }) {
    return VisitorInfoModel(
      message: message ?? this.message,
      completedMeetings: completedMeetings ?? this.completedMeetings,
      rescheduledMeetings: rescheduledMeetings ?? this.rescheduledMeetings,
      rejectedMeetings: rejectedMeetings ?? this.rejectedMeetings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'completedMeetings': completedMeetings?.map((x) => x.toMap()).toList(),
      'rescheduledMeetings':
          rescheduledMeetings?.map((x) => x.toMap()).toList(),
      'rejectedMeetings': rejectedMeetings?.map((x) => x.toMap()).toList(),
    };
  }

  factory VisitorInfoModel.fromMap(Map<String, dynamic> map) {
    return VisitorInfoModel(
      message: map['message'],
      completedMeetings: map['completedMeetings'] != null
          ? List<MeetingModel>.from(
              map['completedMeetings']?.map((x) => MeetingModel.fromMap(x)))
          : null,
      rescheduledMeetings: map['rescheduledMeetings'] != null
          ? List<MeetingModel>.from(
              map['rescheduledMeetings']?.map((x) => MeetingModel.fromMap(x)))
          : null,
      rejectedMeetings: map['rejectedMeetings'] != null
          ? List<MeetingModel>.from(
              map['rejectedMeetings']?.map((x) => MeetingModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VisitorInfoModel.fromJson(String source) =>
      VisitorInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VisitorInfoModel(message: $message, completedMeetings: $completedMeetings, rescheduledMeetings: $rescheduledMeetings, rejectedMeetings: $rejectedMeetings)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VisitorInfoModel &&
        other.message == message &&
        listEquals(other.completedMeetings, completedMeetings) &&
        listEquals(other.rescheduledMeetings, rescheduledMeetings) &&
        listEquals(other.rejectedMeetings, rejectedMeetings);
  }

  @override
  int get hashCode {
    return message.hashCode ^
        completedMeetings.hashCode ^
        rescheduledMeetings.hashCode ^
        rejectedMeetings.hashCode;
  }
}
