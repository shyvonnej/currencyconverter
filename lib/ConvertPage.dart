// ignore_for_file: file_names, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const ConvertPage());

class ConvertPage extends StatefulWidget {
  const ConvertPage({ Key? key }) : super(key: key);

  @override
  _ConvertPageState createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  String fromCurrency = "USD", toCurrency = "USD"; 
  double rate = 0.0, currency = 0.0, from = 0.0;
  List<String> fromList = [
  "USD", 
  "SGD", 
  "MYR",
  "JPY",
  "EUR",
];
  List<String> toList = [
  "USD", 
  "SGD", 
  "MYR",
  "JPY",
  "EUR - Euro",
  ];
  TextEditingController fromCur = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Currency Converter'),
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
          Image.asset('assets/images/money.png', scale: 9),
          const SizedBox(height: 10),
          const Text("Convert From:",
          style: TextStyle(fontSize: 20, fontFamily: 'Cambria', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
          DropdownButton(
          itemHeight: 50, value: fromCurrency,
          onChanged: (newValue) { setState(() {
          fromCurrency = newValue.toString();});
          },
          items: fromList.map((fromCurrency) {
          return DropdownMenuItem(
          child: Text(fromCurrency,),
          value: fromCurrency,);
          }).toList(),),

          
          TextField(controller: fromCur,
            decoration: InputDecoration(hintText: 'enter value.',
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0))),
            keyboardType: const TextInputType.numberWithOptions(),),

          const SizedBox(height: 20),
          const Text("Convert To:",
            style: TextStyle(fontSize: 20, fontFamily: 'Cambria', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
          DropdownButton(
            itemHeight: 50, value: toCurrency,
            onChanged: (newValue) { setState(() {
            toCurrency = newValue.toString();});
            },
            items: fromList.map((toCurrency) {
            return DropdownMenuItem(
            child: Text(toCurrency,),
            value: toCurrency,);
            }).toList(),
            ),

            const SizedBox(height: 5),
            Text(currency.toStringAsFixed(2), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            const SizedBox(height: 5),
            ElevatedButton(onPressed: _loadConverter, child: const Text("CONVERT")),
          ]
          ),
          )
        )
      ));
  }

  Future<void> _loadConverter() async {
    var apiid = "fe3ea780-3c38-11ec-87c2-a3f07e097866";
    var url = Uri.parse('https://freecurrencyapi.net/api/v2/latest?$toCurrency=fe3ea780-3c38-11ec-87c2-a3f07e097866&$fromCurrency');
    var response = await http.get(url);
    var rescode = response.statusCode;
    if (rescode == 200) {
      var jsonData = response.body;
      var parsedJson = json.decode(jsonData); 
      setState(() {
      rate = parsedJson['data'][toCurrency];
      from = double.parse(fromCur.text);
      currency = from * rate; 
      }); 
    }
  }
}