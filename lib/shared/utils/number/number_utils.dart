import 'package:intl/intl.dart';

String formatPrice(double amount) {
  final formatter = NumberFormat("#,##0", "en_US");

  return formatter.format(amount);
}
