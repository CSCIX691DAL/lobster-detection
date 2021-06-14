import 'package:flutter/material.dart';
import 'package:lobster_detection/help_page.dart';

// testing out help page
class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  List<Item> _data = generateItems(3);

  Widget _buildListPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children : _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: //Text(item.headerValue),
              Text('Help'),
            );
          },
          body: ListTile(
            children: ListTile(
              title: Text('hi')
            )
            //title: Text('hello'),
            // trailing: Icon(Icons.minimize),
            // onTap: () {
            //   setState(() {
            //     // _data.removeWhere((currentItem) => item == currentItem);
            //   });
            // },
          ),
          isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Help',
        // WHY IS THIS NOT MOVING TO THE LEFT
        textAlign: TextAlign.left,),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildListPanel(),
        )
      ),
    );
  }
}

class Item {

  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({this.expandedValue, this.headerValue, this.isExpanded = false});
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Camera Usage and Access',
      expandedValue: 'Press Ok to grant us access to your camera for detection'
      // use if else here (if index == 0, header value: "Camera Usage and Access
        /*
          return headerValue: 'Camera Usage and Access',
          return expandedValue: 'Press Ok to grant us access to your camera for detection'}
        else if(index==1) {
          return headerValue: 'FAQ',
          return expandedValue: 'Q. Is my data saved?/nA. No. Lobsters that you will detect using our app will not be saved.'
      }
        else {
          return headerValue: 'Contact Us'
          return expandedValue: 'If you have any questions about our app or would like to give a feedback, fill out the form below and we will get back to you as soon as possible!'
      }

         */
    );
  });
}




/*
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //testing out help page
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

            ],
          ),
        ],
      ),
    );


    /*
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
     */


  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key:key);

  @override

  Widget build(BuildContext context) {
    ElevatedButton(
      onPressed: () {
        // wouldn't direct to help page; needs to be fixed
        /*
        MaterialPageRoute(
          builder: (context) => HelpPage(),
        );

         */
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



 */






