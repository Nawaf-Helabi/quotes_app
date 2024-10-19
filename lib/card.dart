// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String qText;
  final String sText;
  final Function delete;
   final int remove ;
  Cards({required this.qText, required this.sText,required this.delete,required this.remove});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: EdgeInsets.all(9),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(30)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              qText,
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            Container(height: 130,
            width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        delete(remove);
                      }, icon: Icon(Icons.delete_outline_rounded)),
                  Text(sText,
                      style: TextStyle(fontSize: 22, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
        height: 180,
        width: 200,
      ),
    );
  }
}
