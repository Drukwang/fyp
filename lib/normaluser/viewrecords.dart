//import 'dart:convert';
//import 'dart:convert';
import 'package:fyp_app/model/participation.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/normaluser/viewrecordBloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    getEmail();
    getSno();
    getName();
    getUserActivity.eventSink.add(getActivity.Fetch);
    super.initState();
  }

  String email;
  Future getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    var getEmail = prefs.getString('email');
    setState(() {
      email = getEmail;
    });
  }

  String name;
  Future getName() async {
    final prefs = await SharedPreferences.getInstance();
    var getNa = prefs.getString('name');
    setState(() {
      name = getNa;
    });
  }

  String sno;
  Future getSno() async {
    final prefs = await SharedPreferences.getInstance();
    var getStd = prefs.getString('sno');
    setState(() {
      sno = getStd;
    });
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
      body: Column(
        children: [
          Card(
            color: Colors.grey[400],
            child: Container(
              width: 500,
              child: Column(
                children: [
                  Text(
                    email ?? 'default value',
                    style: TextStyle(
                      fontFamily: 'PTSerif',
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    name ?? 'default value',
                    style: TextStyle(
                      fontFamily: 'PTSerif',
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    sno ?? 'default value',
                    style: TextStyle(
                      fontFamily: 'PTSerif',
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
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
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(children: [
                                  Text(
                                    "Activity Name: ${article.activityName}",
                                    style: TextStyle(
                                      fontFamily: 'PTSerif',
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "Year: ${article.activityYear}",
                                    style: TextStyle(
                                      fontFamily: 'PTSerif',
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "Semester: ${article.activitySemester}",
                                    style: TextStyle(
                                      fontFamily: 'PTSerif',
                                      fontSize: 20,
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: ListTile(
                                  //     leading: Text(
                                  //         "Activity Name: ${article.activityName}"),
                                  //     title:
                                  //         Text("Year: ${article.activityYear}"),
                                  //     subtitle: Text(
                                  //         "Semester: ${article.activitySemester}"),
                                  //   ),
                                  // ),
                                ]),
                              ),
                            );
                          });
                    } else
                      return Center(child: CircularProgressIndicator());
                  })),
        ],
      ),
    );
  }
}
