# FlutterMoneyFormatter


`FlutterMoneyFormatter` is an [Flutter](https://flutter.io) extension to formatting various types of currencies according to the characteristics you like, without having to be tied to any localization.


#### Dependencies :
![dart-sdk](https://img.shields.io/badge/Dart%20SDK-%3E=2.1.0%3C3.0.0-green.svg) ![intl](https://img.shields.io/badge/intl-0.15.7-green.svg)


#### Release Versions :
[![version](https://img.shields.io/badge/version-0.5.0-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.5.0) [![version](https://img.shields.io/badge/version-0.4.8+1-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.8+1) [![version](https://img.shields.io/badge/version-0.4.8-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.8) [![version](https://img.shields.io/badge/version-0.4.7-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.7)  [![version](https://img.shields.io/badge/version-0.4.6-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.6)  [![version](https://img.shields.io/badge/version-0.4.5-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.5)  [![version](https://img.shields.io/badge/version-0.4.4-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.4)  [![version](https://img.shields.io/badge/version-0.4.3-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.3)  [![version](https://img.shields.io/badge/version-0.4.2-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.2)  [![version](https://img.shields.io/badge/version-0.4.1-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.1)  [![version](https://img.shields.io/badge/version-0.4.0-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.4.0)  [![version](https://img.shields.io/badge/version-0.3.1-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.3.1)  [![version](https://img.shields.io/badge/version-0.3.0-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.3.0)  [![version](https://img.shields.io/badge/version-0.2.2-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.2.2)  [![version](https://img.shields.io/badge/version-0.2.1-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.2.1)  [![version](https://img.shields.io/badge/version-0.2.0-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.2.0)  [![version](https://img.shields.io/badge/version-0.1.1-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.1.1) [![version](https://img.shields.io/badge/version-0.1.0-orange.svg)](https://pub.dartlang.org/packages/flutter_money_formatter/versions/0.1.0)

[Version change logs](https://pub.dartlang.org/packages/flutter_money_formatter#-changelog-tab-)


----


## Install

For complete steps in installing `FlutterMoneyFormatter` you can see in the [**Installation Guide**](https://pub.dartlang.org/packages/flutter_money_formatter#-installing-tab-).


## Usage

Import the library

```dart
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
```


## Getting Started

To be able to format your `double` value into the various formats you want, you first need to create a `FlutterMoneyFormatter` instance like the following:


```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: 12345678.9012345);
```

> Note, the code above still uses the default configuration as [explained here](#configurations).

After that you can request various results of the format as follows:

```dart
// normal form
print(fmf.formattedNonSymbol); // 12,345,678.90
print(fmf.formattedLeftSymbol); // $12,345,678.90
print(fmf.formattedRightSymbol); // 12,345,678.90$
print(fmf.fractionDigitsOnly); // 90
print(fmf.withoutDecimal); // 12,345,678

// compact form
print(fmf.compactNonSymbol) // 12.3M
print(fmf.compactLeftSymbol) // $12.3M
print(fmf.compactRightSymbol) // 12.3M$
```

See [demo section](#demo) to get more info. 

## Configurations

To adjust the format to suit your needs, you can use my favorite notation way:

```dart
FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(amount: 12345678.9012345)
    ..symbol = 'IDR'
    ..thousandSeparator = '.'
    ..decimalSeparator = ','
    ..fractionDigits = 3
    ..spaceBetweenSymbolAndNumber = true;
```

Of course, you don't need to change the whole properties like on above sample. By default the properties have the default values as follows:


| Configuration Property        | Data Type                         | Default Value                 | Description   |
| ----------------------------- | --------------------------------- | ----------------------------- | ------------- |
| `symbol`                      | `String`                          | `$` (Dollar Sign)             | The symbol that will be used on formatted output. |
| `thousandSeparator`           | `String`                          | `,`                           | The character that will be used as thousand separator on formatted output. |
| `decimalSeparator`            | `String`                          | `.`                           | The character that will be used as decimal separator on formatted output. |
| `fractionDigits`              | `int`                             | `2`                           | The fraction digits that will be used on formatted output. |
| `spaceBetweenSymbolAndNumber` | `bool`                            | `false`                       | If the value is [true] then formatted output will shown space between the number and the currency symbol. |
| `CompactFormatType`           | [see Here](#CompactFormatType)    | `CompactFormatType.sort`      | Compact format type, sort or long type. |


## CompactFormatType

You can change the type of compact format like for million using `M` or `million`, or trillion using `T` or `trillion`. and so on. This type only supports two type as described below:

| Value                         | Description |
| ----------------------------- | ---------- |
| CompactFormatType.sort        | Used to make the compact format displayed using sort text. |
| CompactFormatType.long        | Used to make the compact format displayed using long text. |


## Duplicating Instance

For some reasons, you may need to duplicate the `instance` and change some configurations. To do that, you can use the `copyWith` method as below:

```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: 12345678.9012345)

print(fmf.formattedLeftSymbol);
print(fmf.copyWith(symbol: 'IDR', spaceBetweenSymbolAndNumber: true).formattedLeftSymbol);
```

---

## Complete Methods

| Method                    | Parameter         | Descriptions |
| ------------------------- | ----------------- | ------------ |
| `isLowerThan`             | `amount`          | Check current instance-amount is lower than [amount] or not.  |
| `isGreaterThan`           | `amount`          | Check current instance-amount is greater than [amount] or not. |
| `isEqual`                 | `amount`          | Check current instance amount is equal than [amount] or not. |
| `isEqualOrLowerThan`      | `amount`          | Check current instance amount is equal or lower than [amount] or not. |
| `isEqualOrGreaterThan`    | `amount`          | Check current instance amount is equal or greater than [amount] or not. |
| `CopyWith`                | [see here](#configurations) | [see here](#duplicating-instance) |

## Demo

For more complete samples, you can grab it from the [example directory](https://github.com/fadhly-permata/flutter_money_formatter/tree/master/example).

## Help Me

If you find an issue, bug, question, or want to request a new feature you can [do it here.](https://github.com/fadhly-permata/flutter_money_formatter/issues)

You can also help me improve and develop features by [forking this project via Github](https://github.com/fadhly-permata/flutter_money_formatter)


## ChangeLog

You are curious about the changes that occur in each version? [See here for detailed information](https://pub.dartlang.org/packages/flutter_money_formatter#-changelog-tab-).