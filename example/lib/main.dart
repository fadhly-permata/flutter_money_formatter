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
      value: 12345678.9012345
    )
    ..symbol = 'Rp'
    ..spaceBetweenSymbolAndNumber = true
    ..decimalLength = 4;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Money Formatter Demo'),
        ),
        body: Container(
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
                subtitle: Text(fmf.decimalOnly, style: subtitleStyle,),
              ),
              ListTile(
                title: Text('FormattedNonSymbolCustom :', style: titleStyle,),
                subtitle: Text(fmf.copyWith(value: 123.4567, decimalLength: 2).formattedNonSymbol, style: subtitleStyle,),
              ),
              ListTile(
                title: Text('FormattedLeftSymbolCustom :', style: titleStyle,),
                subtitle: Text(fmf.copyWith(symbol: 'IDR', spaceBetweenSymbolAndNumber: false).formattedLeftSymbol, style: subtitleStyle,),
              )
            ],
          ),
        )
      ),
    );
  }
}