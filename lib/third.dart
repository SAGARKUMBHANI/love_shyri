import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:love_shyri/config.dart';

import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
class Four extends StatefulWidget {
  List myshayari;
  int curt_ind;

  Four(this.myshayari, this.curt_ind);

  @override
  State<Four> createState() => _FourState();
}

class _FourState extends State<Four> {
//PageController controller = PageController();
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;
  int col_ind = 0;
  int c_ind = 0;
  var color_cur = 0;
  bool temp_color = false;
  String Semoji="😀 😃 😄 😁 😆\n";
  List mypage = [];
  var font_cur = "fs2";
  double text_size=10;

  List font = [
    "fs2",
    "fs3",
    "fs4",
    "fs5",
    "fs6",
    "fs7",
    "fs8",
    "fs9",
    "fs10",
    "fs11",
    "fs12",
    "fs13",
    "fs14",
    "fs15",
    "fs16",
    "fs17",
    "fs18",
    "fs19",
  ];

  @override
  Widget build(BuildContext context) {
    double tot_h = MediaQuery.of(context).size.height;
    double status_bar = MediaQuery.of(context).padding.top;
    double app_bar = kToolbarHeight;
    double can_h = tot_h - status_bar - app_bar;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Shayri"),
      ),
      body: Column(
        children: [
          Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(4),
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(     color:
                    (temp_color == true) ? sp.mycolor[c_ind] : Colors.pink,border: Border.all(width: 3,color: Colors.black),borderRadius: BorderRadius.circular(20)),

                    child: Text(
                      "${Semoji}${widget.myshayari[widget.curt_ind]}${Semoji}",

                      style: TextStyle(
                          fontFamily: font_cur,
                          color: (temp_color == true)
                              ? sp.mycolor[color_cur]
                              : Colors.white,
                          fontSize: text_size
                      ),
                    )),
              )),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(onTap: () {
                    var pos=Random().nextInt(sp.mycolor.length-1);
                    temp_color = true;
                    c_ind=pos;
                    setState(() {

                    });
                  },

                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/reload.jpg"))),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: (temp_color == true)
                                ? sp.mycolor[c_ind]
                                : null,
                            width: double.infinity,
                            height: can_h,
                            child: GridView.builder(
                              itemCount: sp.mycolor.length - 1,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    temp_color = true;
                                    c_ind = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          colors: [
                                            sp.mycolor[index],
                                            sp.mycolor[index + 1],
                                          ],
                                        )
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          image:
                          DecorationImage(image: AssetImage("images/expand.jpg"))),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                              color: Colors.white,
                              width: double.infinity,
                              height: can_h,
                              child: GridView.builder(
                                itemCount: sp.mycolor.length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                itemBuilder: (context, index) {
                                  return GridTile(
                                      child: InkWell(
                                        onTap: () {
                                          temp_color = true;
                                          c_ind = index;
                                          setState(() {});
                                        },
                                        child: Container(
                                          color: sp.mycolor[index],
                                        ),
                                      ));
                                },
                              ));
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration( color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 4,color: Colors.black)),
                      child: Text(
                        "Background",
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                              color: Colors.white,
                              width: double.infinity,
                              height: can_h,
                              child: GridView.builder(
                                itemCount: sp.mycolor.length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                itemBuilder: (context, index) {
                                  return GridTile(
                                      child: InkWell(
                                        onTap: () {
                                          temp_color = true;
                                          color_cur = index;
                                          setState(() {});
                                        },
                                        child: Container(
                                          color: sp.mycolor[index],
                                        ),
                                      ));
                                },
                              ));
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration( color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 4,color: Colors.black)),
                      child: Text("Text Color"),
                      alignment: Alignment.center,
                    ),
                  ),
                  InkWell(onTap: () async {
                    var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
                      Directory dir=Directory(path);
                      if(!  await dir.exists())
                        {
                          await dir.create();
                        }
                      int r=Random().nextInt(1000);

                    Share.shareFiles(['${dir.path}/${r}'], text: 'Great picture');
                      setState(() {

                      });

                  },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration( color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 4,color: Colors.black)),
                      child: Text("Share"),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 100,
                            width: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: font.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    font_cur = font[index];
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    height: 100,
                                    width: 130,
                                    decoration: BoxDecoration(color: Colors.orange.shade400,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(width: 4,color: Colors.black)),
                                    child: Text(
                                      "shayari",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontFamily: font[index] ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration( color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 4,color: Colors.black)),
                      child: Text(
                        "Font",
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 150,
                            width: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: sp.emoji.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {

                                    setState(() {
                                      Semoji=sp.emoji[index];
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 130,
                                    decoration: BoxDecoration( color: Colors.orange.shade400,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(width: 4,color: Colors.black)),
                                    child: Text("${sp.emoji[index]}"),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration( color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 4,color: Colors.black)),
                      child: Text("Emoji"),
                      alignment: Alignment.center,
                    ),
                  ),
                  InkWell(onTap: () {
                    showModalBottomSheet(context: context, builder: (context) {
                      return Container(height: 100,

                        decoration: BoxDecoration( color: Colors.orange.shade400,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 4,color: Colors.black)),
                        child: StatefulBuilder(builder: (context, setState1) {
                          return Slider(activeColor: Colors.black,inactiveColor: Colors.white,max: 100,min: 10,value: text_size, onChanged: (value) {
                            text_size=value;
                            setState(() {});
                            setState1(() {});

                          },
                          );
                        },),
                      );
                    },);
                  },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 4,color: Colors.black)),
                      child: Text("Text Size"),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
