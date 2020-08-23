import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweatherapp/appTheme.dart';
import 'package:flutterweatherapp/completeWeatherView.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import 'mainWeatherView.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget weatherWidget;

  @override
  void initState() {
    super.initState();
    weatherWidget = buildWeather(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
              decoration: BoxDecoration(color: AppTheme.buttonBg, borderRadius: BorderRadius.all(Radius.circular(20))),
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
        Expanded(
          child: weatherWidget,
        )
      ],
    );
  }

  Widget buildWeather(BuildContext context) {
    return ListView(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              weatherWidget = CompleteWeatherView(onTap: (){
                setState(() {
                  weatherWidget = buildWeather(context);
                });
              },);
            });
//                  Navigator.push(context, MaterialPageRoute(builder: (context) {
//                    return CompleteWeatherView();
//                  }));
          },
          child: PreviewWeatherView()
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Next 15 Days",
            style: AppTheme.normalTab,
          ),
        ),
        Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 172,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 190,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          width: 140,
                          decoration:
                              BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(36))),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Monday",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 10),
                              ),
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.white,
                                size: 60,
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("40°", style: TextStyle(color: Colors.white, fontSize: 28))),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text("56°",
                                        style: TextStyle(
                                            color: Colors.white38, fontSize: 18, fontWeight: FontWeight.bold)),
                                    Text("69°",
                                        style:
                                            TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 20,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          width: 80,
                          decoration:
                              BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(50))),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: CirclePageIndicator(
            size: 10,
            selectedSize: 12,
            itemCount: 3,
            currentPageNotifier: ValueNotifier<int>(0),
          ),
        )
      ],
    );
  }
}
