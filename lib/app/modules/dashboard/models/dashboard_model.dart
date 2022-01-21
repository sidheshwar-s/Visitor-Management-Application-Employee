import 'dart:convert';
import 'package:vms_employee_flutter/app/modules/dashboard/models/most_visited_visitor_model.dart';
import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';

class DashBoardModel {
  final int? rescheduled;
  final int? inProgress;
  final int? rejected;
  final int? completed;
  final MostVisitedVisitorModel? mostVisitedVisitor;
  final MeetingModel? longestMeeting;
  final MeetingModel? shortestMeeting;
  DashBoardModel({
    this.rescheduled,
    this.inProgress,
    this.rejected,
    this.completed,
    this.mostVisitedVisitor,
    this.longestMeeting,
    this.shortestMeeting,
  });

  DashBoardModel copyWith({
    int? rescheduled,
    int? inProgress,
    int? rejected,
    int? completed,
    MostVisitedVisitorModel? mostVisitedVisitor,
    MeetingModel? longestMeeting,
    MeetingModel? shortestMeeting,
  }) {
    return DashBoardModel(
      rescheduled: rescheduled ?? this.rescheduled,
      inProgress: inProgress ?? this.inProgress,
      rejected: rejected ?? this.rejected,
      completed: completed ?? this.completed,
      mostVisitedVisitor: mostVisitedVisitor ?? this.mostVisitedVisitor,
      longestMeeting: longestMeeting ?? this.longestMeeting,
      shortestMeeting: shortestMeeting ?? this.shortestMeeting,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rescheduled': rescheduled,
      'inProgress': inProgress,
      'rejected': rejected,
      'completed': completed,
      'mostVisitedVisitor': mostVisitedVisitor?.toMap(),
      'longestMeeting': longestMeeting?.toMap(),
      'shortestMeeting': shortestMeeting?.toMap(),
    };
  }

  factory DashBoardModel.fromMap(Map<String, dynamic> map) {
    return DashBoardModel(
      rescheduled: map['rescheduled']?.length,
      inProgress: map['inProgress']?.length,
      rejected: map['rejected']?.length,
      completed: map['completed']?.length,
      mostVisitedVisitor: map['mostVisitedVisitor'] != null
          ? MostVisitedVisitorModel.fromMap(map['mostVisitedVisitor'])
          : null,
      longestMeeting:
          map['longestMeeting'] != null && map['longestMeeting'] != "0"
              ? MeetingModel.fromMap(map['longestMeeting'])
              : null,
      shortestMeeting:
          map['shortestMeeting'] != null && map['shortestMeeting'] != "0"
              ? MeetingModel.fromMap(map['shortestMeeting'])
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DashBoardModel.fromJson(String source) =>
      DashBoardModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DashBoardModel(rescheduled: $rescheduled, inProgress: $inProgress, rejected: $rejected, completed: $completed, mostVisitedVisitor: $mostVisitedVisitor, longestMeeting: $longestMeeting, shortestMeeting: $shortestMeeting)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DashBoardModel &&
        other.rescheduled == rescheduled &&
        other.inProgress == inProgress &&
        other.rejected == rejected &&
        other.completed == completed &&
        other.mostVisitedVisitor == mostVisitedVisitor &&
        other.longestMeeting == longestMeeting &&
        other.shortestMeeting == shortestMeeting;
  }

  @override
  int get hashCode {
    return rescheduled.hashCode ^
        inProgress.hashCode ^
        rejected.hashCode ^
        completed.hashCode ^
        mostVisitedVisitor.hashCode ^
        longestMeeting.hashCode ^
        shortestMeeting.hashCode;
  }
}
