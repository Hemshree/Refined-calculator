import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),

      home: MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String answer="0";

  String _answer = "0";
  double num1= 0.0;
  double num2 = 0.0;
  String operand ="";
  buttonPressed(String buttonText){

    if(buttonText=="CLEAR"){
       _answer = "0";
       num1= 0.0;
       num2 = 0.0;
       operand ="";

    }else if (buttonText=="+" || buttonText=="-" || buttonText=="*" || buttonText=="X" ){
      num1 = double.parse(answer);
      operand = buttonText;
      _answer = "0";
    }else if(buttonText =="."){
      if (_answer.contains(".")){
        print("Aready contains a decimal");
        return;

      }else{
        _answer= _answer + buttonText;
      }
    }else if(buttonText == "="){
      num2 = double.parse(answer);
      if(operand== "+")
        {
          _answer = (num1 + num2).toString();
        }
      if(operand== "-")
      {
        _answer = (num1 - num2).toString();
      }
      if(operand== "X")
      {
        _answer = (num1 * num2).toString();
      }
      if(operand== "/")
      {
        _answer = (num1 / num2).toString();
      }

      num1= 0.0;
      num2= 0.0;
      operand = "";

    }
    else{
      _answer = _answer + buttonText;
    }
    print(_answer);
    setState(() {
      answer = double.parse(_answer).toString();
    });

  }


  Widget buildButton(String buttonText){
    return new Expanded(
      child: new OutlineButton(
        child: new Text(buttonText, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
        onPressed: ()=>
          buttonPressed(buttonText)
        ,
//        color: Colors.blueGrey,
//        textColor: Colors.white,
      padding: new EdgeInsets.all(20.0),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: new Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(
          vertical: 25.0,
          horizontal: 15.0,
        ),

        child: new Column(

          children: <Widget>[
            Container(
                child: new Text(answer, textDirection: TextDirection.rtl, style: new TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,



            ),
            )
            ),

             new Expanded(child: new Divider(),),
            new Column(
              children: <Widget>[
                new Row( children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ]
                ),
                new Row( children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X")
                ]
                ),
                new Row( children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),

                ]
                ),
                new Row( children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+")
                ]
                ),
                new Row( children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ]
                ),
              ],
            ),
          ],
        ),


      ),


    );
  }
}
