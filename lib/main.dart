import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/ui/page/detail_weather/detail_weather_notifier.dart';
import 'package:weather_app/ui/page/detail_weather/detail_weather_view.dart';
import 'package:weather_app/ui/page/list_weather/weathers_notifier.dart';
import 'package:weather_app/ui/page/list_weather/weathers_view.dart';

void main() {
  setup();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<WeathersNotifier>(
          create: (context) => WeathersNotifier()),
      ChangeNotifierProvider<DetailWeatherNotifier>(
          create: (context) => DetailWeatherNotifier())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeathersView(),
    );
  }
}
