# FlutterMoneyFormatter

![pub-version](https://img.shields.io/badge/pub-0.3.0-orange.svg) ![dart-sdk](https://img.shields.io/badge/Dart%20SDK-%3E=2.1.0%3C3.0.0-green.svg) ![intl](https://img.shields.io/badge/intl-0.15.7-green.svg)

`FlutterMoneyFormatter` is a Flutter extension that can be used to handle currency formats that are not bound by the operating system configuration.

In formatting currencies, you can easily do it without having to make your own formatter. Because `FlutterMoneyFormatter` is indeed designed to work independently and has complete utilities.

![logo](doc/flutter_logo.png)

## Install

For the complete step, the installation of `Flutter Money Formatter` can be seen here. : [Installation Guide](https://pub.dartlang.org/packages/flutter_money_formatter#-installing-tab-)

## Usage

Import the library

```dart
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
```


## Getting Started

To be able to format the `double` value into the various formats you want, you first need to create a `FlutterMoneyFormatter` instance like the following:


```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(value: 12345678.9012345);
```

After that you can request various results of the format as follows:

```dart
// normal form
print(fmf.formattedNonSymbol); // 12,345,678.90
print(fmf.formattedLeftSymbol); // $12,345,678.90
print(fmf.formattedRightSymbol); // 12,345,678.90$
print(fmf.decimalOnly); // 90
print(fmf.withoutDecimal); // 12,345,678

// compact form
print(fmf.compactNonSymbol) // 12.3M
print(fmf.compactLeftSymbol) // $12.3M
print(fmf.compactRightSymbol) // 12.3M$
```

## Configurations

To adjust the format to suit your needs, you can use my favorite notation way:

```dart
FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(value: 12345678.9012345)
    ..symbol = 'IDR'
    ..thousandSeparator = '.'
    ..decimalSeparator = ','
    ..decimalLength = 3
    ..spaceBetweenSymbolAndNumber = true;
```

Of course, you don't need to change the whole notation above. By default the parameters above have the default values as follows:


| Notation                      | Data Type                         | Default Value                 | Description   |
| ----------------------------- | --------------------------------- | ----------------------------- | ------------- |
| `symbol`                      | `String`                          | `$` (Dollar Sign)             | The symbol that will be used on formatted output. |
| `thousandSeparator`           | `String`                          | `,`                           | The character that will be used as thousand separator on formatted output. |
| `decimalSeparator`            | `String`                          | `.`                           | The character that will be used as decimal separator on formatted output. |
| `fractionDigits`              | `int`                             | `2`                           | The fraction digits that will be used on formatted output. |
| `spaceBetweenSymbolAndNumber` | `bool`                            | `false`                       | If the value is [true] then formatted output will shown space between the number and the currency symbol. |
| `compactFormatCase`           | [see Here](#CompactFormatCase)    | `CompactFormatCase.uppercase` | Compact format case type, lowercases or uppercase. |


# CompactFormatCase

Use can change the case for compact format case like for million using `M` or `m`, or Killo using `K` or `k`. and so on. This type only supports two cases type as described below:

| Value                         | Description |
| ----------------------------- | ---------- |
| CompactFormatCase.lowercase   | Used to make the compact format displayed using lowercase. |
| CompactFormatCase.uppercase   | Used to make the compact format displayed using uppercase. |


# Duplicating Instance

For some reasons, you may need to duplicate the `instance` and change some configurations. To do that, you can use the `copyWith` method as below:

```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(value: 12345678.9012345)

print(fmf.formattedLeftSymbol);
print(fmf.copyWith(symbol: 'IDR', spaceBetweenSymbolAndNumber: true).formattedLeftSymbol);
```

---

# Complete Methods
| Method                    | Parameter         | Descriptions |
| ------------------------- | ----------------- | ------------ |
| `isLowerThan`             | `amount`          | Check current instance-amount is lower than [amount] or not.  |
| `isGreaterThan`           | `amount`          | Check current instance-amount is greater than [amount] or not. |
| `isEqual`                 | `amount`          | Check current instance amount is equal than [amount] or not. |
| `isEqualOrLowerThan`      | `amount`          | Check current instance amount is equal or lower than [amount] or not. |
| `isEqualOrGreaterThan`    | `amount`          | Check current instance amount is equal or greater than [amount] or not. |
| `CopyWith`                | [see here](#configurations) | [see here](#duplicating-instance) |