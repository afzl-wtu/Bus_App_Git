import 'package:flutter/material.dart';

Widget myTextField(String text, TextEditingController controller,
    [bool timePicker = false, BuildContext context]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Text(
          text,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            onTap: timePicker
                ? () {
                    _showTimePicker(context, controller);
                  }
                : null,
            controller: controller,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      )
    ],
  );
}

Future<void> _showTimePicker(BuildContext context, timeCtl) async {
  TimeOfDay time = TimeOfDay.now();
  FocusScope.of(context).requestFocus(new FocusNode());

  TimeOfDay picked = await showTimePicker(context: context, initialTime: time);
  if (picked != null && picked != time) {
    timeCtl.text = picked
        .toString()
        .replaceFirst(RegExp(r'TimeOfDay\('), '')
        .replaceFirst(RegExp(r'\)'), ''); // add this line.

  }
}
