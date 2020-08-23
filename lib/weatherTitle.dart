import 'package:flutter/material.dart';

class WeatherTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            children: <Widget>[
              Text(
                "25",
                style: TextStyle(fontSize: 100, color: Colors.white),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.5 + 40,
                child: Text(
                  "°",
                  style: TextStyle(fontSize: 100, color: Colors.white),
                ),
              )
            ],
            alignment: Alignment.bottomCenter,
          ),
        ),
        Text("Clouds & sun", style: TextStyle(fontSize: 25, color: Colors.white)),
        Text("Humidity", style: TextStyle(fontSize: 25, color: Colors.white)),
        Text("35°", style: TextStyle(fontSize: 30, color: Colors.white)),
      ],
    );
  }
}

//List<Widget> weatherTitle(BuildContext context) {
//  return <Widget>[
//    Container(
//      margin: EdgeInsets.symmetric(vertical: 20),
//      width: MediaQuery.of(context).size.width * 0.9,
//      child: Stack(
//        children: <Widget>[
//          Text(
//            "25",
//            style: TextStyle(fontSize: 100, color: Colors.white),
//          ),
//          Positioned(
//            left: MediaQuery.of(context).size.width * 0.5 + 40,
//            child: Text(
//              "°",
//              style: TextStyle(fontSize: 100, color: Colors.white),
//            ),
//          )
//        ],
//        alignment: Alignment.bottomCenter,
//      ),
//    )
//  ];
//}
