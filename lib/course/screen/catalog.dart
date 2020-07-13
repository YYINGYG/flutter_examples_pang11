import 'package:flutter/material.dart';
import 'package:flutter_examples_pang/course/model/catamodel.dart';
import 'package:flutter_examples_pang/course/model/deskmodel.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyMenuPage();
  }
}

class MyMenuPage extends StatefulWidget {
  static const routerName = '/menu';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyMenuPageState();
  }
}

class MyMenuPageState extends State<MyMenuPage> {
  List<String> routesName=['/menu','/mydesk','/menu/0'];
  int _currentIndex = 0;
  _change(int index) {
    if(_currentIndex!=index){
      Navigator.pushNamed(context, routesName[index]);
      setState(() {});
    }
  }
  CatalogModel catalog;
  DeskModel table;
  @override

  @override
  Widget build(BuildContext context) {
    catalog = Provider.of<CatalogModel>(context);
    table = Provider.of<DeskModel>(context);
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
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child:GestureDetector(
                    child:  Container(
                      margin: EdgeInsets.fromLTRB(5, 30, 5, 30),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.pinkAccent,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: IconButton(
                                      icon: Icon(Icons.add, size: 30),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/menu/0");
                                        catalog.tpid=0;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: <Widget>[Text("${type[0]}",style: TextStyle(fontSize: 25),)],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/menu/0");
                      catalog.tpid=0;
                    },
                  )),
              Expanded(
                  child:GestureDetector(
                    child:  Container(
                      margin: EdgeInsets.fromLTRB(5, 30, 5, 30),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.pinkAccent,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: IconButton(
                                      icon: Icon(Icons.add, size: 30),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/menu/0");
                                        catalog.tpid=1;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: <Widget>[Text("${type[1]}",style: TextStyle(fontSize: 25),)],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/menu/0");
                      catalog.tpid=1;
                    },
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child:GestureDetector(
                    child:  Container(
                      margin: EdgeInsets.fromLTRB(5, 30, 5, 30),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.pinkAccent,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: IconButton(
                                      icon: Icon(Icons.add, size: 30),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/menu/0");
                                        catalog.tpid=2;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: <Widget>[Text("${type[2]}",style: TextStyle(fontSize: 30),)],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/menu/0");
                      catalog.tpid=2;
                    },
                  )),
              Expanded(
                  child:GestureDetector(
                    child:  Container(
                      margin: EdgeInsets.fromLTRB(5, 30, 5, 30),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.pinkAccent,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: IconButton(
                                      icon: Icon(Icons.add, size: 30),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/menu/0");
                                        catalog.tpid=3;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: <Widget>[Text("${type[3]}",style: TextStyle(fontSize: 30),)],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/menu/0");
                      catalog.tpid=3;
                    },
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child:GestureDetector(
                    child:  Container(
                      margin: EdgeInsets.fromLTRB(5, 30, 5, 30),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.pinkAccent,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: IconButton(
                                      icon: Icon(Icons.add, size: 30),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/menu/0");
                                        catalog.tpid=4;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: <Widget>[Text("${type[4]}",style: TextStyle(fontSize: 30),)],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/menu/0");
                      catalog.tpid=4;
                    },
                  )),
              Expanded(
                  child:GestureDetector(
                    child:  Container(
                      margin: EdgeInsets.fromLTRB(5, 30, 5, 30),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.pinkAccent,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: IconButton(
                                      icon: Icon(Icons.add, size: 30),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/menu/0");
                                        catalog.tpid=5;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: <Widget>[Text("${type[5]}",style: TextStyle(fontSize: 30),)],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/menu/0");
                      catalog.tpid=5;
                    },
                  )),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pinkAccent,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.orange,
        onTap: _change,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text("种类"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("购物车"),
          ),
        ],
      ),
    );
  }
}