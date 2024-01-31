import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: two(),
    ));
}
class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SLIDABLE"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            child: Card(
              child: ListTile(
                title: Text("${index}"),
              ),
            )
          );
        },),
    );
  }
}
