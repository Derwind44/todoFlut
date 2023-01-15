import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:aplikasi_pertama/database/data.dart';
import 'package:aplikasi_pertama/util/CreatBox.dart';
import 'package:aplikasi_pertama/util/TodoCol.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//hive box
final _mybox = Hive.box('mybox');
ToDoDataBase db = ToDoDataBase();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    if (_mybox.get("to do list") == null) {
      db.inisialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  //controller
  final _controller = TextEditingController();

  //ganti
  void checkboxGanti(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

// simpan tugas
  void simpanTugas() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void tugasBaru() {
    showDialog(
      context: context,
      builder: (context) {
        return CreatBox(
          controller: _controller,
          simpan: simpanTugas,
          kembali: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //hapus tugas
  void hapusTugas(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('To Do List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tugasBaru,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return kertas(
            namaTugas: db.toDoList[index][0],
            tugasSelesai: db.toDoList[index][1],
            onChanged: (value) => checkboxGanti(value, index),
            hapusFunct: (p0) => hapusTugas(index),
          );
        },
      ),
    );
  }
}
