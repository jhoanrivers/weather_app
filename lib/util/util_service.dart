

import 'package:intl/intl.dart';

class UtilService {

  static String dateFormat = "EEE, MMM d, yyyy HH:mm aa";
  static String detailFormat = "EEEE, MMMM d, yyyy";
  static String hourFormat = "HH:mm aa";


  static String convertDateTimetoString(DateTime dateTime) {
    return DateFormat(dateFormat).format(dateTime);

  }

  static String convertDateToStringDetail(DateTime datetime) {
    return DateFormat(detailFormat).format(datetime);
  }

  static String convertDateToHour(DateTime datetime) {
    return DateFormat(hourFormat).format(datetime);
  }



}