import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Widget AlertScreen (BuildContext context, AlertType alertType , String title , String desc , String text , Color colour ){
  Alert(
    context: context,
    type: alertType,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: ()=>Navigator.pop(context),
        color:colour,
        radius: BorderRadius.circular(0.0),
      ),
    ],
  ).show();
}