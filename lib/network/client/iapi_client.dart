
import 'package:weather_app/network/model/weather.dart';

abstract class IApiClient {

  Future<List<Weather>> getWeathers();


}