# money_formatter

> `MoneyFormatter` is a [Flutter](https://flutter.io) package to formatting various types of currencies according to the characteristics you like, without having to be tied to any localization.
>
> [![latest version](https://img.shields.io/pub/v/money_formatter.svg?style=plastic&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAQAAAC1QeVaAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQfjAg8HMDMbfsHaAAABSUlEQVQY0y2LsUvUYRyHn+/7fe2uVMIz4hcnin+BFCrdZq1BQ1MN4VJxY7MoRLg7OGQ0NPkfiIOYBbYpiUO0VSQ15UFxHHf8fu/7cTif9XkeEz/54TO5qX4xtmJP8mZ8vR+vpt/q4gU3QitP3Iwr9fdhyerhPjZ7cBZH9Rf75ldSp11tXKsnZYHlEDvrt9dO4/dkjwjF6tde43M5GjGBlGoxrNtainGOsef9RqsMIyfUEZg8V1pVslf+crL3dup6EW6ZOMMRGEbmnmqh07bpkLEB89xhgMFQo8dRy4AZMGAe+EINkAEp2B6QhvHw7nOJ+9Fuq2guNsvKDaNiBvGLkUTQuf8Pd3e6U+MLKnGAkmkyf8xN/+zAeuFBKt+FZ6qGmux+tP3xw0TFGz7ZoffRlqQkSSolvRCK8Skmz9lpE3lIl0CiUfUix34BalOOAMgIffsAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTktMDItMTVUMDc6NDg6NTEtMDU6MDCMNC56AAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE5LTAyLTE1VDA3OjQ4OjUxLTA1OjAw/WmWxgAAAABJRU5ErkJggg==)](https://pub.dartlang.org/packages/money_formatter)
> [![last commit](https://img.shields.io/github/last-commit/wiseminds/flutter_money_formatter.svg?logo=github&style=plastic)](https://github.com/wiseminds/flutter_money_formatter) 

#### Dependencies :
[![intl](https://img.shields.io/pub/vpre/intl.svg?label=intl&colorA=gray&colorB=green&style=plastic)](https://pub.dartlang.org/packages/intl)


### Screenshot
![screenshot](https://github.com/wiseminds/flutter_money_formatter/blob/dev/doc/fmf.gif)

---


## Install

For complete steps in installing `MoneyFormatter` you can see in the [**Installation Guide**](https://pub.dartlang.org/packages/flutter_money_formatter#-installing-tab-).


## Usage

Import the library

```dart
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
```


## Getting Started

To be able to format your `double` value into the various formats you want, you first need to create a `MoneyFormatter` instance like the following:


```dart
MoneyFormatter fmf = MoneyFormatter(
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

Or directly when initializing the `MoneyFormatter` instance as in the following example:

```dart
MoneyFormatterOutput fo = MoneyFormatter(
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
MoneyFormatter fmf = new MoneyFormatter(
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

- ## `MoneyFormatter`

| Property Names    | Data Type                 | Descriptions |
| ----------------- | ------------------------- | ------------ |
| `amount`          | `double`                  | Amount number that will be formatted. |
| `settings`        | `MoneyFormatterSettings`  | [See here.](#MoneyFormatterSettings) |
| `output`          | `MoneyFormatterOutput`    | [See here.](#MoneyFormatterOutput) |
| `comparator`      | `MoneyFormatterCompare`   | [See here.](#MoneyFormatterCompare) |
| `copyWith`        | `MoneyFormatter`   | [see here](#duplicating-instance) |
| `fastCalc`        | `MoneyFormatter`   | [see here](#FastCalc) |


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
MoneyFormatter fmf = MoneyFormatter(amount: 12345678.9012345);
double comparerValue = 5678.9012;

print(fmf.comparator.isEqual(comparerValue)); // false
print(fmf.comparator.isGreaterThan(comparerValue)); // true

```

---

## FastCalc

`fastCalc` is a function that can be used to perform various fast calculation processes that you might need. In implementing it, the `fastCalc` function gives the output of a` MoneyFormatter` instance so you can perform several calculation functions at once with the chaining method.

**Function**:

```dart
MoneyFormatter fastCalc({
    @required FastCalcType type, 
    @required double amount
})
```

**Implementation**:

```dart
MoneyFormatter fmf = MoneyFormatter(amount: 12345.678);
fmf.fastCalc(type: FastCalcType.addition, amount: 1.111);
fmf.fastCalc(type: FastCalcType.substraction, amount: 2.222);

print(fmf.output.nonSymbol); // 12,345.68
```

Because it supports the chaining process, the example above can be shortened as follows:

```dart
MoneyFormatter fmf = MoneyFormatter(amount: 12345.678)
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
MoneyFormatter fmf = MoneyFormatter(amount: 12345678.9012345);

print(fmf.output.symbolOnLeft); // $ 12,345,678.90
print(fmf.copyWith(symbol: 'IDR', symbolAndNumberSeparator: '-').output.symbolOnLeft); // IDR-12,345,678.90
```

---

## Demo

For more complete samples, you can grab it from the [example directory](https://github.com/wiseminds/flutter_money_formatter/tree/master/example).

## Our Other Package

See our [other packages here](https://pub.dartlang.org/flutter/packages?q=email%3Afadhly.permata%40gmail.com).

## Help Me

If you find some issues or bugs, please [report here.](https://github.com/wiseminds/flutter_money_formatter/issues/new?assignees=&labels=&template=bug_report.md&title=) You can also help in [requesting new features here.](https://github.com/wiseminds/flutter_money_formatter/issues/new?assignees=&labels=&template=feature_request.md&title=)

## ChangeLog

Are you curious about the changes that occur in each version? [See here for detailed informations](https://pub.dartlang.org/packages/money_formatter#-changelog-tab-).


## Contributors
| Name | Links |
| ---- | ----- |
| Fadhly Permata | [https://github.com/wiseminds](https://github.com/wiseminds) |
| Gerrel | [https://github.com/Gerrel](https://github.com/Gerrel) |
| Wisdom Ekeh | [https://github.com/wiseminds](https://github.com/wiseminds) |
 
 