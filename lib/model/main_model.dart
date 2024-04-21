class MainWeather {
  final String city;
  final String weather;
  final double temperature;
  final double windSpeed;
  final int humidity;
  final double maxTemperature;
  final double minTemperature;
  final String weatherIcon;

  MainWeather({
    required this.city,
    required this.weather,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.maxTemperature,
    required this.minTemperature,
    required this.weatherIcon
  });
  @override
  String toString() {
    return 'MainWeather: {city: $city, weather: $weather, temperature: $temperature, windSpeed: $windSpeed, humidity: $humidity, maxTemperature: $maxTemperature, minTemperature: $minTemperature,weatherIcon:$weatherIcon}';
  }
  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      city: json['name'] as String,
      weather: Weather.fromJson(json['weather'][0]).weather,
      temperature: Temperature.fromJson(json['main']).temperature,
      windSpeed: Wind.fromJson(json['wind']).windSpeed,
      humidity: Humidity.fromJson(json['main']).humidity,
      maxTemperature: MaxTemperature.fromJson(json['main']).maxTemperature,
      minTemperature: MinTemperature.fromJson(json['main']).minTemperature,
      weatherIcon: WeatherIcon.fromJson(json['weather'][0]).weatherIcon
    );
  }
}

class Weather {
  final String weather;
  Weather({required this.weather});
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(weather: json['description']);
  }
}

class Wind {
  final double windSpeed;
  Wind({required this.windSpeed});
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(windSpeed: json['speed'].toDouble());
  }
}

class Temperature {
  final double temperature;
  Temperature({required this.temperature});
  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(temperature: json['temp'].toDouble());
  }
}

class Humidity {
  final int humidity;
  Humidity({required this.humidity});
  factory Humidity.fromJson(Map<String, dynamic> json) {
    return Humidity(humidity: json['humidity']);
  }
}

class MaxTemperature {
  final double maxTemperature;
  MaxTemperature({required this.maxTemperature});
  factory MaxTemperature.fromJson(Map<String, dynamic> json) {
    return MaxTemperature(maxTemperature: json['temp_max'].toDouble());
  }
}

class MinTemperature {
  final double minTemperature;
  MinTemperature({required this.minTemperature});
  factory MinTemperature.fromJson(Map<String, dynamic> json) {
    return MinTemperature(minTemperature: json['temp_min'].toDouble());
  }
}
class WeatherIcon{
  final String weatherIcon;
  WeatherIcon({required this.weatherIcon});
  factory WeatherIcon.fromJson(Map<String,dynamic>json){
    return WeatherIcon(weatherIcon: json['icon']);
  }
}
