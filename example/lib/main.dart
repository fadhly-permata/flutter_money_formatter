/// Copyright (c) 2019, Fadhly Permata.
/// email   : fadhly.permata@gmail.com
/// github  : https://github.com/fadhly-permata/flutter_money_formatter

import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle =
        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
    TextStyle subtitleStyle = TextStyle(fontSize: 20.0);

    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: 12345678.9012345);

    MoneyFormatterOutput fo = fmf.output;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Money Formatter Demo'),
          ),
          body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'FormattedNonSymbol :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fo.nonSymbol,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'FormattedLeftSymbol :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fo.symbolOnLeft,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'FormattedRightSymbol :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fo.symbolOnRight,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'FormattedWithoutDecimal :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fo.withoutFractionDigits,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'DecimalOnly :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fo.fractionDigitsOnly,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'FormattedNonSymbolCustom :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fmf
                              .copyWith(amount: 123.4567, fractionDigits: 4)
                              .output
                              .nonSymbol,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'FormattedLeftSymbolCustom :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fmf
                              .copyWith(
                                  symbol: 'IDR', symbolAndNumberSeparator: '-')
                              .output
                              .symbolOnLeft,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'CompactNonSymbol :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fmf
                              .copyWith(amount: 12345678987654321.9012345)
                              .output
                              .compactNonSymbol,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'CompactLongNonSymbol :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fmf
                              .copyWith(
                                  amount: 12345678987654321.9012345,
                                  compactFormatType: CompactFormatType.long)
                              .output
                              .compactNonSymbol,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'CompactLeftSymbol :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fmf
                              .copyWith(amount: 1234.56789)
                              .output
                              .compactSymbolOnLeft,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'CompactRightSymbol :',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          fmf
                              .copyWith(
                                  amount: 123456.7890,
                                  compactFormatType: CompactFormatType.short)
                              .output
                              .compactSymbolOnRight,
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Fast Calc',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          '${FlutterMoneyFormatter(amount: 12345.678).fastCalc(type: FastCalcType.addition, amount: 1.111).fastCalc(type: FastCalcType.substraction, amount: 2.222).output.nonSymbol}',
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Fast Calc',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          '${fmf.fastCalc(type: FastCalcType.addition, amount: 1234.567).fastCalc(type: FastCalcType.substraction, amount: 234.5678).output.nonSymbol}',
                          style: subtitleStyle,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Compare IsEqual (=)',
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          '${fmf.comparator.isEqual(5000)}',
                          style: subtitleStyle,
                        ),
                      )
                    ],
                  ),
                )),
          )),
    );
  }
}
