import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,home: game(),
    ));
}
class game extends StatefulWidget {
  const game({super.key});

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> with TickerProviderStateMixin{

   TabController? tabController;
   int cur_tab = 0;
   List str = ["one","two","three","four","five"];
   List<Widget> tab_class = [one(),two(),three(),four(),five()];
   List<Widget> tab_icon = [
       Icon(Icons.home),
       Icon(Icons.alarm_rounded),
       Icon(Icons.camera_alt_outlined),
       Icon(Icons.supervisor_account),
       Icon(Icons.photo_album_outlined),
   ];

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        length: str.length,
        vsync: this,
        initialIndex: cur_tab,
        animationDuration: Duration(seconds: 1),
    );
    //pageview type scroll
    tabController!.addListener(() {
        cur_tab = tabController!.index;
        setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:str.length-1,
        child: Scaffold(
            drawer: Drawer(
                child: Column(children: [
                    UserAccountsDrawerHeader(
                        currentAccountPicture: Icon(Icons.supervisor_account_outlined,size: 60),
                        accountName: Text("NAME : DEMO NAME"),
                        accountEmail: Text("E-MAIL : DemoEmail@gamil.com"),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: str.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(onTap: () {
                                  cur_tab = index;
                                  tabController!.animateTo(cur_tab);
                                  Navigator.pop(context);
                                  setState(() { });
                                }, title: Text("${str[index]}"),
                                leading: InkWell(onTap: () {
                                  print("delete");
                                   str.remove(str[index]);
                                   tab_class.remove(tab_class[index]);
                                   tab_icon.remove(tab_icon[index]);
                                  Navigator.pop(context);
                                  setState(() { });
                                },child: Icon(Icons.delete_outlined)),
                              ),
                            );
                          },
                      ),
                    )
                    // ListTile(onTap: () {
                    //     cur_tab = 0;
                    //     tabController!.animateTo(cur_tab);
                    //     Navigator.pop(context);
                    //     print("one");
                    //     setState(() { });
                    // }, title: Text("one"),
                    // ),
                    // ListTile(onTap: () {
                    //     cur_tab = 1;
                    //     tabController!.animateTo(cur_tab);
                    //     Navigator.pop(context);
                    //     print("two");
                    //     setState(() { });
                    // }, title: Text("two"),
                    // ),

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
                            // if(value==1){
                            //     print("one");
                            // }else if(value==2){
                            //     print("two");
                            // }else if(value==3){
                            //     print("three");
                            // }
                            cur_tab = value;
                            print(value);
                            tabController!.animateTo(cur_tab);
                            setState(() { });
                        },
                        itemBuilder: (context) => str.map((e) {
                            int ind = str.indexOf(e);
                            return PopupMenuItem(
                                value: ind,
                                onTap: () {
                                    cur_tab = ind;
                                    tabController!.animateTo(cur_tab);
                                    setState(() { });
                                },
                                child: Text("${str[ind]}")
                            );
                        },).toList(),
                    )
                ],
                bottom: TabBar(
                    onTap: (value) {
                      cur_tab = value;
                      setState(() { });
                    },
                    controller: tabController,
                    tabs: str.map((e) {
                        int ind = str.indexOf(e);
                        return Tab(
                            child: Text("${e}"),
                            icon: tab_icon[ind],
                        );
                    }).toList(),
                    // isScrollable: true,
                    // indicatorColor: Colors.teal,
                    // dividerColor: Colors.black,
                    // unselectedLabelColor: Colors.black,
                    // labelColor: Colors.indigoAccent,
                    // indicator: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(10),
                    // ),
                    // tabs: [
                    //     Tab(child: Text("    one      "),),
                    //     Tab(child: Text("    two      "),),
                    //     Tab(child: Text("    three    "),),
                    //     Tab(child: Text("    four     "),),
                    //     Tab(child: Text("    five     "),),
                    //     Tab(child: Text("    six      "),),
                    //     Tab(child: Text("    seven    "),),
                    // ]
                ),
            ),
            body: TabBarView(
                controller: tabController,
                children: str.map((e) {
                  int ind = str.indexOf(e);
                  return Container(
                    child: tab_class[ind],
                  );
                }).toList(),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cur_tab,
                onTap: (value) {
                    cur_tab = value;
                    tabController!.animateTo(cur_tab);
                    setState(() { });
                },
                items: str.map((e) {
                  int ind = str.indexOf(e);
                  return BottomNavigationBarItem(
                      icon: tab_icon[ind],
                      backgroundColor: Colors.black,
                      label: "$e",
                  );
                },).toList(),
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

