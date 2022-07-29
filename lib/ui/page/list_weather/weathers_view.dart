import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/page/detail_weather/detail_weather_view.dart';
import 'package:weather_app/ui/page/list_weather/weather_item.dart';
import 'package:weather_app/ui/page/list_weather/weathers_notifier.dart';

import '../../../util/constant.dart';

class WeathersView extends StatefulWidget {
  const WeathersView({Key? key}) : super(key: key);

  @override
  State<WeathersView> createState() => _WeathersViewState();
}

class _WeathersViewState extends State<WeathersView> {
  late WeathersNotifier weathersNotifier;

  @override
  void initState() {
    super.initState();
    weathersNotifier = Provider.of<WeathersNotifier>(context, listen: false);
    weathersNotifier.getWeatherByLatLong();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Consumer<WeathersNotifier>(
          builder: (context, weather, build) {
            return weather.loading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : weather.listElement.isEmpty
                ? Center(
              child: Image.asset(
                Constant.baseImage,
              ),
            )
                : ListView.separated(
                itemCount: weather.listElement.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.black12,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailWeatherView(element: weather.listElement[index])));
                    },
                      child: WeatherItem(element: weather.listElement[index]));
                },
            );
          },
        ),
      ),
    );
  }
}
