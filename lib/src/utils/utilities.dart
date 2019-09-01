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
  _Utilities({@required this.amount, this.settings}) {
    this.settings = settings ?? MoneyFormatterSettings();
  }

  double amount;

  MoneyFormatterSettings settings;

  /// Returns formatted number
  String get baseFormat => NumberFormat.currency(
          symbol: '',
          decimalDigits: this.settings.fractionDigits,
          locale: 'en_US')
      .format(amount);

  /// Returns formatted number with refined separator chars
  String get refineSeparator => baseFormat
      .replaceAll(',', '(,)')
      .replaceAll('.', '(.)')
      .replaceAll('(,)', this.settings.thousandSeparator)
      .replaceAll('(.)', this.settings.decimalSeparator);

  /// Returns spacer as `spaceBetweenSymbolAndNumber` value
  String get spacer => this.settings.symbolAndNumberSeparator;

  /// Returns base compact format
  NumberFormat get baseCompact =>
      this.settings.compactFormatType == CompactFormatType.short
          ? NumberFormat.compact()
          : NumberFormat.compactLong();
}
