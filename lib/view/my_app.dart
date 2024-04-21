import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_api_openweather/controller/controller.dart';
import 'package:weather_app_api_openweather/model/main_model.dart';
import 'package:weather_app_api_openweather/widget/widgets.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _cityNameController = TextEditingController();
  late Future _mainWeather;
  @override
  void dispose() {
    super.dispose();
    _cityNameController.dispose();
  }

  @override
  void initState(){
    _mainWeather = getData("Karaganda");
    super.initState();
  }
  void searchCity(String cityName){
    setState(() {
      _mainWeather = getData(cityName);;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyTextField(
                controller: _cityNameController,
                onPressed: () => searchCity(_cityNameController.text),
              ),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                future: _mainWeather,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Произошла ошибка: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final data = snapshot.data as MainWeather;
                    final weather = data.weather;
                    final temp = data.temperature - 273.15;
                    final windSpeed = data.windSpeed;
                    final minTemp = data.minTemperature - 273.15;
                    final maxTemp = data.maxTemperature - 273.15;
                    final humidity = data.humidity;
                    final city = data.city;
                    final weatherIcon = data.weatherIcon;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.place),
                            Text(
                              city,
                              style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                        const Text(
                          'Monday,5 september',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyContainer(
                            weatherIcon: weatherIcon,
                            temp: temp,
                            weather: weather,
                            windSpeed: windSpeed,
                            humidity: humidity,
                            maxTemp: maxTemp)
                      ],
                    );
                  } else {
                    return const Text('Данные отсутствуют');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
