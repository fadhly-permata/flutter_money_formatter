part of '../flutter_money_formatter_base.dart';

enum FastCalcType {
  addition,
  substraction,
  multiplication,
  division,
  percentageAddition,
  percentageSubstraction
}

class _Utilities {
  _Utilities({required this.amount, this.settings}) {
    this.settings = settings ?? MoneyFormatterSettings();
  }

  final double amount;

  MoneyFormatterSettings? settings;

  /// Returns formatted number
  String get baseFormat => NumberFormat.currency(
          symbol: '',
          decimalDigits: this.settings?.fractionDigits,
          locale: 'en_US')
      .format(amount);

  /// Returns formatted number with refined separator chars
  String get refineSeparator => baseFormat
      .replaceAll(',', '(,)')
      .replaceAll('.', '(.)')
      .replaceAll('(,)', this.settings?.thousandSeparator ?? ' ')
      .replaceAll('(.)', this.settings?.decimalSeparator ?? ' ');

  /// Returns spacer as `spaceBetweenSymbolAndNumber` value
  String get spacer => this.settings?.symbolAndNumberSeparator ?? ' ';

  /// Returns base compact format
  NumberFormat get baseCompact =>
      this.settings?.compactFormatType == CompactFormatType.short
          ? NumberFormat.compact()
          : NumberFormat.compactLong();
}
