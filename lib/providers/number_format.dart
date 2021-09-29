part of 'providers.dart';

String convertToCurrency(int number) {
  final formatCurrency =
  NumberFormat.currency(locale: 'id', decimalDigits: 0, name: '');

  return formatCurrency.format(number);
}