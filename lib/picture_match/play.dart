import 'dart:convert';

import 'package:untitled1/picture_match/config.dart';
import 'package:untitled1/picture_match/index.dart';
import 'package:untitled1/picture_match/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    ));
}
class game extends StatefulWidget {
  // const game(int i, {super.key});
  int? lno;
  game([this.lno]);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {

  List pic=[];
  List pic1=[];
  int level_no = 0;
  int curr=0;
  // List match = List.filled(12, true);
  int inc_level=1;
  List<bool> temp=[];
  double a=5;
  double a1=0;
  int x=1;
  int save=0;
  int pos1=0,pos2=0;
  double pos=0;
  //google:how to get all images in flutter

  Future _initImages() async {
    // >> To get paths you need these 2 lines
    //visibility and replacement
    //google:how to get all images in flutter
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('myassets/images/match_puzzle/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {

      pic = imagePaths;
      pic.shuffle();
      for(int i=0;i<6;i++)
      {
        pic1.add(pic[i]);
        pic1.add(pic[i]);
      }
      pic1.shuffle();
      // print(pic);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("LNO:${widget.lno}");

    if(widget.lno==null)
    {
      level_no = first.prefs!.getInt("levelno") ?? 0;
    }else
    {
      level_no=widget.lno!;
    }
    WidgetsBinding.instance?.addPostFrameCallback((_)
    {
      showDialog(barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.center,
            title: Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.all(0),
              // margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
              alignment: Alignment.center,
              color: Colors.teal,
              child: Text("TIME : NO TIME LIMITS",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            content: Text("YOU HAVE 5 SECONDES TO MEMORIZE ALL IMAGES",
                style: TextStyle(fontSize: 15, color: Colors.black)),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  temp=List.filled(12, true);
                  _initImages();
                  get();
                  share_pref();
                  setState(() { });
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.teal,
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 15),
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(95, 0, 95, 10),
                  child: Text("GO",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
            ],
          );
        },
      );
    });
    setState(() { });
    // temp=List.filled(12, true);
    // _initImages();
    // get();
    // share_pref();
  }

  share_pref()
  async {
    // Save an integer value to 'levelNo' key.
    first.prefs=await SharedPreferences.getInstance();
    setState(() { });
  }

  get() async
  {
      for(double i=5;i>=0;i--)
      {
          await Future.delayed(Duration(seconds: 1));
          a=i;
          if(i==0)
          {
            temp=List.filled(12, false);
          }
          setState(() { });
      }
    // for(int j=0;j<=200;j++)
      double j=0;
      while(true)
      {
        await Future.delayed(Duration(seconds: 1));
        if(temp[0]==true && temp[1]==true && temp[2]==true && temp[3]==true && temp[4]==true && temp[5]==true &&
                 temp[6]==true && temp[7]==true && temp[8]==true && temp[9]==true && temp[10]==true && temp[11]==true)
        {
          break;
        }
        a1=j ;
        j++;
        setState(() { });
      }
      // int sec = first.prefs!.getInt('sec') ?? 0;
      // first.prefs!.setInt("sec", a1);
      setState(() { });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (a!=0)?Text("TIME : $a/0",style: TextStyle(fontSize: 20)):Text("TIME : $a1/0",style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.teal,
        actions: [
          Container(alignment: Alignment.center,child: Text("NO TIME LIMITS",)),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.volume_up_sharp)),
          IconButton(onPressed: () {
            // print("your item is edit");
            showDialog(barrierColor: Colors.transparent,barrierDismissible: false,context: context, builder: (context)
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
          Expanded(flex: 8,
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
                margin: EdgeInsets.fromLTRB(20, 30, 20, 70),
                child: Column(
                  children: [
                    (a!=0)?Expanded(
                      child: SliderTheme(
                        child: Slider(
                          value: a,
                          max: 5,
                          min: 0,
                          activeColor: Colors.teal,
                          inactiveColor: Colors.white70,
                          onChanged: (double value) {},
                        ),
                        data: SliderTheme.of(context).copyWith(
                            trackHeight: 5,
                            thumbColor: Colors.transparent,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                        ),
                      ),
                    ):Expanded(
                      child: SliderTheme(
                        child: Slider(
                          value: a1,
                          max: 100,
                          min: 0,
                          activeColor: Colors.teal,
                          inactiveColor: Colors.white70,
                          onChanged: (double value) {},
                        ),
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 5,
                          thumbColor: Colors.transparent,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Expanded(flex: 8,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing:  5,
                        ),
                        itemCount: pic1.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if(!temp[index] && x==1)
                              {
                                print("index : ${temp[index]}");
                                temp[index]=true;
                                pos1=index;
                                x=3;
                                Future.delayed(Duration(milliseconds: 200)).then((value){
                                  x=2;
                                  setState(() { });
                                });
                              }
                              if(!temp[index] && x==2)
                              {
                                temp[index]=true;
                                x=3;
                                pos2=index;
                                if(pic1[pos1]==pic1[pos2])
                                {
                                  print("Images are match");
                                  x=1;
                                  if(temp[0]==true && temp[1]==true && temp[2]==true && temp[3]==true && temp[4]==true && temp[5]==true &&
                                      temp[6]==true && temp[7]==true && temp[8]==true && temp[9]==true && temp[10]==true && temp[11]==true)
                                  {

                                    int temp_sec=first.prefs!.getInt("level_time${level_no}") ?? 0;
                                    if(a1<temp_sec)
                                    {
                                      first.prefs!.setInt("level_time${level_no}", a1 as int);
                                    }
                                    if(widget.lno==null){
                                      first.prefs!.setInt("level_time${level_no}", a1 as int);
                                      level_no++;
                                      first.prefs!.setInt("levelno", level_no);
                                    }
                                    // else
                                    //   {
                                    //     level_no++;
                                    //     first.prefs!.setInt("levelno", level_no);
                                    //     first.prefs!.setInt("level_time${level_no}", a1 as int);
                                    //   }

                                    showDialog(barrierDismissible: false,context: context, builder: (context) {
                                      return AlertDialog(
                                        title: Container(
                                          height: 50,
                                          width: double.infinity,
                                          padding: EdgeInsets.all(0),
                                          // margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                                          alignment: Alignment.center,
                                          color: Colors.teal,
                                          child: Text("NEW RECORD !",style: TextStyle(fontSize: 20,color: Colors.white)),
                                        ),
                                        content: Text("${a1} seconds \n\n NO TIME LIMITS \n\n LEVEL ${level_no} \n\n WELL DONE",style: TextStyle(fontSize: 15,color: Colors.black)),
                                        actions: [
                                          InkWell(
                                            onTap: () {
                                              // inc_level++;
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return home();
                                              },));
                                            },
                                            child: Container(
                                              height: 50,
                                              width: double.infinity,
                                              color: Colors.teal,
                                              padding: EdgeInsets.fromLTRB(40, 10, 40, 15),
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(95, 0, 95, 10),
                                              child: Text("OK",style: TextStyle(fontSize: 25,color: Colors.white)),
                                            ),
                                          ),
                                        ],
                                      );
                                    },);
                                  }
                                }
                                else
                                {
                                  Future.delayed(Duration(milliseconds: 200)).then((value){
                                    x=1;
                                    temp[pos1] = false;
                                    temp[pos2] = false;
                                    setState(() { });
                                  });
                                  // Future.delayed(Duration(seconds: 1)).then((value) )
                                }
                              }
                              setState(() { });
                            },
                            child: Visibility(
                              visible: temp[index],
                              child: Container(
                                // margin: EdgeInsets.all(3),
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("${pic1[index]}")),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                              ),replacement: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.teal,
                                // image: DecorationImage(
                                //     fit: BoxFit.fill,
                                //     image: AssetImage("${pic1[index]}")),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ),
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
      ),
    );
  }
}

