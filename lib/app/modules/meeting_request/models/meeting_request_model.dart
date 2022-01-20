import 'dart:convert';

import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';

class MeetingRequestModel {
  final DateTime? counterEndTime;
  final MeetingModel meeting;
  final String? purpose;
  MeetingRequestModel({
    required this.counterEndTime,
    required this.meeting,
    this.purpose,
  });

  MeetingRequestModel copyWith({
    DateTime? counterEndTime,
    MeetingModel? meeting,
    String? purpose,
  }) {
    return MeetingRequestModel(
      counterEndTime: counterEndTime ?? this.counterEndTime,
      meeting: meeting ?? this.meeting,
      purpose: purpose ?? this.purpose,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counterEndTime': counterEndTime?.millisecondsSinceEpoch,
      'meeting': meeting.toMap(),
      'purpose': purpose,
    };
  }

  factory MeetingRequestModel.fromMap(Map<String, dynamic> map) {
    return MeetingRequestModel(
      counterEndTime: map['counterEndTime'] != null
          ? DateTime.parse(map['counterEndTime'])
          : null,
      meeting: MeetingModel.fromMap(map['meeting']),
      purpose: map['purpose'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MeetingRequestModel.fromJson(String source) =>
      MeetingRequestModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'MeetingRequestModel(counterEndTime: $counterEndTime, meeting: $meeting, purpose: $purpose)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeetingRequestModel &&
        other.counterEndTime == counterEndTime &&
        other.meeting == meeting &&
        other.purpose == purpose;
  }

  @override
  int get hashCode =>
      counterEndTime.hashCode ^ meeting.hashCode ^ purpose.hashCode;
}
