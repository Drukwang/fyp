import 'package:flutter/material.dart';
class PasswordUpdate extends StatefulWidget {
  @override
  _PasswordUpdateState createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Change Password',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[           
           CircleAvatar(
               child: Icon(Icons.person,
               size: 50,),  
               radius: 50,            
            ),
           Container(
             child: TextFormField(
               decoration: InputDecoration(
                labelText: 'Enter previous password',            
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PTSerif',
                ),
             ),
           ),
           Container(
             child: TextFormField(
               decoration: InputDecoration(
                labelText: 'Enter new password',
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PTSerif',
                ),
             ),
           ),
           Container(
             child: TextFormField(
               decoration: InputDecoration(
                labelText: 'Confirm new password',
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PTSerif',
                ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(top: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget> [
                 RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(
                      fontFamily: 'PTSerif',
                      fontSize: 20,
                    ),
                  ),
                ),
             
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'PTSerif',
                        fontSize: 20,
                      ),
                    ),
                  ),
               ],                       
              ),
           ),   
         ],
        ),
      ),
    );
  }
}