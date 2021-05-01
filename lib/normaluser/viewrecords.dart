import 'package:flutter/material.dart';
import 'package:fyp_app/homepage.dart';
import 'package:fyp_app/normaluser/contactus.dart';
import 'package:fyp_app/normaluser/password.dart';

class ViewRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/cstlogo.png'),
                    radius: 60,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('About Us',
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                        )),
                        onTap: (){
                          Navigator.push(
                            context,  MaterialPageRoute(builder: (context) => ContactUs()),);
                        },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Update Password',
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                        )),
                        onTap: (){
                          Navigator.push(
                            context,  MaterialPageRoute(builder: (context) => PasswordUpdate()),);
                        },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out',
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                        )),
                        onTap: (){
                          Navigator.push(
                            context,  MaterialPageRoute(builder: (context) => HomePage()),);
                        },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 30, 0, 0),
            child: ListTile(
              focusColor: Colors.amberAccent,
                  leading: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),
                  title: Text('Name: Drukwang Norbu',
                    style: TextStyle(
                        fontSize: 20,
                      ),
                  ),
                  subtitle: Text('0217508.cst@ub.edu.bt'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Table(              
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(
                  children: <Widget> [
                    Container(
                      height: 50,
                      width: 12,                      
                      child:Text('Sl No.',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PTSerif',
                        ),
                      ), 
                    ),
                    Container(
                      height: 50,
                      width: 12,                      
                      child:Text('Activity Name',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                    ),    
                    Container(
                      height: 50,
                      width: 12,                      
                      child:Text('Date',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'PTSerif',
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      
                    ), 
                    Container(
                      height: 50,
                      width: 12,                      
                      child:Text('Category',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'PTSerif',
                        fontWeight: FontWeight.bold,
                      ),
                      ),                    
                    ),
                    Container(
                      height: 50,
                      width: 12,                      
                      child:Text('Types',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                    ),
                    Container(
                      height: 50,
                      width: 12,                      
                      child:Text('Remarks',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                    ),
                     
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 12,                      
                      
                    ),
                    Container(
                      height: 50,
                      width: 12,                      
                      
                    ),    
                    Container(
                      height: 50,
                      width: 12,                      
                     
                    ), 
                    Container(
                      height: 50,
                      width: 12,                      
                                        
                    ),
                    Container(
                      height: 50,
                      width: 12,                      
                      
                    ),
                    Container(
                      height: 50,
                      width: 12,                      
                      
                    ),
                  ]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}