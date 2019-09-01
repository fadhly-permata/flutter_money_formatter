# FlutterMoneyFormatter


> `FlutterMoneyFormatter` is a [Flutter](https://flutter.io) extension to formatting various types of currencies according to the characteristics you like, without having to be tied to any localization.
>
> [![latest version](https://img.shields.io/pub/v/flutter_money_formatter.svg?style=plastic&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAQAAAC1QeVaAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQfjAg8HMDMbfsHaAAABSUlEQVQY0y2LsUvUYRyHn+/7fe2uVMIz4hcnin+BFCrdZq1BQ1MN4VJxY7MoRLg7OGQ0NPkfiIOYBbYpiUO0VSQ15UFxHHf8fu/7cTif9XkeEz/54TO5qX4xtmJP8mZ8vR+vpt/q4gU3QitP3Iwr9fdhyerhPjZ7cBZH9Rf75ldSp11tXKsnZYHlEDvrt9dO4/dkjwjF6tde43M5GjGBlGoxrNtainGOsef9RqsMIyfUEZg8V1pVslf+crL3dup6EW6ZOMMRGEbmnmqh07bpkLEB89xhgMFQo8dRy4AZMGAe+EINkAEp2B6QhvHw7nOJ+9Fuq2guNsvKDaNiBvGLkUTQuf8Pd3e6U+MLKnGAkmkyf8xN/+zAeuFBKt+FZ6qGmux+tP3xw0TFGz7ZoffRlqQkSSolvRCK8Skmz9lpE3lIl0CiUfUix34BalOOAMgIffsAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTktMDItMTVUMDc6NDg6NTEtMDU6MDCMNC56AAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE5LTAyLTE1VDA3OjQ4OjUxLTA1OjAw/WmWxgAAAABJRU5ErkJggg==)](https://pub.dartlang.org/packages/flutter_money_formatter)
> [![last commit](https://img.shields.io/github/last-commit/fadhly-permata/flutter_money_formatter.svg?logo=github&style=plastic)](https://github.com/fadhly-permata/flutter_money_formatter)
> [![License](https://img.shields.io/badge/license-BSD-blue.svg?style=plastic&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAMAAAAolt3jAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAACPVBMVEXLy9UAAADLy9Tn7ubo7+bh5+Lb397b397i6OLc4N/f4+Df5ODc4N/i5+Li5+Lk6ePj6ePf4uAAAFbo7ubn7uU5F3re4eDw9+ru9unk6uTu9unOztbLy9XQ0NfMzNXKydTLytXLytTKydPMzNXPz9fNzdbIyNPY29zZ3N3Z3N3Y29zb397b397Y29zZ3N3Z3N3Y29zIyNPNzdW/vM3Y29zc4N/c4N/c4N/c4N/c4N/c4N/c4N/c39/c4N/X29zAvM3b397c4N/b397b3t7b397b397b39/b397b3t7b39/c4N/b397b39/b397b39/a3t7c4N/c4N/a3t7b397b397b39/b39/b39/b39/b397b4N7b39/b397b39/b39/b397c4N/b397b397b397c4N/U19vb4N7b39/U1tvc4N/b397b397b397c4N/c4N/c4N/b397b4N7b39/b39/c4N/c4N/a3d7b397b397b397a3d7b4N7b39/a3d7b397b397b397a3d7T1NnU1trQ0dfb4N7b39/Q0dfU1trT1NnQ0dfT1NnR09jT1drT1drb4N7b39/T1trU1trR09jT1dnQ0NfNztbR0tjb397c4N/c4N/c4N/c4N/c4N/b39/NztbHx9LPz9fNzdXP0Nfb397b397b397b397b397b397b397b397FxNHJydTOztbPz9fMzNXNzdbOztbOztbLy9XLy9XNzdXMzNXPz9fc4N/c4N/c4N/c4N/c4N////9bn80kAAAAuXRSTlMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMEAQAAAQQDBAQRGBYQZ2cQFhgRBAQCC9T7+vr///r71AsCI+pwN0Hg4EE3cOsjlE+PBdbVBY5PlVxvZWfa2WdlcFvKXVFYwAjU0wjAWFFdy7D7sNfXsfuwC3u7gxDX1hCDu3sLAwAE1tUEAAMECAYGCNPSCAYGCAQDBqrv/f3x/MsEAwQEBmihl5OTmJ98AwQEAwQEAQAAAAMEAzPoO4QAAAABYktHRL6k3IPDAAAAB3RJTUUH4wIPByY17oXROAAAAN1JREFUCNcB0gAt/wAdHh8AIAEBAQEhAiIjJAAlJicoKSorLC0uLzAxMgAzNDU2Nzg5Ojs3PD0+PwADQEFCQ0RFRkdISUpLBAAFTE1OTwZQUQdSU1RVCABWVwlYWQpaWwtcXQxeXwBgYWJjZGVmZ2hpamtsbQBuuW+6cA1xcg5zu3S8dQB2d3h5eg97fBB9fn+AgQCCEYMShBOFhhSHFYgWiQCKi4yNjhePkBiRkpOUlQCWlxmYvZmam5ydnp+goQCioxqkpaanqKmqq6ytrgCvsLGyG7MBAbQctba3uPQxRmBOIi5hAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTAyLTE1VDA3OjM4OjUzLTA1OjAwMpAq0AAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0wMi0xNVQwNzozODo1My0wNTowMEPNkmwAAAAASUVORK5CYII=)](https://raw.githubusercontent.com/fadhly-permata/flutter_money_formatter/master/LICENSE)

#### Dependencies :
[![intl](https://img.shields.io/pub/vpre/intl.svg?label=intl&colorA=gray&colorB=green&style=plastic)](https://pub.dartlang.org/packages/intl)


### Screenshot
![screenshot](doc/fmf.gif)

---


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
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
    amount: 12345678.9012345
);
```

> Note, the code above still uses the default configuration as [explained here](#configurations).

After that, you can request various results of the format as follows:

```dart
// normal form
print(fmf.output.nonSymbol); // 12,345,678.90
print(fmf.output.symbolOnLeft); // $ 12,345,678.90
print(fmf.output.symbolOnRight); // 12,345,678.90 $
print(fmf.output.fractionDigitsOnly); // 90
print(fmf.output.withoutFractionDigits); // 12,345,678

// compact form
print(fmf.output.compactNonSymbol) // 12.3M
print(fmf.output.compactSymbolOnLeft) // $ 12.3M
print(fmf.output.compactSymbolOnRight) // 12.3M $
```

If you will use the output format several times, I strongly recommend that you initialize a variable as in the following example:

```dart
MoneyFormatterOutput fo = fmf.output;
```

Or directly when initializing the `FlutterMoneyFormatter` instance as in the following example:

```dart
MoneyFormatterOutput fo = FlutterMoneyFormatter(
    amount: 12345678.9012345
).output;
```

So you can immediately take the value more easily as in the following example:

```dart
// normal form
print(fo.nonSymbol); // 12,345,678.90
print(fo.symbolOnLeft); // $ 12,345,678.90
print(fo.symbolOnRight); // 12,345,678.90 $
print(fo.fractionDigitsOnly); // 90
print(fo.withoutFractionDigits); // 12,345,678

// compact form
print(fo.compactNonSymbol) // 12.3M
print(fo.compactLeftSymbol) // $ 12.3M
print(fo.compactRightSymbol) // 12.3M $
```

See [demo section](#demo) to get more info.

## Configurations

To adjust the format to suit your needs, you can set it through the `settings` parameter:

```dart
FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
    amount: 12345678.9012345,
    settings: MoneyFormatterSettings(
        symbol: 'IDR',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 3,
        compactFormatType: CompactFormatType.sort
    )
)
```

Of course you are not required to initialize the entire configuration in the `settings` (`MoneyFormatterSettings`) parameter as in the example above. You can change one or more of the configurations above. This is because each configuration above is not mandatory and has a default value.

---

## Properties, Methods, and Functions

- ## `FlutterMoneyFormatter`

| Property Names    | Data Type                 | Descriptions |
| ----------------- | ------------------------- | ------------ |
| `amount`          | `double`                  | Amount number that will be formatted. |
| `settings`        | `MoneyFormatterSettings`  | [See here.](#MoneyFormatterSettings) |
| `output`          | `MoneyFormatterOutput`    | [See here.](#MoneyFormatterOutput) |
| `comparator`      | `MoneyFormatterCompare`   | [See here.](#MoneyFormatterCompare) |
| `copyWith`        | `FlutterMoneyFormatter`   | [see here](#duplicating-instance) |
| `fastCalc`        | `FlutterMoneyFormatter`   | [see here](#FastCalc) |


- ## `MoneyFormatterSettings`

| Configuration Property        | Data Type             | Default Value             | Description   |
| ----------------------------- | --------------------- | ------------------------- | ------------- |
| `symbol`                      | `String`              | `$` (Dollar Sign)         | The symbol that will be used on formatted output. |
| `thousandSeparator`           | `String`              | `,`                       | The character that will be used as thousand separator on formatted output. |
| `decimalSeparator`            | `String`              | `.`                       | The character that will be used as decimal separator on formatted output. |
| `fractionDigits`              | `int`                 | `2`                       | The fraction digits that will be used on formatted output. |
| `symbolAndNumberSeparator`    | `String`              | `' '` (Space)             | The character that will be used as separator between formatted number and currency symbol. |
| `compactFormatType`           | `CompactFormatType`   | `CompactFormatType.short` | [See here.](#CompactFormatType) |


- ## CompactFormatType

You can change the type of compact format like for million using `M` or `million`, or trillion using `T` or `trillion`. and so on. This type only supports two type as described below:

| Value                         | Description |
| ----------------------------- | ---------- |
| `CompactFormatType.short`     | Used to make the compact format displayed using short text. |
| `CompactFormatType.long`      | Used to make the compact format displayed using long text. |


- ## `MoneyFormatterOutput`

You can use formats that match your needs through properties found in the `MoneyFormatterOutput` instance.

| Property Names            | Data Type | Descriptions |
| ------------------------- | --------- | ------------ |
| `nonSymbol`               | `String`  | The results of the format of the currency are normal and without a currency symbol. Example: 12,345,678.90 |
| `symbolOnLeft`            | `String`  | The results of the normal currency format and with currency symbols are on the left. Example: $ 12,345,678.90 |
| `symbolOnRight`           | `String`  | The results of the normal currency format and with currency symbols are on the right. Example: 12,345,678.90 $ |
| `compactNonSymbol`        | `String`  | The results of the currency format are compact and without a currency symbol. Example: 12.3M |
| `compactSymbolOnLeft`     | `String`  | The results of the currency format are compact and with currency symbols on the left. example: $ 12.3M |
| `compactSymbolOnRight`    | `String`  | The results of the currency format are compact and with currency symbols on the right. example: 12.3M $ |
| `fractionDigitsOnly`      | `String`  | Only give the fraction value. Example: 90 |
| `withoutFractionDigits`   | `String`  | Give a value without fractions. Example: 12,345,678 |

- ## `MoneyFormatterCompare`

| Method                    | Parameter         | Descriptions |
| ------------------------- | ----------------- | ------------ |
| `isLowerThan`             | `amount`          | Check current instance-amount is lower than [amount] or not.  |
| `isGreaterThan`           | `amount`          | Check current instance-amount is greater than [amount] or not. |
| `isEqual`                 | `amount`          | Check current instance amount is equal than [amount] or not. |
| `isEqualOrLowerThan`      | `amount`          | Check current instance amount is equal or lower than [amount] or not. |
| `isEqualOrGreaterThan`    | `amount`          | Check current instance amount is equal or greater than [amount] or not. |

Example of using a comparator:

```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: 12345678.9012345);
double comparerValue = 5678.9012;

print(fmf.comparator.isEqual(comparerValue)); // false
print(fmf.comparator.isGreaterThan(comparerValue)); // true

```

---

## FastCalc

`fastCalc` is a function that can be used to perform various fast calculation processes that you might need. In implementing it, the `fastCalc` function gives the output of a` FlutterMoneyFormatter` instance so you can perform several calculation functions at once with the chaining method.

**Function**:

```dart
FlutterMoneyFormatter fastCalc({
    @required FastCalcType type, 
    @required double amount
})
```

**Implementation**:

```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: 12345.678);
fmf.fastCalc(type: FastCalcType.addition, amount: 1.111);
fmf.fastCalc(type: FastCalcType.substraction, amount: 2.222);

print(fmf.output.nonSymbol); // 12,345.68
```

Because it supports the chaining process, the example above can be shortened as follows:

```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: 12345.678)
    .fastCalc(type: FastCalcType.addition, amount: 1.111)
    .fastCalc(type: FastCalcType.substraction, amount: 2.222);

print(fmf.output.nonSymbol);  // 12,345.68
```

The `type` parameter used by the `fastCalc` function has the `FastCalcType` data type which is an enum. The following table is an explanation for the `FastCalcType` enum:

| Index | Name                      | Description |
| ----- | ------------------------- | ----------- |
| 0     | addition                  | Used to do addition calculations. |
| 1     | substraction              | Used to do substraction calculations. |
| 2     | multiplication            | Used to do multiplication calculations. |
| 3     | division                  | Used to do division calculations. |
| 4     | percentageAddition        | Used to do the addition calculations base on percentage. |
| 5     | percentageSubstraction    | Used to do the substraction calculations base on percentage. |


---

## Duplicating Instance

For some reasons, you may need to duplicate the `instance` and just need to change some configurations. To do that, you can use the `copyWith` method as below:

```dart
FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: 12345678.9012345);

print(fmf.output.symbolOnLeft); // $ 12,345,678.90
print(fmf.copyWith(symbol: 'IDR', symbolAndNumberSeparator: '-').output.symbolOnLeft); // IDR-12,345,678.90
```

---

## Demo

For more complete samples, you can grab it from the [example directory](https://github.com/fadhly-permata/flutter_money_formatter/tree/master/example).

## Our Other Package

See our [other packages here](https://pub.dartlang.org/flutter/packages?q=email%3Afadhly.permata%40gmail.com).

## Help Me

If you find some issues or bugs, please [report here.](https://github.com/fadhly-permata/flutter_money_formatter/issues/new?assignees=&labels=&template=bug_report.md&title=) You can also help in [requesting new features here.](https://github.com/fadhly-permata/flutter_money_formatter/issues/new?assignees=&labels=&template=feature_request.md&title=)

## ChangeLog

Are you curious about the changes that occur in each version? [See here for detailed informations](https://pub.dartlang.org/packages/flutter_money_formatter#-changelog-tab-).


## Contributors
| Name | Links |
| ---- | ----- |
| Fadhly Permata | [https://github.com/fadhly-permata](https://github.com/fadhly-permata) |
| Gerrel | [https://github.com/Gerrel](https://github.com/Gerrel) |
| ...you... | ...your link... |


## LICENSE
```text
Copyright (c) 2019, Fadhly Permata <fadhly.permata@gmail.com>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the 'FlutterMoneyFormatter' project.
```