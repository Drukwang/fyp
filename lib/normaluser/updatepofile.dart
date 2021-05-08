//import 'dart:convert';
import 'dart:io';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_app/homepage.dart';
import 'package:fyp_app/normaluser/contactus.dart';
import 'package:fyp_app/normaluser/normaluserpage.dart';
import 'package:fyp_app/normaluser/password.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fyp_app/normaluser/qrscanpage.dart';
//import 'package:fyp_app/normaluser/viewrecords.dart';

class UpdatePofile extends StatefulWidget {
  @override
  _UpdatePofileState createState() => _UpdatePofileState();
}

class _UpdatePofileState extends State<UpdatePofile> {
  final formKey = GlobalKey<FormState>();
  List listItem1 = [
    "Architecture",
    "Civil",
    "Electrical",
    "Information Technology",
    "Electronics Communication"
  ];
  String valueChoose1;
  String valueChoose2;
  TextEditingController mycontroller1 = new TextEditingController();
  TextEditingController mycontroller2 = new TextEditingController();
  int id;
  File _image;
  // ignore: non_constant_identifier_names
  String Value;

  Future getValidation() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString('Token');
    setState(() {
      Value = obtainedToken;
    });
  }

  Future getUserID() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var userID = sharedPreferences.getInt('ID');
    setState(() {
      id = userID;
    });
  }

  _imgFromCamera() async {
    var pickedImage = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  _imgFromGallery() async {
    var pickedImage = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = _image = File(pickedImage.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  // void addData(
  //   String name,
  //   course,
  //   int studentNo,
  // ) async {
  //   Map data = {'name': name, 'course': course, 'student_no': studentNo};

  //   ///print("user_image:  $image");f
  //   Uri uri = Uri.parse("http://192.168.166.61:8000/api/update/id");
  //   http.put(uri, headers: {
  //     'Authorization': 'Bearer $Value',
  //     // "Accept": "application/json",
  //     // 'Content_Type': 'multipart/form-data',
  //   }, body: {
  //     [data, id]

  //     //"date": "$date",
  //   }).then((response) {
  //     //print('Response status : ${response.statusCode}');
  //     //print('Response body : ${response.body}');
  //     // ignore: non_constant_identifier_names
  //     var JsonResponse = json.decode(response.body);
  //     if (response.statusCode == 200) {
  //       if (JsonResponse != null) {
  //         // Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
  //         return Fluttertoast.showToast(
  //             msg: "Profile Updated",
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.CENTER,
  //             timeInSecForIosWeb: 1,
  //             backgroundColor: Colors.greenAccent,
  //             textColor: Colors.white,
  //             fontSize: 16.0);
  //       }
  //     } else {
  //       return Fluttertoast.showToast(
  //           msg: "Try Again",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.greenAccent,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   });
  // }

  @override
  void initState() {
    setState(() {});

    getValidation();
    super.initState();
  }

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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      );
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordUpdate()),
                      );
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
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
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: CircleAvatar(
                        radius: 55,
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  _image,
                                  width: 150,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50)),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.blue[800],
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
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
                      child: TextFormField(
                        showCursor: true,
                        controller: mycontroller1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Enter Name',
                          labelStyle: TextStyle(
                            fontFamily: 'PTSerif',
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: 'PTSerif',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
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
                      child: TextFormField(
                        showCursor: true,
                        controller: mycontroller2,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
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
                            dropdownColor: Colors.blueGrey[100],
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 150, height: 50),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lightBlueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(color: Colors.black))),
                            ),
                            onPressed: () {
                              formKey.currentState.validate();
                              // addData(
                              //   mycontroller1.text,
                              //   valueChoose1,
                              //   int.parse(mycontroller2.text),
                              // );
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
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 150, height: 50),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lightBlueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(color: Colors.black))),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NormalUser()),
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
