
import 'package:flutter/material.dart';

import '../model/fruit_model.dart';

class HomeViewModel extends ChangeNotifier{

  List<FruitModel> fruitList = [];
  String ?fruitName;
  final editNameController = TextEditingController();
  void addToList(){
    fruitList.add(FruitModel(fruitList.length +1, fruitName!));
    notifyListeners();

  }

  void removeFromList(int id){
    fruitList.removeWhere((element) => element.id == id,);
    notifyListeners();
  }

  void editFromList(int index){
    fruitList.elementAt(index).name = editNameController.text;
    editNameController.clear();
    notifyListeners();
  }

}