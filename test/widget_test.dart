// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/network/model/weather.dart';

import 'api_client_test.dart';

void main() {

  ApiClientTest apiClientTest= ApiClientTest();

  group("Get Weather test", () {
    test("return weather if load is successful", () async {
      Weather weather = await apiClientTest.getWeatherByLatLong("123", "353");
      expect(weather.cod,'200');
    });

  });



}
