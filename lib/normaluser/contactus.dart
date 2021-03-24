import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Contact Us',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),  
      body: Container(
        margin: EdgeInsets.all(10),
        height: 500,
        width: 500,
        child: Text('This is about contact us page',
          style: TextStyle(
            fontFamily: 'PTSrif',
            fontSize: 20,
          ),
        ),
      ),    
    );
  }
}