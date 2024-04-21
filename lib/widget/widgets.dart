import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.controller, this.onPressed});
  final TextEditingController controller;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed:onPressed,icon:const Icon(Icons.search)),
        hintText: "City name",
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    required this.weatherIcon,
    required this.temp,
    required this.weather,
    required this.windSpeed,
    required this.humidity,
    required this.maxTemp,
  });

  final String weatherIcon;
  final double temp;
  final String weather;
  final double windSpeed;
  final int humidity;
  final double maxTemp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 153, 221, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0,10)
        )],
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(16)),
          Image.network(
              'https://openweathermap.org/img/wn/$weatherIcon@2x.png'),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${temp.toStringAsFixed(0)}°C",
            style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            weather,
            style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100,
            height: 1,
            color: Colors.white,
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.wind_power_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      "${windSpeed.toStringAsFixed(0)}m/s",
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.water_drop_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      "${humidity.toStringAsFixed(0)}%",
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.thermostat,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      "${maxTemp.toStringAsFixed(0)}°C",
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

