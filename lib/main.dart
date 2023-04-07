import 'package:flutter/material.dart';
import 'package:love_shyri/Sec.dart';
import 'package:love_shyri/config.dart';
import 'package:love_shyri/first.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: home(),
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List myshayri = [];
  List<bool> temp=[];
  get() async {
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();
    print(statuses[Permission.location]);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp=List.filled(sp.tital.length, false);
  }
  @override
  Widget build(BuildContext context) {
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
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return home();
          },));
        },
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

    body: ListView.builder(itemCount: sp.tital.length,itemBuilder: (context, index) {
      return Card(
        child: GestureDetector(
          onTapDown: (details) {
            temp[index]=false;
            setState(() {

            });
          },
          onTapUp: (details) {
            temp[index]=false;


          },
          onTapCancel: () {
            temp[index]=true;
            setState(() {

            });
          },

          child: ListTile(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return first(index);
            },));
          },

              title: Text("${sp.tital[index]}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.pink)),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            hoverColor: Colors.blue,tileColor: (temp[index])? Colors.grey:Colors.pink.shade200,
              leading: SizedBox(width: 70,height: 70,child:CircleAvatar(backgroundImage: AssetImage("images/${sp.img[index]}")),),
          ),
        ),
      );
    },),
    );
  }
}
