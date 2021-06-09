import 'package:flutter/material.dart';
import 'package:lobster_detection/HomePage/MyHomePage.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Intro Page'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Welcome to \nLobster Detection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 35.0
                  )),
              Image.asset('assets/intro_pg_lobster.png',height:300.0),

              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam gravida facilisis facilisis. '
                  'Sed feugiat erat ut est rutrum mattis.'
                  'In ultriciesligula sed nisi tempus, nec dignissim diam blandit. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0
                  )),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                child: Text('Close'),
              )

            ]
        )
    );
  }

}