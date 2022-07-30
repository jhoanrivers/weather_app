import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/page/detail_weather/detail_weather_view.dart';
import 'package:weather_app/ui/page/list_weather/empty_view.dart';
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
        title: Text("Weather App"),
        centerTitle: false,

        actions: [

        ],
      ),
      body: Center(
        child: Consumer<WeathersNotifier>(
          builder: (context, weather, build) {
            return weather.loading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : weather.listElement.isEmpty
                ? EmptyView()
                : Column(
                  children: [
                    Container(
                      color: Colors.black12,
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: Text("Weather forecasts in ${weather.city.name}"),
                    ),
                    Expanded(
                      child: ListView.separated(
                      itemCount: weather.listElement.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.black26,
                        );
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailWeatherView(element: weather.listElement[index])));
                          },
                            child: WeatherItem(element: weather.listElement[index]));
                      },
            ),
                    ),
                  ],
                );
          },
        ),
      ),
    );
  }
}
