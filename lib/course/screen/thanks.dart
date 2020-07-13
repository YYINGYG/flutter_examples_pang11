import 'package:flutter/material.dart';
import 'package:flutter_examples_pang/course/model/deskmodel.dart';
import 'package:provider/provider.dart';

class ThanksPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ThanksPageState();
  }
}

class ThanksPageState extends State<ThanksPage>{
  DeskModel table;
  @override
  Widget build(BuildContext context) {
    table = Provider.of<DeskModel>(context);
    // TODO: implement build
    return Scaffold(
        appBar: new PreferredSize(
          child: new Container(
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).padding.top
            ),
            child: new Padding(
              padding: const EdgeInsets.only(
                  left: 30.0,
                  top: 20.0,
                  bottom: 20.0
              ),
              child: new Text(
                '暖暖餐饮',
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
              ),
            ),
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Colors.pinkAccent,
                      Colors.yellow
                    ]
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 20.0,
                    spreadRadius: 1.0,
                  )
                ]
            ),
          ),
          preferredSize: new Size(
              MediaQuery.of(context).size.width,
              150.0
          ),
        ),

        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("欢迎下次光临！！！",style: TextStyle(fontSize: 30),),
                Text("φ(≧ω≦*)♪",style: TextStyle(fontSize: 30),)
              ],
            ),
          ),
        )
    );
  }

}