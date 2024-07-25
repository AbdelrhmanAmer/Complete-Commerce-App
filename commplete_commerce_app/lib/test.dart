import 'package:commplete_commerce_app/core/functions/check_internet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var result;

  intialData() async{
    result = await checkInternet();
    print(result);
  }

  @override
  void initState() {
    intialData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Test"),),
        body: Container(),
      ),
    );
  }
}
