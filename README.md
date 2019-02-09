# flutter_money_formatter

Money formatter for flutter

Use this package if you need more costumization when formatting money in flutter.

![logo](doc/flutter_logo.png)

## Install

Follow this [GUIDE](https://pub.dartlang.org/packages/flutter_money_formatter#-installing-tab-)

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
print(fmf.formattedNonSymbol); // 12,345,678.90
print(fmf.formattedLeftSymbol); // $12,345,678.90
print(fmf.formattedRightSymbol); // 12,345,678.90$
print(fmf.decimalOnly); // 90
print(fmf.withoutDecimal); // 12,345,678
```

## Configuration

To adjust the format to suit your needs, you can use my favorite notation way:

```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(value: 12345678.9012345)
    ..symbol = 'IDR'
    ..thousandSeparator = '.'
    ..decimalSeparator = ','
    ..decimalLength = 3
    ..spaceBetweenSymbolAndNumber = true;
```

Of course, you don't need to change the whole notation. By default the parameters above have the default values as follows:


| Anotation                     | Data Type | Default Value    |
| ----------------------------- | --------- | ---------------- |
| `symbol`                      | `String`  | `$` (USD Symbol) |
| `thousandSeparator`           | `String`  | `,`              |
| `decimalSeparator`            | `String`  | `.`              |
| `decimalLength`               | `int`     | `2`              |
| `spaceBetweenSymbolAndNumber` | `bool`    | `false`          |


Duplicating the `instance` and change some configurations

```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(value: 12345678.9012345)

print(fmf.formattedLeftSymbol);
print(fmf.copyWith(symbol: 'IDR', spaceBetweenSymbolAndNumber: true).formattedLeftSymbol);
```