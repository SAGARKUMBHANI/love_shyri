import 'package:flutter/material.dart';
import 'package:love_shyri/Sec.dart';
import 'package:love_shyri/config.dart';

class first extends StatefulWidget {
  int cur;

  first(this.cur);



  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List myshayri = [];
  var index=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.cur == 0) {
      myshayri = sp.Loveshyri;
    }
    else if (widget.cur == 1) {
      myshayri = sp.mornigshyri;
    }
    else if (widget.cur == 2) {
      myshayri = sp.nightshyri;
    }
    else if (widget.cur == 3) {
      myshayri = sp.Breakupeshyri;
    }
    else if (widget.cur == 4) {
      myshayri = sp.Insperation;
    }
    else if (widget.cur == 5) {
      myshayri = sp.politicalshyri;
    }
    else if (widget.cur == 6) {
      myshayri = sp.SharabiShyri;
    }
    else if (widget.cur == 7) {
      myshayri = sp.funnyshyri;
    }
    else if (widget.cur == 8) {
      myshayri = sp.friendsShyri;
    }
    else if (widget.cur == 9) {
      myshayri = sp.deshbhaktiShyri;
    }
    else if (widget.cur == 10) {
      myshayri = sp.Atittudeshyri;
    }
    else if (widget.cur == 11) {
      myshayri = sp.birthdayshyri;
    }
    else if (widget.cur == 12) {
      myshayri = sp.deathshyri;
    }
    else if (widget.cur == 13) {
      myshayri = sp.Emotionalshyri;
    }
    else if (widget.cur == 14) {
      myshayri = sp.festivalShyri;
    }
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
              return sec(myshayri,  index);
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
      body: ListView.separated(itemBuilder: (context, index) {
        return ListTile(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return sec(myshayri, index);
          },));

        }, title: Text("${myshayri[index]}"),
        leading: Container(height: 50,
          width: 50,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/${sp.img[widget.cur]}"))),
        ),
        );
      }, separatorBuilder: (context, index) {
        return Divider(height: 5, thickness: 5, color: Colors.indigo.shade300,);
      }, itemCount: myshayri.length),
    );

  }
}
