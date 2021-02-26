import 'package:flutter/material.dart';


class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'PTSerif',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // child: Row(
        //   children: <Widget>[
        //     Image(image: null),
        //   ],
        // ),
      ),
    );
  }
}

class UpdatePofile extends StatefulWidget {
  @override
  _UpdatePofileState createState() => _UpdatePofileState();
}

class _UpdatePofileState extends State<UpdatePofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'UpdateProfile',
          style: TextStyle(
            fontFamily: 'PTSerif',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // child: Row(
        //   children: <Widget>[
        //     Image(image: null),
        //   ],
        // ),
      ),
    );
  }
}

class RequestUpdate extends StatefulWidget {
  @override
  _RequestUpdateState createState() => _RequestUpdateState();
}

class _RequestUpdateState extends State<RequestUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Request Update',
          style: TextStyle(
            fontFamily: 'PTSerif',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // child: Row(
        //   children: <Widget>[
        //     Image(image: null),
        //   ],
        // ),
      ),
    );
  }
}

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Change Password',
          style: TextStyle(
            fontFamily: 'PTSerif',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // child: Row(
        //   children: <Widget>[
        //     Image(image: null),
        //   ],
        // ),
      ),
    );
  }
}