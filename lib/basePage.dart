import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterweatherapp/weatherHelper.dart';

class BasePage extends StatelessWidget {
  Widget child;
  String title;
  Function onRefresh;

  BasePage({this.child, this.title = "Flutter Demo", this.onRefresh});

  Future<void> _doRefresh() async {
    await Future<Null>.delayed(Duration(seconds: 2), () {
      debugPrint("doRefresh");
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF191481)),
        leading: InkWell(
          child: Icon(Icons.menu),
          onTap: () {
            WeatherHelper().requestWeather();
          },
        ),
        title: Center(
          child: Text(
            title,
            style: TextStyle(color: Color(0xFF191481)),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search, size: 28),
          )
        ],
      ),
      body: RefreshIndicator(
          onRefresh: _doRefresh, child: SizedBox(height: MediaQuery.of(context).size.height, child: child)),
    );
  }
}
