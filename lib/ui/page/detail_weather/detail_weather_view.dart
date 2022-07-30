import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/network/model/list_element.dart';
import 'package:weather_app/ui/page/detail_weather/detail_weather_notifier.dart';
import 'package:weather_app/util/base_sized.dart';
import 'package:weather_app/util/base_style.dart';
import 'package:weather_app/util/util_service.dart';

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
    super.initState();
    detailWeatherNotifier =
        Provider.of<DetailWeatherNotifier>(context, listen: false);
    detailWeatherNotifier.initElement(widget.element);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Weather Details"),
          centerTitle: false,
        ),
        body: Consumer<DetailWeatherNotifier>(
          builder: (context, detail, child) {
            return detail.element == null
            ? Center(
              child: CircularProgressIndicator(),
            )
            : Center(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      UtilService.convertDateToStringDetail(detail.element.dtTxt!),
                      style: BaseStyle.ts16BlBold(),
                    ),
                    BaseSized.h6(),
                    Text(
                      UtilService.convertDateToHour(detail.element.dtTxt!),
                      style: BaseStyle.ts14BlNormal(),
                    ),
                    BaseSized.h24(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${(detail.element.main!.temp - 273.15).toStringAsFixed(2)}°C",
                        style: BaseStyle.ts32BlBold(),),
                        Image.network(
                          "http://openweathermap.org/img/wn/${detail.element.weather![0].icon}@2x.png",
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                    BaseSized.h24(),
                    Text("${detail.element.weather![0].main} (${detail.element.weather![0].description})"),
                    BaseSized.h24(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Temp(min)",style: BaseStyle.ts14BlNormal(),),
                            BaseSized.h6(),
                            Text("${(detail.element.main!.tempMin - 273.15).toStringAsFixed(2)}°C", style: BaseStyle.ts14Bold(),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("Temp(max)", style: BaseStyle.ts14BlNormal()),
                            BaseSized.h6(),
                            Text("${(detail.element.main!.tempMax - 273.15).toStringAsFixed(2)}°C",style: BaseStyle.ts14Bold())
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async{
    return true;
  }

}
