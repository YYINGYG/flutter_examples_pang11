import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples_pang/course/model/catamodel.dart';
import 'package:flutter_examples_pang/course/model/deskmodel.dart';
import 'package:flutter_examples_pang/course/model/waitermodel.dart';
import 'package:provider/provider.dart';

Widget MyAppBar() {

}

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}



class LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username;
  String _password;
  CatalogModel catalog;
  DeskModel table;
  WaiterModel waiter;
  bool passwordVisible;

  void initState() {
    super.initState();
    _load();
    passwordVisible = false;
  }

  _load() async {
    {
      List<Product> productList = await Future.delayed(Duration.zero, () {
        return [
          Product(45.0, "大盘鸡", 0, "大盘鸡一般指新疆大盘鸡。新疆大盘鸡，又名沙湾大盘鸡、辣子炒鸡，是20世纪80年代起源于新疆公路边饭馆的江湖菜，主要用鸡块和土豆块炒炖而成，还同河南烩面搭配食用。", true,0),
          Product(28.0, "麻婆豆腐", 1, "麻婆豆腐，是四川省传统名菜之一，属于川菜，主要原料为豆瓣、豆腐、牛肉末（也可以用猪肉）、辣椒和花椒等，麻来自花椒，辣来自辣椒面，这道菜突出了川菜“麻辣”。", true,1),
          Product(42.0, "糖醋排骨", 2, "糖醋排骨是糖醋味型中具有代表性的一道大众喜爱的特色传统名菜。它选用新鲜猪子排作主料，肉质鲜嫩，成菜色泽红亮油润。", true,2),
          Product(25.0, "三鲜饺子", 3, "三鲜饺子是一种以多种食材剁碎混合而做成馅制成的饺子，风味因配料以及习俗不同而存在差异。它可以分为素三鲜和肉三鲜，口味咸鲜。", true,3),
          Product(3.0, "百事可乐", 4, "百事可乐，诞生于19世纪90年代，由美国北卡罗莱纳州药剂师制造，以碳酸水、糖、香草、生油、胃蛋白酶及可乐果制成。", true,4),
          Product(12.0, "杨枝甘露", 5, "杨枝甘露指的是一种港式甜品，主要食材是西柚、芒果、西米，主要烹饪工艺是煮。芒果和西柚都含有丰富的维生素，是一道营养丰富的甜品。", false,5),
        ];
      });
      catalog.setList(productList);
      table.setDesks([
        Desk(1),
        Desk(2),
        Desk(3),
        Desk(4),
        Desk(5),
        Desk(6),
        Desk(7),
        Desk(8),
        Desk(9),
        Desk(10),
        Desk(11),
        Desk(12),
        Desk(13),
        Desk(14),
        Desk(15),
        Desk(16),
        Desk(17)
      ]);
      table.desks[3].setState(true);
      table.desks[8].setState(true);
      table.desks[10].setState(true);
      table.setCurrentId(-1);
      catalog.setFirst(true);
      waiter.setWaiters([
        Waiter(1701, "2017214340", "123456"),
        Waiter(1702, "2017214341", "123456"),
        Waiter(1703, "2017214342", "123456"),
        Waiter(1704, "2017214343", "123456")
      ]);
    }
  }

  Widget MyAppBar() {
    return new PreferredSize(
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
    );
  }
  @override
  Widget build(BuildContext context) {
    waiter = Provider.of<WaiterModel>(context);
    catalog = Provider.of<CatalogModel>(context);
    table = Provider.of<DeskModel>(context);
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/p1.jpg'),
                fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.blue,width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))

              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: '账号',
                          hintText: '请输入账号'
                        ),
                        onChanged: (val){
                          _username=val;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: TextFormField(
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: '密码',
                          hintText: '请输入密码',
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: (){
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          )
                        ),
                        onChanged: (val){
                          _password=val;
                        },

                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        textColor: Colors.white,
                        color: Colors.pinkAccent,
                        highlightColor: Colors.red,
                        child: Text(
                            '登录',style: TextStyle(fontSize: 18)
                        ),
                        onPressed: () {
                          Waiter w = waiter.checkAccount(_username, _password);
                          if(w==null){
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Text("提示"),
                                    content: Text('账号或密码错误',style: TextStyle(fontSize: 25),),
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
                            waiter.setHolder(w);
                            Navigator.pushNamed(context,"/pick");
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}