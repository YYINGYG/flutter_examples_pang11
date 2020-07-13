import 'package:flutter/material.dart';
import 'package:flutter_examples_pang/course/model/catamodel.dart';
import 'package:flutter_examples_pang/course/model/deskmodel.dart';
import 'package:provider/provider.dart';

class MenuPage0 extends StatefulWidget {
  static const routerName = '/menu/0';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MenuPage0State();
  }
}

class MenuPage0State extends State<MenuPage0> {
  CatalogModel catalog;
  DeskModel table;
  bool foodServe = false;
  @override
  Widget build(BuildContext context) {
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
                "${type[catalog.tpid]}",
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
        body: ListView.separated(
            itemBuilder: (c, index) {
              if (catalog.findProductsByType(catalog.tpid)[index].refund) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${catalog.findProductsByType(catalog.tpid)[index].name}",
                              style: TextStyle(fontSize: 40)),
                        Text("${catalog.findProductsByType(catalog.tpid)[index].price}",
                              style: TextStyle(fontSize: 30)),

                      ],
                    ),
                  ),
                  onTap: (){
                    catalog.setDetailProduct(catalog.findProductsByType(catalog.tpid)[index]);
                    Navigator.pushNamed(context, "/detail");
                  },
                );
              }
              else {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${catalog.findProductsByType(catalog.tpid)[index]
                                  .name}",
                              style: TextStyle(fontSize: 40)),
                        Text("${catalog.findProductsByType(catalog.tpid)[index]
                                  .price}",
                              style: TextStyle(fontSize: 40)),

                      ],
                    ),
                  ),
                  onTap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("提示"),
                            content: Text("菜品已售罄!"),
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
                );
              }
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: catalog.findProductsByType(catalog.tpid).length));
  }
}