
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,home: cal(),
  ));
}
class cal extends StatefulWidget {
  const cal({super.key});

  @override
  State<cal> createState() => _calState();
}

class _calState extends State<cal> {

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();

  double _value = 40;
  double _value1 = 7.5;
  double _value2 = 5;
  double intr1 = 0;
  double year1 = 0;
  double total1=0;
  double total2=0;
  double total3=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMI CALCULATOR"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(children: [
          Expanded(
            child: Row(children: [
              Expanded(
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text("HOME LOAN AMOUNT :")
              )),
              Expanded(
                child: Container(
                  height: 50,
                  width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Row(children: [
                    Expanded(flex: 4,
                      child: TextField(
                        controller: t1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            // border : OutlineInputBorder(),
                            label: Text("${_value.toStringAsFixed(0)}"),
                            hintText: 'Type Here...',
                            // helperText: helpertext,
                            // hintStyle: GoogleFonts.openSans(fontSize: 18),
                            // suffixIcon: Icon(icons.,color: Colors.black,)
                        ),
                        onChanged: (value) {
                          _value = double.parse(value);
                          // int p=int.parse(t1.text);
                          print("_value2:${_value}");
                          intr1 = _value1/12/100;
                          year1 = _value2*12;
                          total1 = (_value * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                          total2 = _value*_value1/100* _value2;
                          total2 = total1*year1 - _value;
                          total3 = _value+total2;
                          setState(() { });
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,width: 80,color: Colors.blueGrey.shade100,
                        alignment: Alignment.center,
                        child: Icon(Icons.currency_rupee),
                      ),
                    ),
                  ],)
                ),
              ),
            ],),
          ),
          Expanded(
            child: SfSlider(
            min: 0,
            max: 200,
            value: _value.toDouble(),
            interval: 20,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
              edgeLabelPlacement: EdgeLabelPlacement.auto,
            numberFormat: NumberFormat("L"),
            minorTicksPerInterval: 1,
            onChanged: (dynamic value){
              setState(() {
                _value = value.toInt();
                // String s1=_value.toString()+"00000";
                t1.text = _value.toString()+",00,000";
                // t1.text = s1;
                print("_value=${_value}");
                print("t1.text=${t1.text}");
                intr1 = _value1/12/100;
                year1 = _value2*12;
                // total1 = (_value * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                total1 = (_value * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                total2 = _value*_value1/100* _value2;
                total2 = total1*year1 - _value;
                total3 = _value+total2;
                // _value = value;
              });
            },
        ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text("INTEREST RATE :")
                  )),
              Expanded(
                child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Row(children: [
                      Expanded(flex: 4,
                        child: TextField(
                          controller: t2,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // border : OutlineInputBorder(),
                            label: Text("${_value1.toStringAsFixed(1)}"),
                            hintText: 'Type Here...',
                            // helperText: helpertext,
                            // hintStyle: GoogleFonts.openSans(fontSize: 18),
                            // suffixIcon: Icon(icons.,color: Colors.black,)
                          ),
                          onChanged: (value) {
                            _value1 = double.parse(value);
                             // double r=int.parse(t2.text)/12/100;
                            print("_value2:${_value1}");
                            // print("d1:${t2.text}");
                            // _value1 = value;
                            intr1 = _value1/12/100;
                            year1 = _value2*12;
                            total1 = (_value * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                            total2 = _value*_value1/100* _value2;
                            total2 = total1*year1 - _value;
                            total3 = _value+total2;
                            setState(() { });
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,width: 80,color: Colors.blueGrey.shade100,
                          alignment: Alignment.center,
                          child: Icon(Icons.percent),
                        ),
                      ),
                    ],)
                ),
              ),
            ],),
          ),
          Expanded(
            child: SfSlider(
              min: 5,
              max: 20,
              value: _value1.toDouble(),
              interval: 2.5,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              // minorTicksPerInterval: 2,
              onChanged: (dynamic value){
                setState(() {
                  _value1 = value.toInt();
                  t2.text = _value1.toString();
                  // double r=int.parse(t2.text)/12/100;
                  print("_value=${_value1}");
                  print("t1.text=${t2.text}");
                  intr1 = _value1/12/100;
                  year1 = _value2*12;
                  total1 = (_value * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                  total2 = _value*_value1/100* _value2;
                  total2 = total1*year1 - _value;
                  total3 = _value+total2;
                  // _value = value;
                });
              },
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text("LOAN TENURE :")
                  )),
              Expanded(
                child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Row(children: [
                      Expanded(flex: 4,
                        child: Container(
                          height: 50,width: 150,color: Colors.white,
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            controller: t3,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              // border : OutlineInputBorder(),
                              label: Text("${_value2.toStringAsFixed(0)}"),
                              hintText: 'Type Here...',
                              // helperText: helpertext,
                              // hintStyle: GoogleFonts.openSans(fontSize: 18),
                              // suffixIcon: Icon(icons.,color: Colors.black,)
                            ),
                            onChanged: (value) {
                              _value2 = double.parse(value);
                              // int n=int.parse(t3.text)*12;
                              print("_value2:${_value2}");
                              print("d1:${t3.text}");
                              intr1 = _value1/12/100;
                              year1 = _value2*12;
                              total1 = (_value * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                              //totl_intr = amo*intr/100 * year;
                              total2 = total1*year1 - _value;
                              total3 = _value+total2;
                              setState(() { });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,width: 80,color: Colors.blueGrey.shade100,
                          alignment: Alignment.center,
                          child: Icon(Icons.calendar_today),
                        ),
                      ),
                    ],),
                ),
              ),
            ],),
          ),
          Expanded(
            child: SfSlider(
              min: 0,
              max: 30,
              value: _value2,
              interval: 5,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              // minorTicksPerInterval: 2,
              onChanged: (dynamic value){
                setState(() {
                  _value2 = value.toInt();
                  t3.text = _value2.toString();
                  // int n=int.parse(t3.text)*12;
                  print("_value=${_value2}");
                  print("t3.text=${t3.text}");
                  intr1 = _value1/12/100;
                  year1 = _value2*12;
                  total1 = (_value * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                  //totl_intr = amo*intr/100 * year;
                  total2 = total1*year1 - _value;
                  total3 = _value+total2;
                });
              },
            ),
          ),
          Divider(color: Colors.black,height: 30,),
          Text("CALCULATION"),
          Divider(color: Colors.black,height: 30,),
          Expanded(
              child: Container(
                 height: double.infinity,
                width: double.infinity,
                color: Colors.amberAccent,
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(10),
    // ${(p*r*pow((1+r),n))/(p*r*pow((1+r),n)-1)}
                child: Text("LOAN EMI : ${total1.toStringAsFixed(5)}"),
              )
          ),
          Expanded(
              child: Container(
                 height: double.infinity,
                width: double.infinity,
                color: Colors.brown,
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(10),
                child: Text("TOTAL INTEREST PAYABLE : ${total2.toInt()}"),
              )
          ),
          Expanded(
              child: Container(
                 height: double.infinity,
                width: double.infinity,
                color: Colors.deepPurpleAccent,
                padding: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(10),
                child: Text("       TOTAL PAYMENT \n (PRINCIPAL + INTEREST) : ${total3.toStringAsFixed(5)}"),
              )
          ),
       ],
      ),
    );
  }
}

