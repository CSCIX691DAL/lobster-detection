import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // kinda static, cant change their states
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Calculator'), // 
    );
  }
}

class MyHomePage extends StatefulWidget { // can change state in response to users' actions
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0; // var to hold the output until we update the output in our view
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){
    if(buttonText == "CLEAR"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "."){
      if(_output.contains(".")){
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      } else if (buttonText == "="){ // you can't follow an else with else if
        num2 = double.parse(output);
        if (operand == "+") {
          _output = (num1+num2).toString();
        }
        if (operand == "-") {
          _output = (num1 - num2).toString();
        }
        if (operand == "X"){
          _output = (num1 * num2).toString();
        }
        if (operand == "/"){
          _output = (num1 / num2).toString();
        }

        num1 = 0.0;
        num2 = 0.0;
        operand = "";

      } else {
        _output = _output + buttonText;
      }

      print(_output);

      setState(() {
        
        output = double.parse(_output).toStringAsFixed(2);

      });
    }
  }

  Widget buildButton(String buttonText){
    
    return Expanded(
      
        child: OutlinedButton(
          
          child: Padding(
            padding: EdgeInsets.all(10.0),
          ),
          
          style: ButtonStyle(
              fontSize:20.0,
              fontWeight: FontWeight.bold //this is a button, you cannot edit text here
            ),


            
             onPressed: () { 
               buttonPressed(buttonText);
             }
        ),
        );
  }
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold( // scaffold = widget that contains basic UI widgets like appbar, body, etc
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new Container(

        child: Column(
          children: <Widget>[

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0
            ),
            child: Text(output, style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,

            ))),

          Expanded(
            child: Divider(),
          ),

          Column(children: [
            Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/")
            ]),

            Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("X")
            ]),

            Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-")
            ]),

            Row(children: [
              buildButton("."),
              buildButton("0"),
              buildButton("00"),
              buildButton("+")
            ]),

            Row(children: [
              buildButton("CLEAR"),
              buildButton("="),
            ])
          ])

        ],

      )));
  }
}