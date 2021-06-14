import 'package:flutter/material.dart';


class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Page'),
      ),
      body: Column(
        children: [
          Divider(
            height: 1,
            color: Colors.redAccent,
          ),
          ExpansionTile(
            backgroundColor: Colors.red[50],
              title: Text(
                'Camera Access and Usage',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Press Ok to grant us access to your camera for detection.',
                    style: TextStyle(fontSize: 15),
                    maxLines: 3,
                    softWrap: true,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                    child: Text(
                      'Point your camera and aim your focus at the target lobster',
                      style: TextStyle(fontSize: 15),
                      maxLines: 3,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                ),
                Padding(
                    child: Text(
                      'Flash On',
                      style: TextStyle(fontSize: 15),
                      maxLines: 3,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    )
                )
              ],
          ),
        ],
      ),


    );
  }
}
