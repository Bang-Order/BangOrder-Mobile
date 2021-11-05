part of 'utils.dart';

String currency(double number) => NumberFormat.currency(
      locale: 'id',
      decimalDigits: 0,
      name: '',
    ).format(number);
