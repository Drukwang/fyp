// import 'package:flutter/material.dart';

// class QRPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code'),
//         centerTitle: true,
//         backgroundColor: Colors.blue[600],
//         //icon: Icon(Icons.arrow_drop_down),
//       ),
//       body: Padding(
//         padding: EdgeInsets.only(left: 4),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(top: 10),
//               decoration: BoxDecoration(
//                 color: Colors.greenAccent,              
//               ),
//               height: 300,
//               width: 300,
//             ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: [
//                RaisedButton(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(7),
//                           ),
//                           padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                           color: Colors.lightBlueAccent,
//                           onPressed: () {
//                             // if (formKey.currentState.validate()) {
//                             //   Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(builder: (context) => QRPage()),
//                             //   );
//                             // }
//                           },
//                           child: Text(
//                             'Save',
//                             style: TextStyle(
//                               fontFamily: 'PTSerif',
//                             ),
//                           ),
//                         ),
             
//                     RaisedButton(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                       padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                       color: Colors.lightBlueAccent,
//                       onPressed: () {
//                         // if (formKey.currentState.validate()) {
//                         //   Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(builder: (context) => QRPage()),
//                         //   );
//                         // }
//                       },
//                       child: Text(
//                         'Share',
//                         style: TextStyle(
//                           fontFamily: 'PTSerif',
//                         ),
//                       ),
//                     ),
//                     ],
//            ),
//           ],

//         ),
//       ),      
//     );
//   }
// }
