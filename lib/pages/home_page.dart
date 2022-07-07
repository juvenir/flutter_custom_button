import 'dart:math';

import 'package:custom_button/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> valueRandom = ValueNotifier<int>(0);

  random() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      valueRandom.value = Random().nextInt(1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Custom Button'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: valueRandom,
            builder: (_, value, __) => Text(
              'O valor é $value',
              style: TextStyle(fontSize: 26),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CustomButtonWidget(
              //disable: true,
              onPressed: () => random(),
              title: 'Aperte',
              titleSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
