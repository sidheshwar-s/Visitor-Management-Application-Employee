import 'dart:convert';

class VisitorInfoModel {
  final String? message;
  final int? completedMeetings;
  final int? rescheduledMeetings;
  final int? rejectedMeetings;
  VisitorInfoModel({
    this.message,
    this.completedMeetings,
    this.rescheduledMeetings,
    this.rejectedMeetings,
  });

  VisitorInfoModel copyWith({
    String? message,
    int? completedMeetings,
    int? rescheduledMeetings,
    int? rejectedMeetings,
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
      'completedMeetings': completedMeetings,
      'rescheduledMeetings': rescheduledMeetings,
      'rejectedMeetings': rejectedMeetings,
    };
  }

  factory VisitorInfoModel.fromMap(Map<String, dynamic> map) {
    return VisitorInfoModel(
      message: map['message'],
      completedMeetings: map['completedMeetings']?.length,
      rescheduledMeetings: map['rescheduledMeetings']?.length,
      rejectedMeetings: map['rejectedMeetings']?.length,
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
        other.completedMeetings == completedMeetings &&
        other.rescheduledMeetings == rescheduledMeetings &&
        other.rejectedMeetings == rejectedMeetings;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        completedMeetings.hashCode ^
        rescheduledMeetings.hashCode ^
        rejectedMeetings.hashCode;
  }
}
