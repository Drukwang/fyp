import 'package:flutter/material.dart';
import 'package:fyp_app/homepage.dart';
import 'package:fyp_app/normaluser/contactus.dart';
import 'package:fyp_app/normaluser/password.dart';
import 'package:fyp_app/normaluser/qrscanpage.dart';

class UpdatePofile extends StatefulWidget {
  @override
  _UpdatePofileState createState() => _UpdatePofileState();
}

class _UpdatePofileState extends State<UpdatePofile> {
  final formKey = GlobalKey<FormState>();
  List listItem1 = ["Architecture", "Civil", "Electrical", "Information Technology", "Electronics Communication"];
  TextEditingController mycontroller1 = new TextEditingController();
  TextEditingController mycontroller2 = new TextEditingController();
  TextEditingController mycontroller3 = new TextEditingController();
  TextEditingController mycontroller4 = new TextEditingController();
  TextEditingController mycontroller5 = new TextEditingController();
  String valueChoose1;
  String valueChoose2;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Update Profile',
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
      body: Container( 
        margin: EdgeInsets.all(10),          
        child: Form(
          key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Card(
                  shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ), 
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      showCursor: true,
                      controller: mycontroller1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        // suffixIcon: IconButton(
                        //   onPressed: () => mycontroller1.clear(),
                        //   icon: Icon(Icons.clear),
                        // ),
                        labelText: 'First Name',
                        labelStyle: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        hintText: 'Enter your first name',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PTSerif',
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ), 
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      showCursor: true,
                      controller: mycontroller2,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        // suffixIcon: IconButton(
                        //   onPressed: () => mycontroller1.clear(),
                        //   icon: Icon(Icons.clear),
                        // ),
                        labelText: 'Middle Name',
                        labelStyle: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        hintText: 'Enter your middle name',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PTSerif',
                        ),
                      ),
                    ),
                  ),
                ),           
                Card(
                  shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ), 
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      showCursor: true,
                      controller: mycontroller3,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        hintText: 'Enter your last name',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PTSerif',
                        ),
                      ),
                    ),
                  ),
                ), 
                Container(
                  height: 75,
                  child: Card(
                    shape: RoundedRectangleBorder(
                     side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ), 
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    //padding: EdgeInsets.only(right: 50),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              hint: Text(
                                'Department',
                                style: TextStyle(
                                  fontFamily: 'PTSerif',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'PTSerif',
                                fontSize: 20,
                              ),
                              isExpanded: true,
                              value: valueChoose1,
                              onChanged: (newValue) {
                                setState(() {
                                  valueChoose1 = newValue;
                                });
                              },
                              items: listItem1.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(
                                      fontFamily: 'PTSerif',
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                    ),
                  ),
                ),          
                  
                Card(
                  shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ), 
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      showCursor: true,
                      controller: mycontroller5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        labelText: 'Student Number',
                        labelStyle: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        hintText: 'Enter your student no.',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PTSerif',
                        ),
                      ),
                    ),
                  ),
                ),           
                        
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [  
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5,0,5,0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 150, height: 50),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(color: Colors.black)
                                )
                              ),                        
                            ),
                            onPressed: () {                          
                            },
                            child: Text(
                              'Update',
                              style: TextStyle(
                                fontFamily: 'PTSerif',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5,0,5,0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 150, height: 50),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(color: Colors.black)
                                )
                              ),                        
                            ),
                            onPressed: () {
                              Navigator.push(
                            context,  MaterialPageRoute(builder: (context) => QRScanPage()),);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontFamily: 'PTSerif',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),              
              ],
            ),
        ),
      ),
    );
  }
}



