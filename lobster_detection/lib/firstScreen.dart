import 'package:flutter/material.dart';
import 'package:lobster_detection/help_page.dart';

// TESTING HELP PAGE ON FIRST SCREEN

class Expansionpanel extends StatefulWidget {
  Expansionpaneltate createState() =>  Expansionpaneltate();
}
class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}
class Expansionpaneltate extends State<Expansionpanel> {
  // things needed for contact us fill-out form
  String _name;
  String _email;
  String _message;

    List<NewItem> items = <NewItem>[
    NewItem(
        false, // isExpanded ?
        'Camera Usage and Access', // header
        Padding(
          padding: EdgeInsets.all(20.0),
            child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // ADD PADDING AROUND EACH ROW OF TXT

                      // add photo grant access
                      Image.asset('help_page_notification.png', height: 100.0, width: 130.0),
                      Flexible(
                        child: new Text('Press Ok to grant us access to your camera for detection',
                            style: TextStyle(
                              fontSize: 17.0,
                            ))
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset('assets/intro_pg_lobster.png', height: 100.0),
                      Flexible(
                        child: new Text('Point your camera and aim your focus at the target lobster.',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 17.0,
                            )),
                      ),
                      /*
                      Text('Point your camera and aim your focus at the target lobster.',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 13.0,
                          )),

                       */
                      // add photo grant access

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // flash on photo
                        Image.asset('flash_on.png', height: 80.0),
                        Text('Flash on',
                        style: TextStyle(
                          fontSize: 17.0,
                        )),
                        // flash off photo
                        Image.asset('flash_off.png', height: 80.0),
                        Text('Flash Off',
                        style: TextStyle(
                          fontSize: 17.0,
                        ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset('flip_camera.png', height: 70.0),
                      Text('Press to flip your camera',
                      style: TextStyle(
                        fontSize: 17.0,
                      ))
                    ]
                  )
                ]
            )
        ), // body
        Icon(Icons.camera_alt) // iconPic
    ),

    NewItem(
        false,
        'FAQ',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Q. Is my data saved?',
                  style: TextStyle(
                    fontSize: 17.0,
                  )),
                  Text('A. No. Lobsters you detected using our app will not be saved.',
                  style: TextStyle(
                    fontSize: 17.0,
                  ))
                ]
              )
            ]
          )
        ),
        Icon(Icons.question_answer)
    ),
    NewItem(
        false,
        'Contact Us',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('If you have any questions about our app or would like to'
                      ' give a feedback, fill out the form below and we will get back to you as soon as possible!'),

                  // HOW TO CREATE PADDING IN BETWEEN THE TEXT FORMS

                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Enter your full name",
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "Enter your email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // icon: ?
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      icon: Icon(Icons.messenger),
                      hintText: "Please enter your message here",
                      labelText: "Message", // HOW TO MAKE THIS TOP LEFT (RN IT'S AT MIDDLE LEFT)
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // icon: ?
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // pop up "Submitted"
                      },
                      child: Text('Submit'),
                    )
                  )
                ],
              )
            ]
          )
        ),
        Icon(Icons.contact_phone)
    )
  ];
  ListView List_Criteria;
  Widget build(BuildContext context) {
    List_Criteria = ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((NewItem item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return  ListTile(
                      leading: item.iconpic,
                      title:  Text(
                        item.header,
                        textAlign: TextAlign.left,
                        style:  TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                  );
                },
                isExpanded: item.isExpanded,
                body: item.body,
              );
            }).toList(),
          ),
        ),
      ],
    );
    Scaffold scaffold =  Scaffold(
      appBar:  AppBar(
        title:  Text("Help"),
        // how to move this to the left
      ),
      body: List_Criteria,
    );
    return scaffold;
  }
}














