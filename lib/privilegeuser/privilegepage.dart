import 'package:flutter/material.dart';
import 'package:fyp_app/main.dart';
import 'package:fyp_app/privilegeuser/manualupdate.dart';
import 'package:fyp_app/privilegeuser/qrgenerated.dart';
class PrivilegeActivity extends StatefulWidget {
  PrivilegeActivity({Key key}) : super(key: key);
  @override
  _PrivilegeActivityState createState() => _PrivilegeActivityState();
}
TextEditingController mycontroller = new TextEditingController();
class _PrivilegeActivityState extends State<PrivilegeActivity> {
  final formKey = GlobalKey<FormState>();
  String valueChoose1;
  String valueChoose2;
  List listItem1 = ["Cultural Activities", "Games", "SUPW", "Voluntary Works"];
  List listItem2 = ["Intercollege", "Intracollege"];
  DateTime date;
  @override
  void initState() {
    super.initState();
    date = DateTime.now();
  }

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
      body: Container(
        height: 800,
        width: 400,
        margin: EdgeInsets.fromLTRB(10, 0.0, 10, 0.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
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
                  // ignore: missing_return
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Activity Name required';
                    }
                  },
                ),
              ),             
              ListTile(
                title: Text(
                    'Date: ${date.year}, ${date.month}, ${date.day}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: () async{
                  DateTime ddate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(DateTime.now().year),
                      lastDate: DateTime(DateTime.now().year + 1));
                  if (date != null)
                    setState(() {
                      date = ddate;
                    });
                },
              ),
              Container(
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
              // Divider(
              //   color: Colors.black54,
              // ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: EdgeInsets.only(right: 170),
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
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // validator: (value) {
              //   if (value.isEmpty) {
              //     return 'Category is required';
              //   }
              // },

              Flexible(
                child: TextFormField(
                  controller: mycontroller,
                  decoration: InputDecoration(
                    labelText: 'Remarks',
                    labelStyle: TextStyle(
                      fontFamily: 'PTSerif',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    hintText: 'Enter Remarks',
                    hintStyle: TextStyle(
                      fontFamily: 'PTSerif',
                      fontSize: 18,
                    ),
                  ),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Remarks is required';
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
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
                          print(mycontroller.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QRGenerated(mycontroller.text)));
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
                    Padding(
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
                              builder: (context) => ManualUpdate()));
                      },
                      child: Text(
                        'Manual Update',
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
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
