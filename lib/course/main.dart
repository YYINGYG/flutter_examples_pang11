import 'package:flutter/material.dart';
import 'package:flutter_examples_pang/course/model/catamodel.dart';
import 'package:flutter_examples_pang/course/model/deskmodel.dart';
import 'package:flutter_examples_pang/course/model/waitermodel.dart';
import 'package:flutter_examples_pang/course/screen/catalog.dart';
import 'package:flutter_examples_pang/course/screen/desk.dart';
import 'package:flutter_examples_pang/course/screen/detail.dart';
import 'package:flutter_examples_pang/course/screen/login.dart';
import 'package:flutter_examples_pang/course/screen/order.dart';
import 'package:flutter_examples_pang/course/screen/products.dart';
import 'package:flutter_examples_pang/course/screen/thanks.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CatalogModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => DeskModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => WaiterModel(),
        )
      ],
      child: MaterialApp(
        initialRoute: "/login",
        routes: {
          '/login': (context) =>LoginPage(),
          '/menu': (context) => Catalog(),
          '/menu/0': (context) => MenuPage0(),
          '/mydesk': (context) => TablePage(),
          '/detail':(context) => DetailPage(),
          '/pick':(context) => DeskPage(),
          '/thanks':(context)=>ThanksPage(),
        },
      ),
    );
  }
}