// To parse this JSON data, do
//
//     final participation = participationFromJson(jsonString);

import 'dart:convert';

Participation participationFromJson(String str) => Participation.fromJson(json.decode(str));

String participationToJson(Participation activity) => json.encode(activity.toJson());

class Participation {
    Participation({
        this.activity,
    });

    List<Activity> activity;

    factory Participation.fromJson(Map<String, dynamic> json) => Participation(
        activity: List<Activity>.from(json["activity"].map((x) => Activity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "activity": List<dynamic>.from(activity.map((x) => x.toJson())),
    };
}

class Activity {
    Activity({
        this.id,
        this.activityName,
        this.activityType,
        this.activityCategory,
        this.activityYear,
        this.activitySemester,
        this.pivot,
    });

    int id;
    String activityName;
    String activityType;
    String activityCategory;
    String activityYear;
    String activitySemester;
    Pivot pivot;

    factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        activityName: json["activity_name"],
        activityType: json["activity_type"],
        activityCategory: json["activity_category"],
        activityYear: json["activity_year"],
        activitySemester: json["activity_semester"],
        pivot: Pivot.fromJson(json["pivot"]),
    );


    Map<String, dynamic> toJson() => {
        "id": id,
        "activity_name": activityName,
        "activity_type": activityType,
        "activity_category": activityCategory,
        "activity_year": activityYear,
        "activity_semester": activitySemester,
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    Pivot({
        this.userId,
        this.activityId,
    });

    int userId;
    int activityId;

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        activityId: json["activity_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "activity_id": activityId,
    };
}
