part of 'utils.dart';

String currency(int number) => NumberFormat.currency(
      locale: 'id',
      decimalDigits: 0,
      name: '',
    ).format(number);
