import 'package:intl/intl.dart';

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat =
        NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);
    return numberFormat.format(price);
  }
}
