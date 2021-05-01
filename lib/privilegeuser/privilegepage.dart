import 'package:flutter/material.dart';
import 'package:fyp_app/homepage.dart';
import 'package:fyp_app/privilegeuser/qrgenerated.dart';

class PrivilegeActivity extends StatefulWidget {
  PrivilegeActivity({Key key}) : super(key: key);
  @override
  _PrivilegeActivityState createState() => _PrivilegeActivityState();
}
TextEditingController mycontroller1 = new TextEditingController();
TextEditingController mycontroller2 = new TextEditingController();
TextEditingController mycontroller3 = new TextEditingController();
TextEditingController mycontroller4 = new TextEditingController();
TextEditingController mycontroller5 = new TextEditingController();
class _PrivilegeActivityState extends State<PrivilegeActivity> {   
  final formKey = GlobalKey<FormState>();
  String valueChoose1;
  String valueChoose2;
  String valueChoose3;
  List listItem1 = ["Spring Semester", "Autumn Semester"];
  List listItem2 = ["Cultural Activities", "Games", "SUPW", "Voluntary Works"];
  List listItem3 = ["Intercollege", "Intracollege"];
 
  @override  
  Widget build(BuildContext context) {        
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text(
              'Activity',
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text('About Us',
                              style: TextStyle(
                                fontFamily: 'PTSerif',
                                fontSize: 20,
                              )),
                        ),
                      ),
                       Divider(),
                         Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: ListTile(
                            leading: Icon(Icons.arrow_back),
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
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: 700,
              width: 400,
              margin: EdgeInsets.fromLTRB(10, 0.0, 10, 0.0),
              padding: EdgeInsets.only(bottom:30),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
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
                            labelText: 'Activity Name',
                            labelStyle: TextStyle(
                              fontFamily: 'PTSerif',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Activity Name',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: 'PTSerif',
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Activity Name required';
                            }
                            return null;
                          },
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
                            labelText: 'Enter year',
                            labelStyle: TextStyle(
                              fontFamily: 'PTSerif',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            hintText: 'eg. 2021',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: 'PTSerif',
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Year';
                            }
                            return null;
                          },
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
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: Colors.blue,
                                  hint: Text(
                                    'Select semester',
                                    style: TextStyle(
                                      fontFamily: 'PTSerif',
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'PTSerif',
                                    color: Colors.black,
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
                                          fontSize: 20,
                                        ),
                                      ),
                                    );
                                  }).toList(),
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
                                    'Select Category',
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
                                  value: valueChoose2,
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueChoose2 = newValue;
                                    });
                                  },
                                  items: listItem2.map((valueItem) {
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
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                dropdownColor: Colors.white,
                                hint: Text(
                                  'Select Types',
                                  style: TextStyle(
                                    fontFamily: 'PTSerif',
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'PTSerif',
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                isExpanded: true,
                                value: valueChoose3,
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose3 = newValue;
                                  });
                                },
                                items: listItem3.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(
                                      valueItem,
                                      style: TextStyle(
                                        fontFamily: 'PTSerif',
                                        fontSize: 20,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),

                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Category is required';
                //   }
                // }
                    Container(
                      padding: EdgeInsets.only(top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 180,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,5,0),
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
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QRGenerated(mycontroller1.text + '\n' + mycontroller2.text)));
                                },
                                child: Text(
                                  'Generate QR',
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
          ),
        );
      }
}
