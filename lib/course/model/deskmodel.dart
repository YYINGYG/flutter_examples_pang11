import 'package:flutter/material.dart';
import 'package:flutter_examples_pang/course/model/catamodel.dart';
import 'package:flutter_examples_pang/course/model/waitermodel.dart';


class Order {
  int count;
  Product product;
  int serve=-1;
  bool rush=false;
  Order(this.count, this.product);
}

class Desk {
  int id;
  List<Order> _orders=[];
  bool _state = false;
  Waiter _waiter;
  Desk(this.id);

  List<Order> getOrders(){
    return _orders;
  }

  setOrders(List<Order> o){
    _orders=o;
  }

  setWaiter(Waiter value) {
    _waiter = value;
  }

  setState(bool value) {
    _state = value;
  }

  Waiter getWaiter(){
    return _waiter;
  }

  bool getState() {
    return _state;
  }
}

class DeskModel with ChangeNotifier{
  List<Desk> _desks=[];
  int _currentId = -1;
  List<Desk> get desks => _desks;

  int getCurrentId (){
    return _currentId;
  }

  getMoney(){
    double money=0;
    for(int i=0;i<_desks[_currentId].getOrders().length;i++){
      money+=_desks[_currentId].getOrders()[i].count*_desks[_currentId].getOrders()[i].product.price;
    }
    return money;
  }

  setCurrentId(int value) {
    _currentId = value;
    notifyListeners();
  }

  setDesks(List<Desk> value) {
    _desks = value;
    notifyListeners();
  }

  setDeskState(int id,bool state){
    Desk d=_desks.firstWhere((i)=>i.id==id,orElse: () => null);
    if(d!=null){
      d.setState(state);
    }
    notifyListeners();
  }

  Order findOrder(Product p){
    return _desks[_currentId].getOrders().firstWhere((i)=>i.product==p,orElse: () => null);
  }

  findOrderCount(Product p){
    Order o=findOrder(p);
    if(o==null) return 0;
    else return o.count;
  }

  addOrder(Product p){
    Order o=findOrder(p);
    if(o==null){
      o=Order(0,p);
      _desks[_currentId].getOrders().add(o);
    }
    o.count++;
    notifyListeners();
  }

  removeOrder(Product p){
    Order o=findOrder(p);
    if(o==null){
      return ;
    }
    else{
      if(o.count-1>=o.serve) o.count--;
      if(o.count==0){
        _desks[_currentId].getOrders().remove(o);
      }
    }
    notifyListeners();
  }

  serveOrder(Order o){
    o.serve=o.count;
    o.rush=false;
    notifyListeners();
  }

  rushOrder(Order o){
    o.rush=true;
    notifyListeners();
  }

  refund(Order o) {
    if (o.serve == -1) {
      _desks[_currentId].getOrders().remove(o);
    }
    else {
      o.count = o.serve;
    }
    notifyListeners();
  }
}