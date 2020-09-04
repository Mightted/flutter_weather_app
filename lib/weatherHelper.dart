import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'condition.dart';

class WeatherHelper {
  void requestWeather() async {

    var dio = Dio(BaseOptions(baseUrl: "http://wttr.in", responseType: ResponseType.plain));
    Response<Map<String, dynamic>> response = await dio.get(
      "?format=j1",
      options: new Options(responseType: ResponseType.json),
    );

//    var weather = Weather.fromJson(response.data);
//    debugPrint(weather.current_condition[0].temp_C);
//    debugPrint(response.data.current_condition[0].temp_C);
  }
}
