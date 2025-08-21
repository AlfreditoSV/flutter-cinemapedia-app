import 'package:intl/intl.dart';

class HumanFormats {

  static String number(double number){

    final formatNumber=NumberFormat.compactCurrency(
      locale: 'en',
      symbol: '',
      decimalDigits: 0,
    );

    return formatNumber.format(number);
  }
}
