import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText ="";
  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
      _finalResult = calculateWeight(_weightController.text,0.06);
      _formattedText = "Your weight on Pluto ${_finalResult.toStringAsFixed(1)}";
        break;
        case 1:
          _finalResult = calculateWeight(_weightController.text,0.38);
          _formattedText = "Your weight on Mars ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text,0.91);
          _formattedText = "Your weight on Venus ${_finalResult.toStringAsFixed(1)}";

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image(image: AssetImage('assets/images/planet.png'),
              height: 133.0,
              width: 200.0,
              ),
            new Container(
              margin: const EdgeInsets.all(3),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline)

                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  //three radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>
                        (activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: TextStyle(color: Colors.white30),
                      ),

                      new Radio<int>
                        (
                          activeColor: Colors.red,
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>
                        (
                          activeColor: Colors.orangeAccent,
                          value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: TextStyle(color: Colors.white30),
                      )


                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight" : _formattedText + "lbs",
                    //"$_formattedText lbs",
                    style: new TextStyle(color: Colors.white,
                    fontSize: 19.5,
                      fontWeight: FontWeight.w500,
                    ),

                  )



                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  double calculateWeight(String weight,double multiplier){
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      return int.parse(weight) * multiplier;
    }else{
      print("Wrong!");

      return int.parse("180")* 0.38;
    }

  }
}
