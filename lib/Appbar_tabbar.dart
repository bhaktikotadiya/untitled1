import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  // late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _tabController = TabController(length: tabs.length, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          drawer: Drawer(
            child: Column(children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: Icon(Icons.supervisor_account_outlined,size: 40),
                  accountName: Text("DEMO NAME"),
                  accountEmail: Text("DemoEmail@gamil.com"),
              ),
              ListTile(onTap: () {
                  Navigator.pop(context);
                  print("one");
                }, title: Text("one"),
              ),
              ListTile(onTap: () {
                  Navigator.pop(context);
                  print("two");
                }, title: Text("two"),
              ),
              ListTile(onTap: () {
                  Navigator.pop(context);
                  print("three");
                }, title: Text("three"),
              )
            ]),
          ),
          appBar: AppBar(
            title: Text("DEMO"),
            actions: [
              IconButton(onPressed: () {
                print("hello");
              }, icon: Icon(Icons.search)),
              PopupMenuButton(
                onCanceled: () {
                  print("testing");
                },
                onSelected: (value) {
                  if(value==1){
                    print("one");
                  }else if(value==2){
                    print("two");
                  }else if(value==3){
                    print("three");
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(value: 1,child: Text("one")),
                  PopupMenuItem(value: 2,child: Text("two")),
                  PopupMenuItem(value: 3,child: Text("three")),
                ],
              )
            ],
            bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.teal,
                dividerColor: Colors.black,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.indigoAccent,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs: [
                  Tab(child: Text("    one      "),),
                  Tab(child: Text("    two      "),),
                  Tab(child: Text("    three    "),),
                  Tab(child: Text("    four     "),),
                  Tab(child: Text("    five     "),),
                  Tab(child: Text("    six      "),),
                  Tab(child: Text("    seven    "),),
                ]),
          ),
          body: TabBarView(
              children: [one(),two(),three(),four(),five(),six(),seven()],
          ),
        ),
    );
  }
}


class one extends StatefulWidget {
  const one({super.key});

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.indigo,
      alignment: Alignment.center,
      child: Text("one",style: TextStyle(fontSize: 30)),
    );
  }
}

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.brown,
      alignment: Alignment.center,
      child: Text("two",style: TextStyle(fontSize: 30)),
    );
  }
}

class three extends StatefulWidget {
  const three({super.key});

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.teal,
      alignment: Alignment.center,
      child: Text("three",style: TextStyle(fontSize: 30)),
    );
  }
}

class four extends StatefulWidget {
  const four({super.key});

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightGreen,
      alignment: Alignment.center,
      child: Text("four",style: TextStyle(fontSize: 30)),
    );
  }
}

class five extends StatefulWidget {
  const five({super.key});

  @override
  State<five> createState() => _fiveState();
}

class _fiveState extends State<five> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blueAccent,
      alignment: Alignment.center,
      child: Text("five",style: TextStyle(fontSize: 30)),
    );
  }
}

class six extends StatefulWidget {
  const six({super.key});

  @override
  State<six> createState() => _sixState();
}

class _sixState extends State<six> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amberAccent,
      alignment: Alignment.center,
      child: Text("six",style: TextStyle(fontSize: 30)),
    );
  }
}

class seven extends StatefulWidget {
  const seven({super.key});

  @override
  State<seven> createState() => _sevenState();
}

class _sevenState extends State<seven> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepPurpleAccent,
      alignment: Alignment.center,
      child: Text("seven",style: TextStyle(fontSize: 30)),
    );
  }
}
