import 'package:flutter/material.dart';
import 'package:aplikasi_pertama/pages/home_page.dart';
import 'package:aplikasi_pertama/util/myButton.dart';

class CreatBox extends StatelessWidget {
  final controller;
  VoidCallback simpan;
  VoidCallback kembali;
  CreatBox(
      {Key? key,
      required this.controller,
      required this.kembali,
      required this.simpan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Tambah Tugas"),
            ),

            //tombol
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //save
                MyButton(text: "simpan", onPressed: simpan),

                const SizedBox(
                  width: 50,
                ),
                //cancel
                MyButton(text: "kembali", onPressed: kembali)
              ],
            )
          ],
        ),
      ),
    );
  }
}
