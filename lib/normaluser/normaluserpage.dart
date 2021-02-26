import 'package:flutter/material.dart';
import 'package:FYPApp/normaluser/pofile.dart';

class NormalUser extends StatefulWidget {
  @override
  _NormalUserState createState() => _NormalUserState();
}

class _NormalUserState extends State<NormalUser> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Student Activity Record',
          style: TextStyle(
            fontFamily: 'PTSerif',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
           key: formKey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.values[5],
            
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 120),
                height: 300,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 180,
                      height: 30,
                                child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewProfile()),
                            );
                          }
                        },
                        child: Text(
                          'View Profile',
                          style: TextStyle(
                            fontFamily: 'PTSerif',
                          ),
                        ),
                      ),
                    ),
                  
              SizedBox(
                width: 180,
                height: 30,
                          child: RaisedButton(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePofile()),
                      );
                    }
                  },
                  child: Text(
                    'Update Profile',
                    style: TextStyle(
                      fontFamily: 'PTSerif',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 180,
                height: 30,
                          child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RequestUpdate()),
                      );
                    }
                  },
                  child: Text(
                    'Request Update',
                    style: TextStyle(
                      fontFamily: 'PTSerif',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 180,
                height: 30,
                          child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePassword()),
                      );
                    }
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      fontFamily: 'PTSerif',
                    ),
                  ),
                ),
              ), 
              ],
                ),
              ),
              // IconButton(                          
              //   icon: Icon(Icons.query_builder),
              //   onPressed: () => Scanner(),
              // ),           
            ],
          ),
        ),
      ),
    );
  }
}
