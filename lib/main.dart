import 'package:flutter/material.dart';

import 'custom_blur_drop_down.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(width: double.infinity,height: 70,color: Colors.redAccent,margin: const EdgeInsets.symmetric(vertical: 8),),
              Container(width: double.infinity,height: 70,color: Colors.green,margin: const EdgeInsets.symmetric(vertical: 8),),
              const CustomBlurDropDown(),
              Container(width: double.infinity,height: 70,color: Colors.blueGrey,margin: const EdgeInsets.symmetric(vertical: 8),),
              const CustomBlurDropDown(),
              Container(width: double.infinity,height: 70,color: Colors.purple,margin: const EdgeInsets.symmetric(vertical: 8),),
              const CustomBlurDropDown(),
              Container(width: double.infinity,height: 70,color: Colors.grey,margin: const EdgeInsets.symmetric(vertical: 8),),
              Container(width: double.infinity,height: 70,color: Colors.lightGreenAccent,margin: const EdgeInsets.symmetric(vertical: 8),),
              Container(width: double.infinity,height: 70,color: Colors.orange,margin: const EdgeInsets.symmetric(vertical: 8),),
              Container(width: double.infinity,height: 70,color: Colors.brown,margin: const EdgeInsets.symmetric(vertical: 8),),
              Container(width: double.infinity,height: 70,color: Colors.indigoAccent,margin: const EdgeInsets.symmetric(vertical: 8),),
              Container(width: double.infinity,height: 70,color: Colors.yellow,margin: const EdgeInsets.symmetric(vertical: 8),),
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
