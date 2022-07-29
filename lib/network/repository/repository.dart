
import 'package:weather_app/locator.dart';
import 'package:weather_app/network/client/iapi_client.dart';
import 'package:weather_app/network/model/weather.dart';
import 'package:weather_app/network/repository/irepository.dart';

import '../client/api_imp.dart';

class Repository extends IRepository{


  @override
  Future<Weather> getWeatherByLatLong(String latitude, String longitude) async{
    return await getIt.get<ApiClient>().getWeatherByLatLong(latitude, longitude);
  }





}