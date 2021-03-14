class MoneyFormatterOutput {
  /// Init instance of [MoneyFormatterOutput]
  MoneyFormatterOutput(
      {required this.nonSymbol,
      required this.symbolOnLeft,
      required this.symbolOnRight,
      required this.compactNonSymbol,
      required this.compactSymbolOnLeft,
      required this.compactSymbolOnRight,
      required this.fractionDigitsOnly,
      required this.withoutFractionDigits});

  /// Returns formatted number without currency symbol
  final String nonSymbol;

  /// Returns formatted number with currency symbol on the left side.
  final String symbolOnLeft;

  /// Returns formatted number with currency symbol on the right side.
  final String symbolOnRight;

  /// Returns compact format number without currency symbol
  final String compactNonSymbol;

  /// Returns compact format number with currency symbol on the left side.
  final String compactSymbolOnLeft;

  /// Returns compact format number with currency symbol on the right side.
  final String compactSymbolOnRight;

  /// Returns decimal-only with length as specified on fractionDigits.
  final String fractionDigitsOnly;

  /// Returns formatted number without decimal.
  final String withoutFractionDigits;
}
