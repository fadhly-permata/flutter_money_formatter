/// Copyright (c) 2019, Fadhly Permata.


import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

/// FlutterMoneyFormatter instance
class FlutterMoneyFormatter {
  /// CONSTRUCTOR
  ///
  /// Init instance with mandatory [value]
  FlutterMoneyFormatter({
    @required this.value
  });


  double value;
  String symbol = '\$';
  String thousandSeparator = ',';
  String decimalSeparator = '.';
  int decimalLength = 2;
  bool spaceBetweenSymbolAndNumber = false;


  /// Returns formatted number
  String get _baseFormat 
    =>
      NumberFormat
        .currency(
          symbol: '',
          decimalDigits: decimalLength
        )
        .format(value);


  /// Returns formatted number with refined separator chars
  String get _refineSeparator 
    =>
      _baseFormat
        .replaceAll(',', '(,)')
        .replaceAll('.', '(.)')
        .replaceAll('(,)', thousandSeparator)
        .replaceAll('(.)', decimalSeparator);


  /// Returns spacer as `spaceBetweenSymbolAndNumber` value
  String get _spacer => spaceBetweenSymbolAndNumber == true ? ' ' : '';


  /// Returns formatted number without currency symbol
  String get formattedNonSymbol => _refineSeparator;
  /// Returns formatted number with currency [symbol] on the left side.
  String get formattedLeftSymbol => '$symbol$_spacer$formattedNonSymbol';
  /// Returns formatted number with currency [symbol] on the right side.
  String get formattedRightSymbol => '$formattedNonSymbol$_spacer$symbol';
  /// Returns decimal-only with length as specified on [decimalLength].
  String get decimalOnly => formattedNonSymbol.substring(formattedNonSymbol.indexOf('.') + 1);
  /// Return formatted number without decimal.
  String get withoutDecimal => formattedNonSymbol.substring(0, formattedNonSymbol.indexOf('.'));


  /// Copies current instance and assign some values to the new instance.
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