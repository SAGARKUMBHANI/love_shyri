import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:love_shyri/config.dart';
import 'package:love_shyri/third.dart';
import 'package:share_plus/share_plus.dart';


class sec extends StatefulWidget {
  List myshayari;
  int index;
  sec(this.myshayari, this.index);



  @override
  State<sec> createState() => _secState();
}

class _secState extends State<sec> {
  PageController ?controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller:PageController(initialPage: widget.index) ;

  }
  bool temp_color = false;
  var c_ind = 0;
  var pos=0;
  @override
  Widget build(BuildContext context) {
    double tot = MediaQuery.of(context).size.height;
    double status_bar = MediaQuery.of(context).padding.top;
    double app_bar = kToolbarHeight;
    double con = tot - status_bar - app_bar;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Love Shyari",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  decorationColor: Colors.pink)),
          backgroundColor: Colors.pink,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                            height: con,
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
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/expand.jpg"))),
                    ),
                  ),
                  Text(
                    "${widget.index+1}/${widget.myshayari.length}",
                    style: TextStyle(fontSize: 35),
                  ),
                  InkWell(onTap: () {
                    pos=Random().nextInt(sp.mycolor.length-1);
                    temp_color = true;
                    c_ind=pos;
                    setState(() {

                    });
                  },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/reload.jpg"))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 6,
                child: PageView.builder(
                  onPageChanged: (value) {
                    widget.index = value;
                    setState(() {});
                  },
                  itemCount: widget.myshayari.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(color: (temp_color==false) ? Colors.pink: null ,gradient: (temp_color==true) ?  LinearGradient(
                        colors: [
                          sp.mycolor[c_ind],
                          sp.mycolor[c_ind + 1],
                        ],
                      ) : null),
                      child: Text(
                        "${widget.myshayari[widget.index]}",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    );
                  },
                )),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(30),
                    height: 70,
                    color: Colors.green,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                  msg: "Text copied",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.transparent,
                                  textColor: Colors.black,
                                  fontSize: 35.0);
                              FlutterClipboard.copy(
                                  '${widget.myshayari[widget.index]}')
                                  .then((value) => print('copied'));
                            },
                            icon: Icon(
                              Icons.copy,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              widget.index--;
                              controller!.jumpToPage(widget.index);
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.chevron_left, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Four(widget.myshayari, widget.index);
                                },
                              ));
                            },
                            icon: Icon(Icons.edit, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              widget.index++;
                              controller!.jumpToPage(widget.index);
                              setState(() {

                              });
                            },
                            icon:
                            Icon(Icons.chevron_right, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              Share.share('${widget.myshayari[widget.index]}');
                            },
                            icon: Icon(Icons.share_sharp, color: Colors.white),
                          ),
                        ]),
                  ),
                )
              ],
            )
          ],
        ));




  }
}
