import 'package:flutter/material.dart';
import 'package:flutterweatherapp/appTheme.dart';
import 'package:flutterweatherapp/tabWidget.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import 'mainWeatherView.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget weatherWidget;
  ScrollController controller;

//  int currentIndex = 0;
  var notifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    controller = ScrollController(initialScrollOffset: 0);
    controller.addListener(() {
      var progress = controller.offset / MediaQuery.of(context).size.width;
      if ((notifier.value - progress).abs() > 0.9) {
        setState(() {
          debugPrint("${progress.round()}");
          notifier.value = progress.round();
        });
      }
    });
//
//    notifier
    weatherWidget = buildWeather(context);
  }

  void _changeIndex(int index) {
    setState(() {
      controller.animateTo(MediaQuery.of(context).size.width * index,
          duration: Duration(milliseconds: 100 * (index - notifier.value).abs()), curve: Curves.linear);
//      notifier.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TabWidget("Today", isFocus: notifier.value == 0, onTap: () {
              _changeIndex(0);
            }),
            TabWidget("Tomorrow", isFocus: notifier.value == 1, onTap: () {
              _changeIndex(1);
            }),
            TabWidget("Next Week", isFocus: notifier.value == 2, onTap: () {
              _changeIndex(2);
            }),
//            Container(
//              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
//              decoration: BoxDecoration(color: AppTheme.buttonBg, borderRadius: BorderRadius.all(Radius.circular(20))),
//              child: Center(
//                  child: Text(
//                "Today",
//                style: notifier.value == 0 ? AppTheme.focusTab : AppTheme.normalTab,
//              )),
//            ),
//            Container(
//              child: Center(
//                  child: Text(
//                "Tomorrow",
//                style: notifier.value == 1 ? AppTheme.focusTab : AppTheme.normalTab,
//              )),
//            ),
//            Container(
//              child: Center(
//                  child: Text(
//                "Next Week",
//                style: notifier.value == 2 ? AppTheme.focusTab : AppTheme.normalTab,
//              )),
//            ),
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
        PreviewWeatherView(
          controller: controller,
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
          padding: EdgeInsets.only(top: 30),
          child: CirclePageIndicator(
            size: 10,
            selectedSize: 12,
            itemCount: 3,
            currentPageNotifier: notifier,
          ),
        )
      ],
    );
  }
}
