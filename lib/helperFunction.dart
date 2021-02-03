import 'package:flutter/cupertino.dart';

class HelperFunction {

  double getWidth (BuildContext context){
    var width = MediaQuery.of(context).size.width;
    return width;
  }

  double getHeight (BuildContext context){
    var height = MediaQuery.of(context).size.height;
    return height;
  }

  String getDate(){
    var date= DateTime.now().toString();
    var dateParse= DateTime.parse(date);
    var formattedDate =  "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }

  String getValidity(){

    var date = DateTime.now();
    var validityDate = DateTime(date.month + 1);
    var formattedDate =  "${validityDate.day}-${validityDate.month}-${validityDate.year}";
    return formattedDate.toString();
  }

}