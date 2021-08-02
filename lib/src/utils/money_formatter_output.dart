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

/// [MoneyFormatterOutput] instance.
///
/// This instance will be used as [FlutterMoneyFormatter] output container. So you can take whatever format
/// you need from this instance.
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
