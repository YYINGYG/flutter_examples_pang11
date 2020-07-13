import 'package:flutter/material.dart';
import 'package:flutter_examples_pang/course/model/catamodel.dart';
import 'package:flutter_examples_pang/course/model/deskmodel.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailState();
  }
}

class DetailState extends State<DetailPage>{
  CatalogModel catalog;
  DeskModel table;
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
        child: ListView(
          children: <Widget>[
            _buildImage(),
            _buildTitleSection(),
            _buildButtonSection(),
            _buildTextSection()
          ],
        ),
      ),
    );
  }

  _buildImage() {
    return  Container(
      margin: EdgeInsets.all(5),
      child: Image.asset(
        'images/'+catalog.detailProduct.id.toString()+'.jpg',
        height: 250,
        fit: BoxFit.contain,
      ),
    );
  }

  _buildTitleSection(){
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
                Text("${catalog.detailProduct.name}",
                    style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text('价格：${catalog.detailProduct.price}',
                    style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  _buildButtonSection() {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.blue,
                ),
                onPressed: (){
                  if(table.findOrder(catalog.detailProduct).count==0||table.findOrder(catalog.detailProduct).count-1<table.findOrder(catalog.detailProduct).serve){
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("不能再减少餐品数量！"),
                            actions: <Widget>[
                              RaisedButton(
                                color: Colors.lightBlue,
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
                    table.removeOrder(catalog.detailProduct);
                  }
                },
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text("${table.findOrderCount(catalog.detailProduct)}",style: TextStyle(fontSize: 40),),
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                onPressed: (){
                  table.addOrder(catalog.detailProduct);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildTextSection() {
    return Container(
        padding: EdgeInsets.all(32),
        child: Text(
          '${catalog.detailProduct.details}',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 20),
        ));
  }
}