import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: one(),
    ));
}
class one extends StatefulWidget {
  const one({super.key});
  // static SharedPreferences ?prefs;

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {

  List Names=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"];
  List<bool> names=List.filled(20, false);
  // int item=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SLIDABLE"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SlidableAutoCloseBehavior(
          child: ListView.builder(
        itemCount: Names.length,
        itemBuilder: (context, index) {
          return Slidable(
            enabled: true,
            key: UniqueKey(),
            closeOnScroll: true,
            startActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(autoClose: true,
                    label: "UPDATE",
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.black,
                    onPressed: (context) {
                      print("UPDATE");
                      setState(() { });
                    },
                  ),
                  SlidableAction(autoClose: false,
                    label: "DELETE",
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                    onPressed: (context) {
                      print("DELETE");
                      Names.remove(Names[index]);
                      setState(() { });
                    },
                  )
                ]),
            endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(autoClose: true,
                    label: "SHARE",
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.black,
                    onPressed: (context) {
                      print("SHARE");
                      setState(() { });
                    },
                  ),
                  SlidableAction(autoClose: false,
                    label: "SAVE",
                    backgroundColor: Colors.cyan,
                    foregroundColor: Colors.black87,
                    onPressed: (context) {
                      print("SAVE");
                      setState(() { });
                    },
                  )
                ]),
            child: Card(
              child: ListTile(
                title: Text("${Names[index]}"),
              ),
            ),
          );
        },)
      ),
    );
  }
}
