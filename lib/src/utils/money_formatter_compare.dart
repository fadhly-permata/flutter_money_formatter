
/// [MoneyFormatterCompare] instance.
///
/// This instance is used to hold utilities in comparing values held by [FlutterMoneyFormatter]
class MoneyFormatterCompare {
  MoneyFormatterCompare({required this.amount});

  final double amount;

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
