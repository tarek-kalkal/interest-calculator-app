import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ("interest calculator "),
      home: Body(),
      color: Colors.orangeAccent,
      theme: ThemeData(
          accentColor: Colors.green,
          primaryColor: Colors.greenAccent,
          scaffoldBackgroundColor: Colors.grey),
    ));

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Dev();
  }
}

class _Dev extends State<Body> {
  final _minimumPadding = 5.0;
  var _currencies = ['euro', 'Dollar', 'Dinar'];
  var _currentItemSelected = 'Dollar';
  var displayResult = '';
  var _fromKey = GlobalKey<FormState>();
  TextEditingController principalController = TextEditingController();
  TextEditingController ratecontroller = TextEditingController();
  TextEditingController termController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.button;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 50.0,
        brightness: Brightness.dark,
        title: Text(
          "Interest Calculator",
          style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
        ),
      ),
      body: Form(
        key: _fromKey,
        child: ListView(
          children: <Widget>[
            getImagesAssets(),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding + 5,
                    right: _minimumPadding * 5,
                    left: _minimumPadding * 5),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: principalController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'enter principale amount';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter principal eg 1200',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding + 5,
                    right: _minimumPadding * 5,
                    left: _minimumPadding * 5),
                child: TextFormField(
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  controller: ratecontroller,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'enter the rate';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Rate of interest ',
                      hintText: 'IN present',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding + 5,
                    right: _minimumPadding * 5,
                    left: _minimumPadding * 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: termController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return ' enter the term';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Term ',
                          hintText: 'Time in year',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    )),
                    Container(
                      width: _minimumPadding + 10,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentItemSelected,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentItemSelected = newValueSelected;
                        });
                        //_onDropDownItemSelected(newValueSelected);
                      },
                    ))
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding + 5,
                    right: _minimumPadding * 5,
                    left: _minimumPadding * 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.orangeAccent,
                        child: Text("Calculate"),
                        onPressed: () {
                          setState(() {
                            if (_fromKey.currentState.validate()) {
                              _calculateInterest();
                              this.displayResult = _calculateInterest();
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: RaisedButton(
                          child: Text("Reset"),
                          onPressed: () {
                            setState(() {
                              principalController.text = '';
                              termController.text = '';
                              ratecontroller.text = '';
                              displayResult = '';
                            });
                          }),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(displayResult, textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18),),
            )
          ],
        ),
      ),
    );
  }

  Widget getImagesAssets() {
    AssetImage assetImage = AssetImage('assets/images/pic.png');
    Image image = Image(
      image: assetImage,
      width: 100.0,
      height: 130.0,
    );
    return Container(
      child: image,
      padding: EdgeInsets.only(
          bottom: _minimumPadding + 20, top: _minimumPadding + 30),
    );
  }

  String _calculateInterest() {
    double principle = double.parse(principalController.text);
    double rate = double.parse(ratecontroller.text);
    double term = double.parse(termController.text);

    double totalAmpunt = principle + (principle * rate * term) / 100;
    String result =
        'After $term years , your investment will be worth $totalAmpunt $_currentItemSelected ';
    return result;
  }
}
