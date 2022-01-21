import 'dart:convert';

class MostVisitedVisitorModel {
  final int? count;
  final String? visitorName;
  final String? companyName;
  final String? selfieLink;
  MostVisitedVisitorModel({
    this.count,
    this.visitorName,
    this.companyName,
    this.selfieLink,
  });

  MostVisitedVisitorModel copyWith({
    int? count,
    String? visitorName,
    String? companyName,
    String? selfieLink,
  }) {
    return MostVisitedVisitorModel(
      count: count ?? this.count,
      visitorName: visitorName ?? this.visitorName,
      companyName: companyName ?? this.companyName,
      selfieLink: selfieLink ?? this.selfieLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'visitorName': visitorName,
      'companyName': companyName,
      'selfieLink': selfieLink,
    };
  }

  factory MostVisitedVisitorModel.fromMap(Map<String, dynamic> map) {
    return MostVisitedVisitorModel(
      count: map['count']?.toInt(),
      visitorName: map['visitor']?['name'],
      companyName: map['visitor']?['companyName'],
      selfieLink: map['visitor']?['selfieLink'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MostVisitedVisitorModel.fromJson(String source) =>
      MostVisitedVisitorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MostVisitedVisitorModel(count: $count, visitorName: $visitorName, companyName: $companyName, selfieLink: $selfieLink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MostVisitedVisitorModel &&
        other.count == count &&
        other.visitorName == visitorName &&
        other.companyName == companyName &&
        other.selfieLink == selfieLink;
  }

  @override
  int get hashCode {
    return count.hashCode ^
        visitorName.hashCode ^
        companyName.hashCode ^
        selfieLink.hashCode;
  }
}
