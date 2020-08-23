import 'package:flutter/material.dart';
import 'package:flutterweatherapp/weatherTitle.dart';

class PreviewWeatherView extends StatelessWidget {
  Widget buildPreview(BuildContext context) {
//    MediaQuery.of(context).padding.bottomRight;
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
          // 加这个是为了背景顶头看起来被盖住的原因，但是为什么呢?
          padding: EdgeInsets.only(top:30),
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: ExactAssetImage("assets/images/bg_weather_preview.png"),
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: AspectRatio(
            aspectRatio: 1.2,
            child: WeatherTitle(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildPreview(context);
  }
}

//Column(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//Expanded(
//child: Container(
//width: MediaQuery.of(context).size.width * 0.9,
//child: Stack(
//children: <Widget>[
//Text("25", style: TextStyle(fontSize: 100, color: Colors.white)),
//Positioned(
//left: MediaQuery.of(context).size.width * 0.5 + 40,
//child: Text("°", style: TextStyle(fontSize: 100, color: Colors.white)))
//],
//alignment: Alignment.bottomCenter,
//),
//),
//),
//Expanded(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//Text("Clouds & sun", style: TextStyle(fontSize: 25, color: Colors.white)),
//Text("Humidity", style: TextStyle(fontSize: 25, color: Colors.white)),
//Text("35°", style: TextStyle(fontSize: 30, color: Colors.white))
//],
//),
//),
//],
//)
