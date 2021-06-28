import 'package:flutter/material.dart';
import 'package:lobster_detection/HomePage/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

class splashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get Device height and width
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Intro Page',
            style: TextStyle(color: Colors.white70),
          ),
          backgroundColor: Colors.deepOrange,
          automaticallyImplyLeading: false,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
                Widget>[
          Text('Welcome to \nLobster Detection',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.robotoMono(textStyle: TextStyle(fontSize: 27))),

          Image.asset('assets/icons/256.png', height: deviceHeight * 0.37),

          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                  'This app makes use of Machine Learning to recognize Lobsters.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoMono(
                      textStyle: TextStyle(fontSize: 15)))),

          // Button
          Container(
            width: (deviceWidth * 0.37),
            height: (deviceHeight * 0.057),
            margin: EdgeInsets.only(
              bottom: 9,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shadowColor: Colors.black,
                side: BorderSide(width: 0.03),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
              child: Text(
                'Proceed',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                    textStyle: TextStyle(fontSize: 17, color: Colors.white70)),
              ),
            ),
          ),
        ]));
  }
}
