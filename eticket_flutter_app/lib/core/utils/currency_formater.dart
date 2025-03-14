import 'package:intl/intl.dart';
class CurrencyFormater {
  static String formatIDR(int value) {
    var formater = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    var result = formater.format(value);
    return result;
  }
}