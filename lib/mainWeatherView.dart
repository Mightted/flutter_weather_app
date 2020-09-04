import 'package:flutter/material.dart';
import 'package:flutterweatherapp/weatherTitle.dart';

import 'basePage.dart';
import 'completeWeatherView.dart';

class PreviewWeatherView extends StatelessWidget {
  PreviewWeatherView({this.controller});

  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      physics: PageScrollPhysics(parent: ClampingScrollPhysics()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 3,
        height: MediaQuery.of(context).size.width / 1.134,
        child: Row(
          children: [
            _buildMainWeatherView(context, "weather1"),
            _buildMainWeatherView(context, "weather2"),
            _buildMainWeatherView(context, "weather3")
          ],
        ),
      ),
    );
  }

  Widget _buildMainWeatherView(BuildContext context, String tag) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BasePage(
              child: CompleteWeatherView(
                tag: tag,
              ),
              title: "India, Mumbai",
            ),
          ),
        );
      },
      child: Container(
        // 加这个是为了背景顶头看起来被盖住的原因，但是为什么呢?
        // 破案了，是因为图片的平铺方式问题
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: ExactAssetImage("assets/images/bg_weather_preview.png"),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: AspectRatio(
          aspectRatio: 1.134,
          child: Hero(tag: tag, child: WeatherTitle()),
        ),
      ),
    );
  }
}
