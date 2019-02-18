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
    TextStyle titleStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
    TextStyle subtitleStyle = TextStyle(fontSize: 20.0);

    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
      amount: 12345678.9012345
    );

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
                    title: Text('FormattedNonSymbol :', style: titleStyle,),
                    subtitle: Text(fmf.formattedNonSymbol, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('FormattedLeftSymbol :', style: titleStyle,),
                    subtitle: Text(fmf.formattedLeftSymbol, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('FormattedRightSymbol :', style: titleStyle,),
                    subtitle: Text(fmf.formattedRightSymbol, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('FormattedWithoutDecimal :', style: titleStyle,),
                    subtitle: Text(fmf.withoutDecimal, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('DecimalOnly :', style: titleStyle,),
                    subtitle: Text(fmf.fractionDigitsOnly, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('FormattedNonSymbolCustom :', style: titleStyle,),
                    subtitle: Text(fmf.copyWith(amount: 123.4567, fractionDigits: 2).formattedNonSymbol, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('FormattedLeftSymbolCustom :', style: titleStyle,),
                    subtitle: Text(fmf.copyWith(symbol: 'IDR', symbolAndNumberSeparator: '-').formattedLeftSymbol, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('CompactNonSymbol :', style: titleStyle,),
                    subtitle: Text(fmf.copyWith(amount: 12345678987654321.9012345).compactNonSymbol, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('CompactLongNonSymbol :', style: titleStyle,),
                    subtitle: Text(fmf.copyWith(amount: 12345678987654321.9012345, compactFormatType: CompactFormatType.long).compactNonSymbol, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('CompactLeftSymbol :', style: titleStyle,),
                    subtitle: Text(fmf.copyWith(amount: 1234.56789).compactLeftSymbol, style: subtitleStyle,),
                  ),
                  ListTile(
                    title: Text('CompactRightSymbol :', style: titleStyle,),
                    subtitle: Text(fmf.copyWith(amount: 123456.7890, compactFormatType: CompactFormatType.sort).compactRightSymbol, style: subtitleStyle,),
                  )
                ],
              ),
            )
          ),
        )
      ),
    );
  }
}