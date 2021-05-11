import 'dart:convert';

class User {
  // ignore: non_constant_identifier_names
  final int id;
  final String name;
  // ignore: non_constant_identifier_names
  final String email;
  // ignore: non_constant_identifier_names
  final String course;
  // ignore: non_constant_identifier_names
  final String student_no;
  // ignore: non_constant_identifier_names
  final String role;

  User({
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    this.id,
    // ignore: non_constant_identifier_names
    this.name,
    // ignore: non_constant_identifier_names
    this.email,
    // ignore: non_constant_identifier_names
    this.course,
    // ignore: non_constant_identifier_names
    this.student_no,
    this.role,
  });

  User copyWith({
    int id,
    // ignore: non_constant_identifier_names
    String name,
    // ignore: non_constant_identifier_names
    String email,
    // ignore: non_constant_identifier_names
    String course,
    // ignore: non_constant_identifier_names
    String student_no,
    // ignore: non_constant_identifier_names
    String role,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      course: course ?? this.course,
      student_no: student_no ?? this.student_no,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'course': course,
      'student_no': student_no,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      course: map['course'],
      student_no: map['student_no'],
      role: map['role'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return ' User(id: $id, name: $name, email: $email, course: $course, student_no: $student_no, role: $role, )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.course == course &&
        other.student_no == student_no &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        course.hashCode ^
        student_no.hashCode ^
        id.hashCode;
  }
}
