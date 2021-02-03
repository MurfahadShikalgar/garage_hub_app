

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:garagehubapp/Widgets/selection_card.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/helperFunction.dart';
import 'package:garagehubapp/screens/bike_jobcard_screen.dart';
import 'package:garagehubapp/screens/car_jobcard_screen.dart';
import 'package:garagehubapp/screens/history_screen.dart';
import 'package:garagehubapp/screens/pending_jobs.dart';
import 'package:garagehubapp/settings_screens/setting_screen.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  var tabColour= Color(0xfffafcfc);

  HelperFunction _helperFunction = HelperFunction();

  @override
  Widget build(BuildContext context) {

    var width = _helperFunction.getWidth(context);
    var height = _helperFunction.getHeight(context);
    var height2 = (width * 0.5) - 32;
  return Scaffold(
    appBar: AppBar(

      automaticallyImplyLeading: false,
      title: Text("Services" , style:  kAppBarTextStyle),
      backgroundColor: kLightBlue,
      actions: [
        IconButton(icon: Icon(Icons.shopping_cart, size: 25, color: Colors.black,), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PendingJobs()))),

      ],
    ),

//    backgroundColor: Colors.blue[50],
    body:
    Stack(
      children: [
        Image.asset('images/BG_4.png', width: width,height: height, fit: BoxFit.cover,),


    Container(
      width: double.infinity,
      height: double.infinity,

      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   SelectionCard(width: width, height2: height2, height: height, imagePath: 'images/car.jpg', onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => CarJobcardScreen()));
                   },),

                  SelectionCard(width: width, height2: height2, height: height, imagePath: 'images/bikes.jpg', onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BikeJobcardScreen()));

                  },)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectionCard(width: width, height2: height2, height: height, imagePath: 'images/history.png', onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen()));
                    },),

                    SelectionCard(width: width, height2: height2, height: height, imagePath: 'images/dr_spanner_logo.png', onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));

                    },)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Image.asset('images/car_1.png', width: width * 0.4, fit: BoxFit.fitWidth,),
        )
      ],
    ),
  );
  }
}

