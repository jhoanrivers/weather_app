

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/network/model/list_element.dart';
import 'package:weather_app/ui/page/detail_weather/detail_weather_notifier.dart';

class DetailWeatherView extends StatefulWidget {

  final ListElement element;

  const DetailWeatherView({Key? key, required this.element}) : super(key: key);

  @override
  State<DetailWeatherView> createState() => _DetailWeatherViewState();
}

class _DetailWeatherViewState extends State<DetailWeatherView> {

  late DetailWeatherNotifier detailWeatherNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailWeatherNotifier = Provider.of<DetailWeatherNotifier>(context, listen : false);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
