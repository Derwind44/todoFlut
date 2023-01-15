import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final _mybox = Hive.box('mybox');

  void inisialData() {
    //list
    List toDoList = [
      ["Tugas Flutter", false],
      ["Tugas Matematika", false]
    ];
  }

  void loadData() {
    toDoList = _mybox.get("to do list");
  }

  void updateData() {
    _mybox.put("to do list", toDoList);
  }
}
