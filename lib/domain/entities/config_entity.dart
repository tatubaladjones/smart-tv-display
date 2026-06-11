import 'package:equatable/equatable.dart';

class ConfigEntity extends Equatable {
  final String id;
  final String appTitle;
  final String logoUrl;
  final String primaryColor;
  final String secondaryColor;
  final int transitionDuration;
  final bool showNews;
  final bool showWeather;
  final bool showClock;
  final String weatherApiKey;
  final String newsApiKey;
  final int refreshInterval;
  final String? weatherCity;
  final String? weatherCountryCode;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ConfigEntity({
    required this.id,
    required this.appTitle,
    required this.logoUrl,
    required this.primaryColor,
    required this.secondaryColor,
    required this.transitionDuration,
    required this.showNews,
    required this.showWeather,
    required this.showClock,
    required this.weatherApiKey,
    required this.newsApiKey,
    required this.refreshInterval,
    this.weatherCity,
    this.weatherCountryCode,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    appTitle,
    logoUrl,
    primaryColor,
    secondaryColor,
    transitionDuration,
    showNews,
    showWeather,
    showClock,
    weatherApiKey,
    newsApiKey,
    refreshInterval,
    weatherCity,
    weatherCountryCode,
    createdAt,
    updatedAt,
  ];

  ConfigEntity copyWith({
    String? id,
    String? appTitle,
    String? logoUrl,
    String? primaryColor,
    String? secondaryColor,
    int? transitionDuration,
    bool? showNews,
    bool? showWeather,
    bool? showClock,
    String? weatherApiKey,
    String? newsApiKey,
    int? refreshInterval,
    String? weatherCity,
    String? weatherCountryCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ConfigEntity(
      id: id ?? this.id,
      appTitle: appTitle ?? this.appTitle,
      logoUrl: logoUrl ?? this.logoUrl,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      showNews: showNews ?? this.showNews,
      showWeather: showWeather ?? this.showWeather,
      showClock: showClock ?? this.showClock,
      weatherApiKey: weatherApiKey ?? this.weatherApiKey,
      newsApiKey: newsApiKey ?? this.newsApiKey,
      refreshInterval: refreshInterval ?? this.refreshInterval,
      weatherCity: weatherCity ?? this.weatherCity,
      weatherCountryCode: weatherCountryCode ?? this.weatherCountryCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
