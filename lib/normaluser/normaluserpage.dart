import 'package:flutter/material.dart';
import 'package:fyp_app/normaluser/qrscanpage.dart';
import 'package:fyp_app/normaluser/updatepofile.dart';
import 'package:fyp_app/normaluser/viewrecords.dart';

class NormalUser extends StatefulWidget {
  NormalUser({Key key}) : super(key: key);
  @override
  _NormalUserState createState() => _NormalUserState();
}

String qrData = "No data found!";
var data;
bool hasdata = false;

class _NormalUserState extends State<NormalUser> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    UpdatePofile(),
    QRScanPage(),
    ViewRecords(),
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text("Do you really want to exit?"),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("No"),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  ElevatedButton(
                    child: Text("Yes"),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Manage Profile',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/scan-image.png',
              height: 30,
              width: 30,
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: 'Records',
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: _children[_currentIndex],
      ),
    );
  }
}
