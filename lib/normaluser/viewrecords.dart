//import 'dart:convert';
//import 'dart:convert';
import 'package:fyp_app/model/participation.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/normaluser/viewrecordBloc.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fyp_app/normaluser/qrscanpage.dart';
//import 'package:fyp_app/model/participation.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;

class ViewRecords extends StatefulWidget {
  @override
  _ViewRecordsState createState() => _ViewRecordsState();
}

class _ViewRecordsState extends State<ViewRecords> {
  final getUserActivity = viewrecordBloc();

  @override
  void initState() {
    getUserActivity.eventSink.add(getActivity.Fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Your Records',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: StreamBuilder<List<Activity>>(
              stream: getUserActivity.pendingStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error ?? 'Error'));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var article = snapshot.data[index];
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Text(
                                    "Activity Name: ${article.activityName}"),
                                title: Text("Year: ${article.activityYear}"),
                                subtitle: Text(
                                    "Semester: ${article.activitySemester}"),
                              ),
                            ),
                          ]),
                        );
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
