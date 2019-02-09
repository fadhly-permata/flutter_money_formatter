import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class FlutterMoneyFormatter {
  FlutterMoneyFormatter({
    @required this.value
  });

  double value;
  String symbol = '\$';
  String thousandSeparator = ',';
  String decimalSeparator = '.';
  int decimalLength = 2;
  bool spaceBetweenSymbolAndNumber = false;


  String get _baseFormat 
    =>
      NumberFormat
        .currency(
          symbol: '',
          decimalDigits: decimalLength
        )
        .format(value);


  String get _refineSeparator 
    =>
      _baseFormat
        .replaceAll(',', '(,)')
        .replaceAll('.', '(.)')
        .replaceAll('(,)', thousandSeparator)
        .replaceAll('(.)', decimalSeparator);

  String get _spacer => spaceBetweenSymbolAndNumber == true ? ' ' : '';

  String get formattedNonSymbol => _refineSeparator;
  String get formattedLeftSymbol => '$symbol$_spacer$formattedNonSymbol';
  String get formattedRightSymbol => '$formattedNonSymbol$_spacer$symbol';
  String get decimalOnly => formattedNonSymbol.substring(formattedNonSymbol.indexOf('.') + 1);
  String get withoutDecimal => formattedNonSymbol.substring(0, formattedNonSymbol.indexOf('.'));

  FlutterMoneyFormatter copyWith({
    double value,
    String symbol,
    String thousandSeparator,
    String decimalSeparator,
    int decimalLength,
    bool spaceBetweenSymbolAndNumber,
  }) {
    return FlutterMoneyFormatter(value: value ?? this.value)
    ..symbol = symbol ?? this.symbol
    ..thousandSeparator = thousandSeparator ?? this.thousandSeparator
    ..decimalSeparator = decimalSeparator ?? this.decimalSeparator
    ..decimalLength = decimalLength ?? this.decimalLength
    ..spaceBetweenSymbolAndNumber = spaceBetweenSymbolAndNumber ?? this.spaceBetweenSymbolAndNumber;
  }
}