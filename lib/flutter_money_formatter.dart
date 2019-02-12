/// Copyright (c) 2019, Fadhly Permata.

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

enum CompactFormatCase { lowercase, uppercase }


/// FlutterMoneyFormatter instance
class FlutterMoneyFormatter {
  /// Init instance of [FlutterMoneyFormatter]
  ///
  /// [amount] @required the number that will be formatted
  FlutterMoneyFormatter({@required this.amount});


  /// Amount number that will be formatted.
  double amount;


  /// The [symbol] that will be used on formatted output, default value is $ (Dollar Sign)
  String symbol = '\$';
  // The character that will be used as thousand separator on formatted output, default value is ',' (comma)
  String thousandSeparator = ',';

  /// The character that will be used as decimal separator on formatted output, default value is '.' (dot)
  String decimalSeparator = '.';

  /// The fraction digits that will be used on formatted output, default value is 2.
  int fractionDigits = 2;

  /// If the value is [true] then formatted output will shown space between the number and the currency symbol.
  bool spaceBetweenSymbolAndNumber = false;

  /// Compact format case
  CompactFormatCase compactFormatCase = CompactFormatCase.uppercase;


  /// Returns formatted number
  String get _baseFormat =>
      NumberFormat.currency(symbol: '', decimalDigits: fractionDigits)
          .format(amount);

  /// Returns formatted number with refined separator chars
  String get _refineSeparator => _baseFormat
      .replaceAll(',', '(,)')
      .replaceAll('.', '(.)')
      .replaceAll('(,)', thousandSeparator)
      .replaceAll('(.)', decimalSeparator);


  /// Returns spacer as `spaceBetweenSymbolAndNumber` value
  String get _spacer => spaceBetweenSymbolAndNumber == true ? ' ' : '';


  NumberFormat get _baseCompact => NumberFormat.compactCurrency(
      symbol: this.symbol, decimalDigits: this.fractionDigits);


  /// Returns formatted number without currency symbol
  String get formattedNonSymbol => _refineSeparator;


  /// Returns formatted number with currency [symbol] on the left side.
  String get formattedLeftSymbol => '$symbol$_spacer$formattedNonSymbol';


  /// Returns formatted number with currency [symbol] on the right side.
  String get formattedRightSymbol => '$formattedNonSymbol$_spacer$symbol';


  /// Returns decimal-only with length as specified on [fractionDigits].
  String get fractionDigitsOnly => formattedNonSymbol.substring(formattedNonSymbol.indexOf('.') + 1);


  /// Returns formatted number without decimal.
  String get withoutDecimal => formattedNonSymbol.substring(0, formattedNonSymbol.indexOf('.'));


  /// Returns compact format number without currency symbol
  String get compactNonSymbol {
    String format = _baseCompact.format(amount).replaceAll('${this.symbol}', '');
    return compactFormatCase == CompactFormatCase.lowercase
        ? format.toLowerCase()
        : format.toUpperCase();
  }


  /// Returns compact format number with currency symbol on the left side.
  String get compactLeftSymbol => '$symbol$_spacer$compactNonSymbol';


  /// Returns compact format number with currency symbol on the right side.
  String get compactRightSymbol => '$compactNonSymbol$_spacer$symbol';


  /// Copies current instance and change some values to the new instance.
  FlutterMoneyFormatter copyWith(
      {double value,
      String symbol,
      String thousandSeparator,
      String decimalSeparator,
      int fractionDigits,
      bool spaceBetweenSymbolAndNumber,
      CompactFormatCase compactFormatCase}) {
    return FlutterMoneyFormatter(amount: value ?? this.amount)
      ..symbol = symbol ?? this.symbol
      ..thousandSeparator = thousandSeparator ?? this.thousandSeparator
      ..decimalSeparator = decimalSeparator ?? this.decimalSeparator
      ..fractionDigits = fractionDigits ?? this.fractionDigits
      ..spaceBetweenSymbolAndNumber = spaceBetweenSymbolAndNumber ?? this.spaceBetweenSymbolAndNumber
      ..compactFormatCase = compactFormatCase ?? this.compactFormatCase;
  }

  /// Check current instance amount is lower than [amount] or not
  bool isLowerThan(double amount) => this.amount < amount;

  /// Check current instance amount is greater than [amount] or not
  bool isGreaterThan(double amount) => this.amount > amount;

  /// Check current instance amount is equal than [amount] or not
  bool isEqual(double amount) => this.amount == amount;

  /// Check current instance amount is equal or lower than [amount] or not
  bool isEqualOrLowerThan(double amount) => this.amount <= amount;

  /// Check current instance amount is equal or greater than [amount] or not
  bool isEqualOrGreaterThan(double amount) => this.amount >= amount;
}