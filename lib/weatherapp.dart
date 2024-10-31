import 'package:flutter/material.dart';
import 'models/weather_data.dart';
import 'services/weather_services.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final WeatherService _weatherService = WeatherService();
  WeatherData? _weatherData;

  final TextEditingController _cityController = TextEditingController();

  void fetchWeather() async {
    try {
      final weatherData = await _weatherService.fetchWeather(_cityController.text);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'Enter city name'),
            ),
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Get Weather'),
            ),
            if (_weatherData != null)
              Column(
                children: [
                  Text('Temperature: ${_weatherData!.temperature}°C'),
                  Text('City: ${_weatherData!.cityName}'),
                  // You can add more details here
                ],
              ),
          ],
        ),
      ),
    );
  }
}
