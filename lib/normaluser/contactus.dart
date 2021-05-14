import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'About Us',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          margin: EdgeInsets.all(10),
          height: _height * 1,
          width: _width * 1,
          child: Text(
            '''Our app can assist users in keeping track of events and serving as evidence of interest in various college activities, which will aid in the evaluation of character certificates after graduation. It is the easiest way to keep track of events digitally with the aid of a smartphone application, and it also saves time as compared to paper-based applications.''',
            style: TextStyle(
              fontFamily: 'PTSrif',
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
