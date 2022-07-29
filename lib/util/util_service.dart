

import 'package:intl/intl.dart';

class UtilService {


  static String convertDateTimetoString(DateTime dateTime) {
    return DateFormat("EEE, MMM DD, YYYY HH:MM aa").format(dateTime);

  }


}