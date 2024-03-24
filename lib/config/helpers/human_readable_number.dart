

import 'package:intl/intl.dart';

class HumanReadableNumber {

  static String humanReadableNumber( double number ){

    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);

    return formatterNumber;
  }

}