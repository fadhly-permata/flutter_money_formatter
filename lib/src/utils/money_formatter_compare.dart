/// Copyright (c) 2019, Fadhly Permata (<fadhly.permata@gmail.com>)
/// All rights reserved.
///
/// Redistribution and use in source and binary forms, with or without
/// modification, are permitted provided that the following conditions are met:
///
/// 1. Redistributions of source code must retain the above copyright notice, this
///    list of conditions and the following disclaimer.
/// 2. Redistributions in binary form must reproduce the above copyright notice,
///    this list of conditions and the following disclaimer in the documentation
///    and/or other materials provided with the distribution.
///
/// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
/// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
/// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
/// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
/// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
/// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
/// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
/// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
/// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
/// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
///
/// The views and conclusions contained in the software and documentation are those
/// of the authors and should not be interpreted as representing official policies,
/// either expressed or implied, of the FlutterMoneyFormatter project.
///
///
/// ---
///
/// | Author  | Fadhly Permata |
/// | ------- | -------------- |
/// | Email   | fadhly.permata@gmail.com |
/// | GitHub  | https://github.com/fadhly-permata/flutter_money_formatter |
/// | Pub     | https://pub.dartlang.org/packages/flutter_money_formatter |
///
/// ---

import 'package:flutter/foundation.dart';

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
