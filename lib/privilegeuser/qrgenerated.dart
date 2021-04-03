import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenerated extends StatefulWidget {
  final myQR;
  const QRGenerated(this.myQR);
  @override
  _QRGeneratedState createState() => _QRGeneratedState();
}

class _QRGeneratedState extends State<QRGenerated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
        //icon: Icon(Icons.arrow_drop_down),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.greenAccent,              
              ),
              height: 300,
              width: 300,
              child: QrImage(
                data: widget.myQR,
                version: QrVersions.auto,
                size: 250.0,
                gapless: false,
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
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
                            // if (formKey.currentState.validate()) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => QRPage()),
                            //   );
                            // }
                          },
                          child: Text(
                            'Save',
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
                      // if (formKey.currentState.validate()) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => QRPage()),
                      //   );
                      // }
                    },
                    child: Text(
                      'Share',
                      style: TextStyle(
                        fontFamily: 'PTSerif',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),                   
              ],
           ),
          ],

        ),
      ),      
    );
  }
}