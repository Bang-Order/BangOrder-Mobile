part of 'utils.dart';

String currency(int number) {
  final formatCurrency = NumberFormat.currency(
    locale: 'id',
    decimalDigits: 0,
    name: '',
  );

  return formatCurrency.format(number);
}
