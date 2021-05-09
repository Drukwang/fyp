import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          height: 500,
          width: 500,
          child: Text('''Our app can assist users in keeping track of events and serving as evidence of interest in various college activities, which will aid in the evaluation of character certificates after graduation. It is the easiest way to keep track of events digitally with the aid of a smartphone application, and it also saves time as compared to paper-based applications.''',
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