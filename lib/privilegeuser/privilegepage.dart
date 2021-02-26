// import 'package:flutter/material.dart';

// import 'package:FYPApp/privilegeuser/QRPage.dart';

// class PrivilegeActivity extends StatefulWidget {
//   @override
//   _PrivilegeActivityState createState() => _PrivilegeActivityState();
// }

// class _PrivilegeActivityState extends State<PrivilegeActivity> {
//   final formKey = GlobalKey<FormState>();
//   String valueChoose1;
//   String valueChoose2;
//   List listItem1 = ["Cultural Activities", "Games", "SUPW", "Voluntary Works"];
//   List listItem2 = ["Intercollege", "Intracollege"];
//   DateTime date;
//   @override
//   void initState() {
//     super.initState();
//     date = DateTime.now();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: Text(
//           'Activity',
//           style: TextStyle(
//             fontFamily: 'PTSerif',
//           ),
//         ),
//         centerTitle: true,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 ListTile(
//                   leading: Icon(Icons.phone),
//                   title: Text('Contact Us',
//                       style: TextStyle(
//                         fontFamily: 'PTSerif',
//                       )),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         margin: EdgeInsets.fromLTRB(10, 0.0, 10, 0.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Activity Name',
//                   labelStyle: TextStyle(
//                     fontFamily: 'PTSerif',
//                     fontSize: 20,
//                     color: Colors.black,
//                   ),
//                   hintText: 'Enter Activity Name',
//                   hintStyle: TextStyle(
//                     fontSize: 12,
//                     fontFamily: 'PTSerif',
//                   ),
//                 ),
//                 // ignore: missing_return
//                 validator: (value) {
//                   if (value.trim().isEmpty) {
//                     return 'Activity Name required';
//                   }
//                 },
//               ),
             
//                     ListTile(
//                       title: Text(
//                           'Date: ${date.year}, ${date.month}, ${date.day}',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                           ),
//                       trailing: Icon(Icons.keyboard_arrow_down),
//                       onTap: () async{
//                         DateTime ddate = await showDatePicker(
//                             context: context,
//                             initialDate: date,
//                             firstDate: DateTime(DateTime.now().year),
//                             lastDate: DateTime(DateTime.now().year + 1));
//                         if (date != null)
//                           setState(() {
//                             date = ddate;
//                           });
//                       },
//                     ),
//              Container(
//                child: DropdownButton(
//                       dropdownColor: Colors.white,
//                       hint: Text(
//                         'Select Category',
//                         style: TextStyle(
//                           fontFamily: 'PTSerif',
//                           color: Colors.black,
//                         ),
//                       ),
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontFamily: 'PTSerif',
//                         fontSize: 19,
//                       ),
//                       isExpanded: true,
//                       value: valueChoose1,
//                       onChanged: (newValue) {
//                         setState(() {
//                           valueChoose1 = newValue;
//                         });
//                       },
//                       items: listItem1.map((valueItem) {
//                         return DropdownMenuItem(
//                           value: valueItem,
//                           child: Text(
//                             valueItem,
//                             style: TextStyle(
//                               fontFamily: 'PTSerif',
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//              ),
                
//               // Divider(
//               //   color: Colors.black54,
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: Container(
//                   padding: EdgeInsets.only(right: 170),
//                   child: DropdownButton(
//                     dropdownColor: Colors.white,
//                     hint: Text(
//                       'Select Types',
//                       style: TextStyle(
//                         fontFamily: 'PTSerif',
//                         color: Colors.black,
//                       ),
//                     ),
//                     style: TextStyle(
//                       fontFamily: 'PTSerif',
//                       color: Colors.black,
//                       fontSize: 19,
//                     ),
//                     isExpanded: true,
//                     value: valueChoose2,
//                     onChanged: (newValue) {
//                       setState(() {
//                         valueChoose2 = newValue;
//                       });
//                     },
//                     items: listItem2.map((valueItem) {
//                       return DropdownMenuItem(
//                         value: valueItem,
//                         child: Text(
//                           valueItem,
//                           style: TextStyle(
//                             fontFamily: 'PTSerif',
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),

//               // validator: (value) {
//               //   if (value.isEmpty) {
//               //     return 'Category is required';
//               //   }
//               // },

//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Remarks',
//                   labelStyle: TextStyle(
//                     fontFamily: 'PTSerif',
//                     fontSize: 20,
//                     color: Colors.black,
//                   ),
//                   hintText: 'Enter Remarks',
//                   hintStyle: TextStyle(
//                     fontFamily: 'PTSerif',
//                     fontSize: 12,
//                   ),
//                 ),
//                 // ignore: missing_return
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Remarks is required';
//                   }
//                 },
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 35),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     RaisedButton(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                       padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                       color: Colors.lightBlueAccent,
//                       onPressed: () {
//                         if (formKey.currentState.validate()) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => QRPage()),
//                           );
//                         }
//                       },
//                       child: Text(
//                         'Generate QR',
//                         style: TextStyle(
//                           fontFamily: 'PTSerif',
//                         ),
//                       ),
//                     ),
//                     RaisedButton(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                       padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                       color: Colors.lightBlueAccent,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => PrivilegeActivity(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Manual Update',
//                         style: TextStyle(
//                           fontFamily: 'PTSerif',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
