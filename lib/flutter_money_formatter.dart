/// Copyright (c) 2019, Fadhly Permata.
/// email   : fadhly.permata@gmail.com
/// github  : https://github.com/fadhly-permata/flutter_money_formatter

library flutter_money_formatter;

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';


/// An enum to be used on compact text format
enum CompactFormatType { sort, long }


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
  CompactFormatType compactFormatType = CompactFormatType.sort;


  /// Returns formatted number
  String get _baseFormat =>
      NumberFormat
        .currency(symbol: '', decimalDigits: fractionDigits)
        .format(amount);


  /// Returns formatted number with refined separator chars
  String get _refineSeparator => _baseFormat
      .replaceAll(',', '(,)')
      .replaceAll('.', '(.)')
      .replaceAll('(,)', thousandSeparator)
      .replaceAll('(.)', decimalSeparator);


  /// Returns spacer as `spaceBetweenSymbolAndNumber` value
  String get _spacer => spaceBetweenSymbolAndNumber == true ? ' ' : '';


  /// Returns base compact format
  NumberFormat get _baseCompact 
    => 
      compactFormatType == CompactFormatType.sort 
      ? NumberFormat.compact() 
      : NumberFormat.compactLong();


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
    String compacted = _baseCompact.format(amount);
    String numerics = RegExp(r'(\d+\.\d+)|(\d+)')
      .allMatches(compacted)
      .map((_) => _.group(0))
      .toString()
      .replaceAll('(', '')
      .replaceAll(')', '');

    String alphas = compacted.replaceAll(numerics, '');

    String reformat = NumberFormat
      .currency(symbol: '', decimalDigits: numerics.indexOf('.') == -1 ? 0 : fractionDigits)
      .format(num.parse(numerics));

    return '$reformat$alphas';
  }


  /// Returns compact format number with currency symbol on the left side.
  String get compactLeftSymbol => '$symbol$_spacer$compactNonSymbol';


  /// Returns compact format number with currency symbol on the right side.
  String get compactRightSymbol => '$compactNonSymbol$_spacer$symbol';


  /// Copies current instance and change some values to the new instance.
  FlutterMoneyFormatter copyWith(
      {double amount,
      String symbol,
      String thousandSeparator,
      String decimalSeparator,
      int fractionDigits,
      bool spaceBetweenSymbolAndNumber,
      CompactFormatType compactFormatType}) {
    return FlutterMoneyFormatter(amount: amount ?? this.amount)
      ..symbol = symbol ?? this.symbol
      ..thousandSeparator = thousandSeparator ?? this.thousandSeparator
      ..decimalSeparator = decimalSeparator ?? this.decimalSeparator
      ..fractionDigits = fractionDigits ?? this.fractionDigits
      ..spaceBetweenSymbolAndNumber = spaceBetweenSymbolAndNumber ?? this.spaceBetweenSymbolAndNumber
      ..compactFormatType = compactFormatType ?? this.compactFormatType;
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