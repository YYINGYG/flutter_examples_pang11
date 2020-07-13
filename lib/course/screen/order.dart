import 'package:flutter/material.dart';
import 'package:flutter_examples_pang/course/model/deskmodel.dart';
import 'package:provider/provider.dart';

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyDeskPage();
  }
}

class MyDeskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDeskState();
  }
}

class MyDeskState extends State<MyDeskPage> {
  DeskModel table;
  List<String> routesName = ['/menu', '/mydesk', '/menu/0'];
  int _currentIndex = 1;
  _change(int index) {
    if (_currentIndex != index) {
      Navigator.pushNamed(context, routesName[index]);
      setState(() {});
    }
  }

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
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('名称',style: TextStyle(fontSize: 20),),
                Text('价格',style: TextStyle(fontSize: 20),),
                Text('数量',style: TextStyle(fontSize: 20),),
                Text('确认',style: TextStyle(fontSize: 20),),
                Text('催单',style: TextStyle(fontSize: 20),),
                Text('退单',style: TextStyle(fontSize: 20),),
              ],
            ),
            _buildListView2(table.desks[table.getCurrentId()].getOrders().length),
                Column(
                  mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                 Container(
                  child: Text(
                    "${table.desks[table.getCurrentId()].getWaiter().id}号服务员为您服务",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                    child: Text('总价为：${table.getMoney()}元',style: TextStyle(fontSize: 40),)
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    textTheme: ButtonTextTheme.accent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    textColor: Colors.white,
                    color: Colors.pinkAccent,
                    highlightColor: Colors.red,
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("确认结账"),
                              content: Text("您确定结账吗？",style: TextStyle(fontSize: 25),),
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
                                    table.desks[table.getCurrentId()].setState(false);
                                    Navigator.of(context).pop();
                                    Navigator.pushNamed(context, '/thanks');
                                    setState(() {});
                                  },
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  textColor: Colors.white,
                                  color: Colors.pinkAccent,
                                  highlightColor: Colors.red,
                                  child: Text("取消",style: TextStyle(color: Colors.white),),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }
                      );
                    },
                    child: Text(
                      '结账',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                )
                ]
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

  ListView _buildListView2(int count) {
    return ListView.separated(
      itemCount: count,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "${table.desks[table.getCurrentId()].getOrders()[index].product.name}",
                style: TextStyle(fontSize: 20),
                  ),
              Text(
                  "${table.desks[table.getCurrentId()].getOrders()[index].product.price}",
                  style: TextStyle(fontSize: 20),
                ),

              Text(
                    "${table.desks[table.getCurrentId()].getOrders()[index].count}",
                    style: TextStyle(fontSize: 20),
                  ),
              IconButton(
                  icon: Icon(Icons.check),
                  onPressed: (){
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("确认上菜"),
                            content: Text("您确定吗，确认之后不可再退单!",style: TextStyle(fontSize: 25),),
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
                                  setState(() {
                                  });
                                  Navigator.of(context).pop();
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          title: Text("提示"),
                                          content: Text('请慢用',style: TextStyle(fontSize: 25),),
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
                                  table.serveOrder(table.desks[table.getCurrentId()].getOrders()[index]);
                                },
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                textColor: Colors.white,
                                color: Colors.pinkAccent,
                                highlightColor: Colors.red,
                                child: Text("取消",style: TextStyle(color: Colors.white),),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        }
                    );

                  },
                ),

              IconButton(
                  icon: Icon(Icons.notifications_active),
                  onPressed: (){
                    if(!table.desks[table.getCurrentId()].getOrders()[index].rush){
                      table.rushOrder(table.desks[table.getCurrentId()].getOrders()[index]);
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("提示"),
                              content: Text('已催单',style: TextStyle(fontSize: 25),),
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
                    else{
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("您已经催过单了"),
                              content: Text("后厨繁忙，请耐心等待",style: TextStyle(fontSize: 25),),
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
                ),
              IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    if (table.desks[table.getCurrentId()].getOrders()[index]
                        .serve <
                        table.desks[table.getCurrentId()].getOrders()[index]
                            .count) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("提示"),
                              content: Text("您确定要退单吗",style: TextStyle(fontSize: 25),),
                              actions: <Widget>[
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  textColor: Colors.white,
                                  color: Colors.pinkAccent,
                                  highlightColor: Colors.red,
                                  child: Text("确认"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    table.refund(
                                        table.desks[table.getCurrentId()]
                                            .getOrders()[index]);
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("提示"),
                                            content: Text('已退单',style: TextStyle(fontSize: 25),),
                                            actions: <Widget>[
                                              RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                                textColor: Colors.white,
                                                color: Colors.pinkAccent,
                                                highlightColor: Colors.red,
                                                child: Text("确认"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ],
                                          );
                                        }
                                    );
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
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }
                      );
                    }
                    else {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("提示"),
                              content: Text("已经上菜的菜品无法退单！",style: TextStyle(fontSize: 25),),
                              actions: <Widget>[
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  textColor: Colors.white,
                                  color: Colors.pinkAccent,
                                  highlightColor: Colors.red,
                                  child: Text("确认"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          }
                      );
                    }
                  },
                ),


            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}