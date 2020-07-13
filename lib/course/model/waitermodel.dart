import 'package:flutter/material.dart';


class Waiter{
  String name;
  int id;
  String password;
  Waiter(this.id,this.name,this.password);
}

class WaiterModel with ChangeNotifier{
  List<Waiter> _waiters=[];
  Waiter _holder;
  getWaiters() {
    return _waiters;
  }

  setWaiters(List<Waiter> value) {
    _waiters = value;
    notifyListeners();
  }

  getHolder(){
    return _holder;
  }

  setHolder(Waiter value) {
    _holder = value;
    notifyListeners();
  }

  checkAccount(String username,String password){
    Waiter w=_waiters.firstWhere( (i) =>(i.name==username&&i.password==password),orElse: () => null);
    return w;
  }

}