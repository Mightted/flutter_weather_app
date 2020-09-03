import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterweatherapp/appTheme.dart';
import 'package:flutterweatherapp/weatherTitle.dart';

import 'chartLineView.dart';

class CompleteWeatherView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CompleteWeatherState();

  Function onTap;
  String tag;

  CompleteWeatherView({this.onTap, this.tag});
}

class _CompleteWeatherState extends State<CompleteWeatherView>
    with TickerProviderStateMixin {
//  Animation<double> animation;

  @override
  void initState() {
    super.initState();
//    AnimationController controller = new AnimationController(
//        duration: const Duration(milliseconds: 200), vsync: this);
//    final CurvedAnimation curve =
//        new CurvedAnimation(parent: controller, curve: Curves.easeIn);
//    animation = new Tween(begin: 0.0, end: 1.0).animate(curve);
//    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 6),
            child: buildCompleteView(context)));
  }

//  double getHeight() {
//    return (MediaQuery.of(context).size.width * 0.9 / 1.2);
//  }

  Widget buildCompleteView(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(20),
//        padding: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: ExactAssetImage("assets/images/bg_weather_complete.png")),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: _mainWidget(context),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Hero(tag: widget.tag, child: WeatherTitle()),
//          Container(
//            margin: EdgeInsets.symmetric(vertical: 20),
//            width: MediaQuery.of(context).size.width * 0.9,
//            child: Stack(
//              children: <Widget>[
//                Text(
//                  "25",
//                  style: TextStyle(fontSize: 100, color: Colors.white),
//                ),
//                Positioned(
//                  left: MediaQuery.of(context).size.width * 0.5 + 40,
//                  child: Text(
//                    "°",
//                    style: TextStyle(fontSize: 100, color: Colors.white),
//                  ),
//                )
//              ],
//              alignment: Alignment.bottomCenter,
//            ),
//          ),
//          Text("Clouds & sun", style: TextStyle(fontSize: 25, color: Colors.white)),
//          Text("Humidity", style: TextStyle(fontSize: 25, color: Colors.white)),
//          Text("35°", style: TextStyle(fontSize: 30, color: Colors.white)),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ChartLineView()),
        Container(
            margin: EdgeInsets.only(top: 40),
            child: Text("Rain Starting in 13 min",
                style: TextStyle(fontSize: 25, color: Colors.white))),
        Container(
            margin: EdgeInsets.only(top: 20),
            child: Text("Nearest precip: 6 mi to the west",
                style: TextStyle(fontSize: 16, color: Colors.white))),
      ],
    );
  }

//  Widget buildCompleteView(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.only(top: 40),
//      width: MediaQuery
//          .of(context)
//          .size
//          .width * 0.9,
//      decoration: BoxDecoration(
//          image: DecorationImage(image: ExactAssetImage("assets/images/bg_weather_complete.png")),
//          borderRadius: BorderRadius.all(Radius.circular(20))),
//      child: AspectRatio(
//        aspectRatio: 0.6,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            Expanded(
//              child: Container(
//                width: MediaQuery
//                    .of(context)
//                    .size
//                    .width * 0.9,
//                child: Stack(
//                  children: <Widget>[
//                    Text(
//                      "25",
//                      style: TextStyle(fontSize: 100, color: Colors.white),
//                    ),
//                    Positioned(
//                      left: MediaQuery
//                          .of(context)
//                          .size
//                          .width * 0.5 + 40,
//                      child: Text(
//                        "°",
//                        style: TextStyle(fontSize: 100, color: Colors.white),
//                      ),
//                    )
//                  ],
//                  alignment: Alignment.bottomCenter,
//                ),
//              ),
//            ),
//            Expanded(
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text("Clouds & sun", style: TextStyle(fontSize: 25, color: Colors.white)),
//                  Text("Humidity", style: TextStyle(fontSize: 25, color: Colors.white)),
//                  Text("35°", style: TextStyle(fontSize: 30, color: Colors.white)),
//                  ChartLineView()
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }

}
