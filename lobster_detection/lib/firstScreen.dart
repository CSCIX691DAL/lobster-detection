import 'package:flutter/material.dart';

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
                onPressed: () { },
                child: Text('Close'),
              )
            ]
          )
        );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key:key);

  @override

  Widget build(BuildContext context) {
    ElevatedButton(
      onPressed: () {
        // Button response
      },
      child: Text('Got it'),
    );
  }
  /*
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // take me to a new page
      },
      child: const Text('Got It'),
    );
  }
   */

}






