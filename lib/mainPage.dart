import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweatherapp/appTheme.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
              decoration: BoxDecoration(
                  color: AppTheme.buttonBg,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                  child: Text(
                "Today",
                style: AppTheme.focusTab,
              )),
            ),
            Container(
              child: Center(
                  child: Text(
                "Tomorrow",
                style: AppTheme.normalTab,
              )),
            ),
            Container(
              child: Center(
                  child: Text(
                "Next Week",
                style: AppTheme.normalTab,
              )),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      ExactAssetImage("assets/images/bg_weather_preview.png")),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: AspectRatio(
            aspectRatio: 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "25",
                  style: TextStyle(fontSize: 120, color: Colors.white),
                ),
                Text("Clouds & sun",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                Text("Humidity",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                Text("35°", style: TextStyle(fontSize: 35, color: Colors.white))
              ],
            ),
          ),
        )
      ],
    );
  }
}
