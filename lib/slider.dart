import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,home: one(),
  ));
}
class one extends StatefulWidget {
  const one({super.key});

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  double _value = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter Slider'),
      ),
      body: SfSlider(
        min: 0.0,
        max: 100.0,
        value: _value,
        interval: 20,
        showTicks: true,
        showLabels: true,
        enableTooltip: true,
        minorTicksPerInterval: 1,
        onChanged: (dynamic value){
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }
}


