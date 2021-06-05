//Code for the page main page that shows after the loading page has finished
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lobster Detection Application'),
          actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: ()  => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Project Description'),
                content: const Text('This is an application that uses Machine Learning (ML) / Artificial Intelligence (AI) to perform object recognition of Lobsters (Nephropidae / Homeridae) using live camera input. \n \nGroup Members:\n\n• Kanak Prajapati\n• Kayleen Sung\n• Liam Cormack\n• Liam Osler\n• Shawn Shahin Azar'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(''),
                  ),
                ],
              ),
            ),
          )
        ],
        ),
        body: Center(
          child: Text('Turn on your camera', style: TextStyle(fontSize: 18.0)),
        )
    );
  }
}
