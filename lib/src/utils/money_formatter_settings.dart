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

import 'package:flutter_money_formatter/src/utils/compact_format_type.dart';

/// [MoneyFormatterSettings] instance.
///
/// This instance is used as a configurator for the [FlutterMoneyFormatter] instance.
/// You can change the output of [FlutterMoneyFormatter] through this instance.
class MoneyFormatterSettings {
  /// Init instance of [MoneyFormatterSettings]
  MoneyFormatterSettings(
      {this.symbol,
      this.thousandSeparator,
      this.decimalSeparator,
      this.symbolAndNumberSeparator,
      this.fractionDigits,
      this.compactFormatType}) {
    this.symbol = this.symbol ?? '\$';
    this.thousandSeparator = this.thousandSeparator ?? ',';
    this.decimalSeparator = this.decimalSeparator ?? '.';
    this.symbolAndNumberSeparator = this.symbolAndNumberSeparator ?? ' ';
    this.fractionDigits = this.fractionDigits ?? 2;
    this.compactFormatType = this.compactFormatType ?? CompactFormatType.short;
  }

  /// The [symbol] that will be used on formatted output, default value is $ (Dollar Sign)
  String? symbol;

  // The character that will be used as thousand separator on formatted output, default value is ',' (comma)
  String? thousandSeparator;

  /// The character that will be used as decimal separator on formatted output, default value is '.' (dot)
  String? decimalSeparator;

  /// The character that will be used as separator between the numbers and the symbol.
  String? symbolAndNumberSeparator;

  /// The fraction digits that will be used on formatted output, default value is 2.
  int? fractionDigits;

  /// Compact format type, for example using 'million' or 'M'
  CompactFormatType? compactFormatType;
}
