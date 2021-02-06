import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/Widgets/custom_round_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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



  void showAlertWithButtons(BuildContext context, AlertType alertType, String title, String desc,
      String buttonText1, Function onPressed1, String buttonText2,
      ){
    Alert(
      context: context,
      type: alertType,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            buttonText1,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: onPressed1,
          color: Colors.green
        ),
        DialogButton(
          child: Text(
            buttonText2,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        color: Colors.red,
        )
      ],
    ).show();
  }

  void addServicingData(BuildContext context, TextEditingController serviceNameController, TextEditingController priceController, Function onPressed){
    Alert(
      context: context,
      title: "Add Servicing Item",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            controller: serviceNameController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.settings),
              hintText: "Service Name",
            ),
          ),
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.monetization_on),
              hintText: "Service Price",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customRoundButton(
                title: 'Cancel',
                textColor: Colors.white,
                color: Colors.red,
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              customRoundButton(
                title: 'Add',
                textColor: Colors.white,
                color: Colors.green,
                onPressed: onPressed,
              ),
            ],
          )

        ],
      )
    ).show();
  }

}