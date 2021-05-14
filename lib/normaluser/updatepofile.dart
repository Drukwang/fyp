import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fyp_app/normaluser/normaluserpage.dart';
//import 'package:fyp_app/normaluser/qrscanpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  int userID;
  Future getUserID() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var uid = sharedPreferences.getInt('ID');
    setState(() {
      userID = uid;
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

  void addData(
    String name,
    course,
    studentNo,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Uri uri = Uri.parse("http://192.168.173.61:8000/api/update/$userID");
    var response = await http.put(uri, headers: {
      'Authorization': 'Bearer $Value',
      "Accept": "application/json",
    }, body: {
      'name': name,
      'course': course,
      'student_no': studentNo,
    });
    // ignore: non_constant_identifier_names
    var JsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      if (JsonResponse != null) {
        setState(() {});
        sharedPreferences.setString('sno', JsonResponse['student_no']);
        sharedPreferences.setString('name', JsonResponse['name']);

        Fluttertoast.showToast(
            msg: "Profile Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NormalUser()));
        //Navigator.push(context, true);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Fail to update",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    setState(() {});

    getValidation();
    getUserID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val.isEmpty) return 'please enter your Name';
                          return null;
                        },
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val.isEmpty) return 'please enter your std no.';
                          return null;
                        },
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
                              if (formKey.currentState.validate()) {
                                addData(
                                  mycontroller1.text,
                                  valueChoose1,
                                  mycontroller2.text,
                                );
                              }
                              // Fluttertoast.showToast(
                              //   msg: "Fail to update",
                              //   toastLength: Toast.LENGTH_SHORT,
                              //   gravity: ToastGravity.BOTTOM,
                              //   backgroundColor: Colors.white,
                              //   textColor: Colors.black,
                              //   fontSize: 16.0);
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
