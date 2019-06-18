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
import 'package:intl/intl.dart';

import 'package:flutter_money_formatter/src/utils/compact_format_type.dart';
import 'package:flutter_money_formatter/src/utils/money_formatter_settings.dart';
import 'package:flutter_money_formatter/src/utils/money_formatter_output.dart';
import 'package:flutter_money_formatter/src/utils/money_formatter_compare.dart';

part 'utils/utilities.dart';

/// [FlutterMoneyFormatter] instance
class FlutterMoneyFormatter {
  _Utilities _utilities;

  /// Init instance of [FlutterMoneyFormatter]
  ///
  /// [amount] (@required) the number that will be formatted
  FlutterMoneyFormatter({@required this.amount, this.settings}) {
    this.settings = settings ?? MoneyFormatterSettings();
    output = _getOutput();
    comparator = MoneyFormatterCompare(amount: this.amount);
  }

  /// Amount number that will be formatted.
  double amount;

  /// The formatter settings
  MoneyFormatterSettings settings;

  /// Returns compiled and formatted output in several formats.
  MoneyFormatterOutput output;

  /// Comparator
  MoneyFormatterCompare comparator;

  /// output builder
  MoneyFormatterOutput _getOutput() {
    _utilities = _Utilities(amount: this.amount, settings: this.settings);

    String _urs = _utilities.refineSeparator;
    int _decSepCharPos = _urs.indexOf(this.settings.decimalSeparator);

    return MoneyFormatterOutput(
        nonSymbol: _urs,
        symbolOnLeft: '${this.settings.symbol}${_utilities.spacer}$_urs',
        symbolOnRight: '$_urs${_utilities.spacer}${this.settings.symbol}',
        compactNonSymbol: _compactNonSymbol,
        compactSymbolOnLeft:
            '${this.settings.symbol}${_utilities.spacer}$_compactNonSymbol',
        compactSymbolOnRight:
            '$_compactNonSymbol${_utilities.spacer}${this.settings.symbol}',
        fractionDigitsOnly:
            _urs.substring((-1 == _decSepCharPos ? 0 : _decSepCharPos + 1)),
        withoutFractionDigits: _urs.substring(
            0, -1 == _decSepCharPos ? _urs.length - 1 : _decSepCharPos));
  }

  /// returns FlutterMoneyFormatter after calculating amount.
  FlutterMoneyFormatter fastCalc(
      {@required FastCalcType type, @required double amount}) {
    switch (type) {
      case FastCalcType.addition:
        this.amount += amount;
        break;

      case FastCalcType.substraction:
        this.amount -= amount;
        break;

      case FastCalcType.multiplication:
        this.amount *= amount;
        break;

      case FastCalcType.division:
        this.amount /= amount;
        break;

      case FastCalcType.percentageAddition:
        this.amount += (amount / 100) * this.amount;
        break;

      case FastCalcType.percentageSubstraction:
        this.amount -= (amount / 100) * this.amount;
        break;

      default:
        throw "Unknown calculation type.";
    }

    return this;
  }

  /// Copies current instance and change some values to the new instance.
  FlutterMoneyFormatter copyWith(
      {double amount,
      String symbol,
      String thousandSeparator,
      String decimalSeparator,
      int fractionDigits,
      String symbolAndNumberSeparator,
      CompactFormatType compactFormatType}) {
    MoneyFormatterSettings ts = this.settings;

    MoneyFormatterSettings mfs = MoneyFormatterSettings(
        symbol: symbol ?? ts.symbol,
        thousandSeparator: thousandSeparator ?? ts.thousandSeparator,
        decimalSeparator: decimalSeparator ?? ts.decimalSeparator,
        symbolAndNumberSeparator:
            symbolAndNumberSeparator ?? ts.symbolAndNumberSeparator,
        fractionDigits: fractionDigits ?? ts.fractionDigits,
        compactFormatType: compactFormatType ?? ts.compactFormatType);

    return FlutterMoneyFormatter(amount: amount ?? this.amount, settings: mfs);
  }

  /// Returns compact format number without currency symbol
  String get _compactNonSymbol {
    String compacted = _utilities.baseCompact.format(amount);
    String numerics = RegExp(r'(\d+\.\d+)|(\d+)')
        .allMatches(compacted)
        .map((_) => _.group(0))
        .toString()
        .replaceAll('(', '')
        .replaceAll(')', '');

    String alphas = compacted.replaceAll(numerics, '');

    String reformat = NumberFormat.currency(
            symbol: '',
            decimalDigits:
                numerics.indexOf('.') == -1 ? 0 : this.settings.fractionDigits)
        .format(num.parse(numerics));

    return '$reformat$alphas';
  }
}
