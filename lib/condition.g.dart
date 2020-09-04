// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather()
    ..current_condition = (json['current_condition'] as List)
        ?.map((e) =>
            e == null ? null : Condition.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WeatherToJson(Weather instance) =>
    <String, dynamic>{'current_condition': instance.current_condition};

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition()
    ..feelsLikeC = json['feelsLikeC'] as String
    ..FeelsLikeF = json['FeelsLikeF'] as String
    ..cloudcover = json['cloudcover'] as String
    ..humidity = json['humidity'] as String
    ..localObsDateTime = json['localObsDateTime'] as String
    ..observation_time = json['observation_time'] as String
    ..precipMM = json['precipMM'] as String
    ..pressure = json['pressure'] as String
    ..temp_C = json['temp_C'] as String
    ..temp_F = json['temp_F'] as String
    ..uvIndex = json['uvIndex'] as String
    ..visibility = json['visibility'] as String
    ..weatherCode = json['weatherCode'] as String
    ..winddir16Point = json['winddir16Point'] as String
    ..winddirDegree = json['winddirDegree'] as String
    ..windspeedKmph = json['windspeedKmph'] as String
    ..windspeedMiles = json['windspeedMiles'] as String;
}

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'feelsLikeC': instance.feelsLikeC,
      'FeelsLikeF': instance.FeelsLikeF,
      'cloudcover': instance.cloudcover,
      'humidity': instance.humidity,
      'localObsDateTime': instance.localObsDateTime,
      'observation_time': instance.observation_time,
      'precipMM': instance.precipMM,
      'pressure': instance.pressure,
      'temp_C': instance.temp_C,
      'temp_F': instance.temp_F,
      'uvIndex': instance.uvIndex,
      'visibility': instance.visibility,
      'weatherCode': instance.weatherCode,
      'winddir16Point': instance.winddir16Point,
      'winddirDegree': instance.winddirDegree,
      'windspeedKmph': instance.windspeedKmph,
      'windspeedMiles': instance.windspeedMiles
    };
