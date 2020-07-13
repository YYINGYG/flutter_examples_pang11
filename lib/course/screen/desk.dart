import 'package:flutter/material.dart';
import 'package:flutter_examples_pang/course/model/catamodel.dart';
import 'package:flutter_examples_pang/course/model/deskmodel.dart';
import 'package:flutter_examples_pang/course/model/waitermodel.dart';
import 'package:provider/provider.dart';

class DeskPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DeskState();
  }
}

class DeskState extends State<DeskPage>{
  CatalogModel catalog;
  DeskModel table;
  WaiterModel waiter;
  @override
  Widget build(BuildContext context) {
    waiter = Provider.of<WaiterModel>(context);
    catalog = Provider.of<CatalogModel>(context);
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
        body: GridView.extent(
            maxCrossAxisExtent: 150,
            padding: EdgeInsets.all(4),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: deskGird(table.desks.length))
    );
  }

  deskGird(int length){
    List<Widget> containers = [];
    for(var i = 0; i < length; i++) {
      var d = GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: table.desks[i].getState()==true ? Colors.red : Colors.green,
          elevation: 10,
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("${table.desks[i].id}号台",style: TextStyle(fontSize: 25),),
                  _state(table.desks[i].getState())
                ]),
          ),
        ),
        onTap: (){
          if(table.desks[i].getState()!=true){
            table.setCurrentId(i);
            table.desks[table.getCurrentId()].setWaiter(waiter.getHolder());
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("提示"),
                    content: Text("是否使用此桌?",style: TextStyle(fontSize: 25),),
                    actions: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        textColor: Colors.white,
                        color: Colors.pinkAccent,
                        highlightColor: Colors.red,
                        child: Text("使用"),
                        onPressed: (){
                          table.desks[i].setState(true);
                          Navigator.of(context).pop();
                          setState(() {
                          });
                          Navigator.pushNamed(context,"/menu");
                        },
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        textColor: Colors.white,
                        color: Colors.pinkAccent,
                        highlightColor: Colors.red,
                        child: Text("取消"),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                }
            );
          }
          else{
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("提示"),
                    content: Text("此桌已被使用！",style: TextStyle(fontSize: 25),),
                    actions: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        textColor: Colors.white,
                        color: Colors.pinkAccent,
                        highlightColor: Colors.red,
                        child: Text("确认"),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      )

                    ],
                  );
                }
            );
          }
        },
      );
      containers.add(d);
    }
    return containers;
  }

  _state(bool b){
    if(b){
      return Text("使用中",style: TextStyle(fontSize: 25),);
    }
    else{
      return Text("空闲",style: TextStyle(fontSize: 25),);
    }
  }
}