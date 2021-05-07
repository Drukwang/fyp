import 'dart:convert';


class Activity {
  // ignore: non_constant_identifier_names
  final String activity_name;
  // ignore: non_constant_identifier_names
  final String activity_type;
  // ignore: non_constant_identifier_names
  final String activity_category;
  // ignore: non_constant_identifier_names
  final String activity_year;
  // ignore: non_constant_identifier_names
  final String activity_semester;
  final int id;

  Activity({
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    this.activity_name,
    // ignore: non_constant_identifier_names
    this.activity_type,
    // ignore: non_constant_identifier_names
    this.activity_category,
    // ignore: non_constant_identifier_names
    this.activity_year,
    // ignore: non_constant_identifier_names
    this.activity_semester,
    this.id,
  });

  Activity copyWith({
    // ignore: non_constant_identifier_names
    String activity_name,
    // ignore: non_constant_identifier_names
    String activity_type,
    // ignore: non_constant_identifier_names
    String activity_category,
    // ignore: non_constant_identifier_names
    String activity_year,
    // ignore: non_constant_identifier_names
    String activity_semester,
    int id,
  }) {
    return Activity(
      activity_name: activity_name ?? this.activity_name,
      activity_type: activity_type ?? this.activity_type,
      activity_category: activity_category ?? this.activity_category,
      activity_year: activity_year ?? this.activity_year,
      activity_semester: activity_semester ?? this.activity_semester,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'activity_name': activity_name,
      'activity_type': activity_type,
      'activity_category': activity_category,
      'activity_year': activity_year,
      'activity_semester': activity_semester,
      'id': id,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      activity_name: map['activity_name'],
      activity_type: map['activity_type'],
      activity_category: map['activity_category'],
      activity_year: map['activity_year'],
      activity_semester: map['activity_semester'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) => Activity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Activity(activity_name: $activity_name, activity_type: $activity_type, activity_category: $activity_category, activity_year: $activity_year, activity_semester: $activity_semester, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Activity &&
      other.activity_name == activity_name &&
      other.activity_type == activity_type &&
      other.activity_category == activity_category &&
      other.activity_year == activity_year &&
      other.activity_semester == activity_semester &&
      other.id == id;
  }

  @override
  int get hashCode {
    return activity_name.hashCode ^
      activity_type.hashCode ^
      activity_category.hashCode ^
      activity_year.hashCode ^
      activity_semester.hashCode ^
      id.hashCode;
  }
}
