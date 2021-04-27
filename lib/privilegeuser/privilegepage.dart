import 'package:flutter/material.dart';
import 'package:fyp_app/homepage.dart';
//import 'package:fyp_app/main.dart';
import 'package:fyp_app/privilegeuser/manualupdate.dart';
import 'package:fyp_app/privilegeuser/qrgenerated.dart';
//import 'package:shared_preferences/shared_preferences.dart';
class PrivilegeActivity extends StatefulWidget {
  PrivilegeActivity({Key key}) : super(key: key);
  @override
  _PrivilegeActivityState createState() => _PrivilegeActivityState();
}
TextEditingController mycontroller1 = new TextEditingController();
TextEditingController mycontroller2 = new TextEditingController();
TextEditingController mycontroller3 = new TextEditingController();
TextEditingController mycontroller4 = new TextEditingController();
class _PrivilegeActivityState extends State<PrivilegeActivity> {   
  final formKey = GlobalKey<FormState>();
  String valueChoose1;
  String valueChoose2;
  List listItem1 = ["Cultural Activities", "Games", "SUPW", "Voluntary Works"];
  List listItem2 = ["Intercollege", "Intracollege"];
  DateTime selectedDate = DateTime.now(); 
  //DateTime date;
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
              height: 800,
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
                            // suffixIcon: IconButton(
                            //   onPressed: () => mycontroller1.clear(),
                            //   icon: Icon(Icons.clear),
                            // ),
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
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
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
                            //alignment: Alignment.topLeft,
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                  'Select date:',// ${date.year}, ${date.month}, ${date.day}',
                                  style: TextStyle(
                                    fontSize: 20,
                                   
                                  ),                              
                                ),
                                Icon(Icons.keyboard_arrow_down),
                                
                                ],
                            ),
                              ),
                            Text(selectedDate.toString(),
                            textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                              ),
                            ),
                            ],),
                          ),
                        ),
                      ),
                      onTap: () => _selectDate(context),
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
                // Divider(
                //   color: Colors.black54,
                // ),
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
                    ),
               ),

                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Category is required';
                //   }
                // },

                Card(
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
                                      child: TextFormField(
                      controller: mycontroller4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
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
                ),
                Container(
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    builder: (context) => QRGenerated(mycontroller1.text + '\n' + mycontroller4.text)));
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
  _selectDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  if (picked != null && picked != selectedDate)
    setState(() {
      selectedDate = picked;
    });
}
}
