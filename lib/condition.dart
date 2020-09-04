import 'package:json_annotation/json_annotation.dart';
part 'condition.g.dart';

@JsonSerializable()
class Weather {
  Weather();
  List<Condition> current_condition;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

}

@JsonSerializable()
class Condition {
  Condition();
  String feelsLikeC; // 体感温度（摄氏度）

  String FeelsLikeF; // 体感温度（华氏度）

  String cloudcover; // 云覆盖率百分比

  String humidity; // 湿度百分比

  String localObsDateTime; // 数据更新时间

  String observation_time; // 更新时间

  String precipMM; // 降雨量（毫米）

  String pressure; // 气压，单位为hPa

  String temp_C;

  String temp_F;

  String uvIndex; // 紫外线指数

  String visibility; // 能见距离，千米为单位

  String weatherCode; // 天气码

  String winddir16Point; // 16风罗盘的风向

  String winddirDegree; // 风向度数，正北为0

  String windspeedKmph; // 风速，单位公里每小时

  String windspeedMiles; // 风速，单位英里每小时

  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}