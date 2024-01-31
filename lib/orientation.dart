import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    ));
}
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  bool t=true;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        print(orientation);
          if(Orientation.portrait==orientation)
          {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
              t=true;
          }
          else
          {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
              SystemUiOverlay.bottom
            ]);  // to only hide the status bar
              t=false;
          }
          return Scaffold(
            appBar: (t)?AppBar(backgroundColor: Colors.pink,title: Text("ORIENTATION"),):null,
            body: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (t)?3:5,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.brown,
                  );
                },),
          );
    },);
  }
}
