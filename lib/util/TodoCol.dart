import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class kertas extends StatelessWidget {
  final String namaTugas;
  final bool tugasSelesai;
  Function(bool?)? onChanged;
  Function(BuildContext)? hapusFunct;

  kertas(
      {Key? key,
      required this.namaTugas,
      required this.tugasSelesai,
      required this.onChanged,
      required this.hapusFunct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: hapusFunct,
              icon: Icons.delete,
              foregroundColor: Colors.red,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: tugasSelesai,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //nama tugas
              Text(
                namaTugas,
                style: TextStyle(
                    decoration: tugasSelesai
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    color: tugasSelesai ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
