import 'package:intl/intl.dart';

String formatPrice(double amount) {
  final formatter = NumberFormat("#,##0.0", "zh_CN");

  return formatter.format(amount);
}
