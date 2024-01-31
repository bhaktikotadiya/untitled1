import 'package:untitled1/picture_match/config.dart';
import 'package:untitled1/picture_match/index.dart';
import 'package:untitled1/picture_match/play.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  ));
}
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  List<dynamic> t = [-0.1,0.1,0.2,0.2,-0.1,-0.1,-0.2,0.1,-0.1,-0.1,0.1,0.2];
  List name1=[];
  List<bool> temp4=List.filled(10, false);
  List l=[];
  int time=0;
  int level_no=0;
  bool temp=false;
  // bool t1=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pref();
    // l.add(time);
    // for(int i=0;i<l.length;i++)
    // {
    //   print("time store : ${l[i]}");
    // }
  }

  get_pref() async {
    first.prefs = await SharedPreferences.getInstance();
    level_no = first.prefs!.getInt("levelno") ?? 0;
    print("LevelNO:$level_no");
    // t1=true;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SELECT LEVEL"),
        backgroundColor: Colors.teal,
        actions: [
          Container(alignment: Alignment.center,child: Text("NO TIME LIMITS",)),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.volume_up_sharp)),
          IconButton(onPressed: () {
            // print("your item is edit");
            showDialog(barrierColor: Colors.transparent,barrierDismissible: true,context: context, builder: (context)
            {
              return AlertDialog(alignment: Alignment.topRight,backgroundColor: Colors.white70,
                actions: [
                  TextButton(style: ButtonStyle(alignment: Alignment.topLeft),onPressed: () {
                    print("your item is edit");
                  },child: Text("SHARE",style: TextStyle(fontSize: 20,color: Colors.black),),),
                  TextButton(style: ButtonStyle(alignment: Alignment.topRight),onPressed: () {
                    print("your item is edit");
                  },child: Text("\nMORE GAMES",style: TextStyle(fontSize: 20,color: Colors.black),),),
                  TextButton(style: ButtonStyle(alignment: Alignment.topRight),onPressed: () {
                    print("your item is edit");
                  },child: Text("\nPRIVACY POLICY",style: TextStyle(fontSize: 20,color: Colors.black),),),
                ],scrollable: true,);
            },);
          }, icon:  Icon(Icons.more_vert_sharp))
        ],
      ),
      body: Column(
        children: [
          Expanded(flex: 6,
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.teal.shade50,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                // color: Colors.red,
                margin: EdgeInsets.fromLTRB(20, 80, 20, 100),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing:  5,
                  ),
                  itemCount: record.l.length,
                  itemBuilder: (context, index) {
                    return Transform(
                      transform: Matrix4.rotationZ(t[index]),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        // height: 80,
                        // width: 80,
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87,width: 2),
                          boxShadow: [BoxShadow(
                            color: Colors.black,
                            offset: const Offset(5.0, 5.0,),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),],
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("${record.l[index]}")),
                          // borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, myindex)
                    {
                      return Container(
                          margin: EdgeInsets.fromLTRB(120, 30, 20, 40),
                          height: double.infinity,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(style: BorderStyle.solid,color: Colors.teal,width: 4),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Expanded(flex: 1,
                                child: Row(children: [
                                  Expanded(flex: 3,
                                    child: Container(
                                      // color: Colors.teal,
                                      alignment: Alignment.center,
                                      height: double.infinity,
                                      width: double.infinity,
                                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Text("MATCH ${myindex+1}",style: TextStyle(fontSize: 20,color: Colors.teal)),
                                    ),
                                  ),
                                  // Expanded(
                                  //     child: IconButton(onPressed: () {
                                  //
                                  //     }, icon: Icon(Icons.question_mark_sharp))
                                  // ),
                                  Expanded(flex: 1,child:
                                      Container(
                                        alignment: Alignment.center,
                                        height: double.infinity,
                                        width: double.infinity,
                                        margin: EdgeInsets.fromLTRB(15, 20, 5, 15),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.teal,width: 2),
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                        child: IconButton(onPressed: () {
                                          showDialog(context: context, builder: (context) {
                                            return AlertDialog(
                                              title: Container(color: Colors.teal,height: 50,alignment: Alignment.center,
                                                child: Text("How to play match ${myindex+1}",style: TextStyle(color: Colors.white)),),
                                              content: Wrap(children: [
                                                  Text("Tap on a square to turn it over and see the picture it hides.\n"),
                                                  Text("Tap on another square to turn it over too.\n"),
                                                  Text("if the picture match,they'll stay fatching up,if not,both will turn over again.\n"),
                                                  Text("Find all couples"),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(style: ButtonStyle(
                                                    // alignment: Alignment.bottomRight,
                                                    backgroundColor: MaterialStatePropertyAll(Colors.teal),
                                                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                                                ),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                }, child: Text("OK"))
                                              ],
                                            );
                                          },);
                                        }, icon: Icon(Icons.question_mark_sharp))
                                      ),
                                  ),
                                ],),
                              ),
                               Divider(
                                  color: Colors.teal,
                                  thickness: 3,
                                  height: 1,
                                ),
                               Expanded(flex: 6,
                                 child: Container(
                                   height: double.infinity,
                                   width: double.infinity,
                                   // margin: EdgeInsets.all(10),
                                   child: ListView.builder(
                                     itemCount: 10,
                                     itemBuilder: (context, index) {
                                       int l_no = (myindex * 10) + index + 1;
                                       int l_no1 = (myindex * 10) + index;
                                       return (l_no1 <= level_no)?InkWell(
                                         onTap: () {
                                             Navigator.push(context, MaterialPageRoute(builder: (context) {
                                               if(l_no1<level_no)
                                               {
                                                 return game(l_no1);
                                               }
                                               else
                                               {
                                                 return game();
                                               }
                                             },));
                                          // if((myindex*10)+index+1==current)
                                          // {
                                          //     l.add(widget.a1);
                                          // }
                                           // first.prefs!.setInt("save", widget.save!);
                                           // print("save=${widget.save!}");
                                         },
                                         child: Container(
                                               color: Colors.teal,
                                               height: 42,
                                               width: double.infinity,
                                               alignment: Alignment.center,
                                               margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                               child:  Wrap(
                                                 children: [
                                                   (l_no1<level_no) ? Text("LEVEL ${l_no} - ${first.prefs!.getInt("level_time${l_no1}") ?? ""}",style: TextStyle(fontSize: 20,color: Colors.white))
                                                   :Text("LEVEL ${l_no}",style: TextStyle(fontSize: 20,color: Colors.white)),
                                                   (l_no1<level_no)?Text(" s",style: TextStyle(fontSize: 20,color: Colors.white)):Text(""),
                                                 ],
                                                )
                                               ),
                                        ):Container(
                                         color: Colors.teal.shade300,
                                         height: 42,
                                         width: double.infinity,
                                         alignment: Alignment.center,
                                         margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                         child: Text("LEVEL ${l_no}",style: TextStyle(fontSize: 20,color: Colors.white)),
                                       );
                                     },
                                   ),
                                 ),
                               ),
                            ],
                          ),
                      );
                    },
                  ),
                ),
              ],),
            ],),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.teal,
            ),
          ),
        ],
      )
    );
  }
}
