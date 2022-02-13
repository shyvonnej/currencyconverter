import 'dart:async';
import 'package:flutter/material.dart'; 
import 'ConvertPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
      primarySwatch: Colors.indigo,
      ),
      home: const SplashPage());
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (content) => const ConvertPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Image.asset('assets/images/cc.png', scale: 2),
                const SizedBox(height: 20),
                const Text("ONLINE",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Cambria', color: Colors.blueGrey,)),
                const Text("CURRENCY CONVERTER",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Cambria', color: Colors.blueGrey,)), 
                const SizedBox(height: 100),
                const Text("Version 1.0.0",
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, fontFamily: 'New Times Roman',)),
                const Text("Created by ShyvonneJ",
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic, fontFamily: 'New Times Roman',)),
              ],
              ),
            ),
          );
  }
}