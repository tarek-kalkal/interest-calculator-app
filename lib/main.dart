import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, title: ("interest calculator "), home: Body(),
    color: Colors.red
    ,theme: ThemeData(accentColor: Colors.green,primaryColor: Colors.greenAccent,scaffoldBackgroundColor: Colors.grey),
    ));

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Dev();
  }
}

class _Dev extends State<Body> {
  final _minimumPadding = 5.0;
  var _currencies = ['Ruppes', 'Dollars', 'Pounds'];

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.button;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
     /* appBar: AppBar(
        /*title: Text(
          "Interest Calculator",
          style: TextStyle(fontSize: 20.0),
        ),*/
      ),*/
      body: Container(
        
        child: ListView(
          children: <Widget>[
            getImagesAssets(),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding + 5, right: _minimumPadding * 5,left: _minimumPadding * 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter principal eg 1200',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding + 5, right: _minimumPadding * 5,left: _minimumPadding * 5),
                child: TextField(
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Rate of interest ',
                      hintText: 'IN present',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding + 5, right: _minimumPadding * 5,left: _minimumPadding * 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Term ',
                          hintText: 'Time in years',
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
                      value: 'Ruppes',
                      onChanged: (String newValueSelected) {},
                    ))
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding + 5, right: _minimumPadding * 5,left: _minimumPadding * 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.orangeAccent,
                        child: Text("Calculate"),
                        onPressed: () {},
                      ),
                    ),
                    Container(width: 15,),
                    Expanded(
                      child: RaisedButton(
                        child: Text("Reset"),
                        onPressed: () {},
                      ),
                    )
                  ],
                )) , 
                Padding(
                  padding:EdgeInsets.only( top: _minimumPadding, bottom: _minimumPadding ),
                  child:  Text("Todo text",textAlign: TextAlign.center),)
          ],
        ),
      ),
    );
  }

  Widget getImagesAssets() {
    AssetImage assetImage = AssetImage('assets/images/pic.jpg');
    Image image = Image(
      image: assetImage,
      width: 100.0,
      height: 130.0,
    );
    return Container(
      child: image,
      padding: EdgeInsets.only(bottom: _minimumPadding + 20,top: _minimumPadding +30),
    );
  }
}
