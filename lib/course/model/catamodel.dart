import 'package:flutter/material.dart';

List<String> type=["特色推荐","今日特价","荤菜","素菜","酒水","甜品"];

class Product {
  double price;
  String name;
  String details;
  int type;
  bool status=true;
  bool refund;
  int id;
  Product(this.price, this.name, this.type,this.details,this.refund,this.id);
}

class CatalogModel with ChangeNotifier{
  Product detailProduct;
  bool _first=false;
  List<Product> _list=[];
  int tpid;

  setDetailProduct(Product P){
    detailProduct=P;
    notifyListeners();
  }

  getDetailProduct(){
    return detailProduct;
  }
  bool getFirst(){
    return _first;
  }

  setFirst(bool value) {
    _first = value;
    notifyListeners();
  }

  List<Product> get list => _list;

  set list(List<Product> value) {
    _list = value;
  }

  List<Product> getList(){
    return _list;
  }

  setList(List<Product> value) {
    _list = value;
    notifyListeners();
  }

  List<Product> findProductsByType(int index){
    List<Product> temp=[];
    for (var item in _list) {
      if(item.type==index){
        temp.add(item);
      }
    }
    return temp;
  }
}