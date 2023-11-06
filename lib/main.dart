import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dollarTextField = TextEditingController();
  double _dollars = 0;
  double _tipAmount = 0;
  double _tipPercentage = 0.2;
  String _total = "";
  bool _outstandingService = false;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("Currency Converter"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dollars"),
            TextField(controller: dollarTextField),


            //ChatGPT helped me with aligning text / row parent widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Outstanding Service'),
                Switch(
                  value: _outstandingService,
                  onChanged: (bool newValue) {
                    setState(() {
                      _outstandingService = newValue;
                    });
                  },
                ),
              ],
            ),


            ElevatedButton(
              onPressed: () {
                setState(() {

                  _dollars = double.parse(dollarTextField.text);

                  _tipAmount = _dollars * _tipPercentage;
                  double totalAmount = _dollars + _tipAmount;
                  _total = totalAmount.toStringAsFixed(2);
                });
              },
              child: Text("Calculate Tip"),
            ),
            Text('Total amount: $_total'),



          ],
        ),
      ),
    );
  }
}
