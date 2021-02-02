

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/screens/bike_jobcard_screen.dart';
import 'package:garagehubapp/screens/car_jobcard_screen.dart';
import 'package:garagehubapp/screens/history_screen.dart';
import 'package:garagehubapp/screens/pending_jobs.dart';
import 'file:///C:/Users/91951/AndroidStudioProjects/garage_hub_app/lib/settings_screens/setting_screen.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  var tabColour= Color(0xfffafcfc);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 25,color: buttonColour,),
        ),
      ),
      title: Text("Services" , style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold ,color: buttonColour),),
      backgroundColor: Colors.white,
      actions: [

        IconButton(icon: Icon(Icons.shopping_cart, size: 25, color: buttonColour,), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PendingJobs()))),

        IconButton(icon: Icon(Icons.logout, color: buttonColour,), onPressed: (){
          FirebaseAuth.instance.signOut().whenComplete(() {
            Navigator.pop(context);
          });
        }),
      ],
    ),

    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container (
                      height: 170,
                      width: 170,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Image.asset ("images/car.jpg"),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xfffafcfc),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ]
                      ),
                    ),
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CarJobcardScreen()));
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container (
                      height: 170,
                      width: 170,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15,8,15,8),
                        child: Image.asset("images/bikes.jpg"),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xfffafcfc),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ]
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BikeJobcardScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),



          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container (
                      height: 170,
                      width: 170,
                      child: Image.asset("images/history.png"),
                      //child: Center(child: Text("History" , style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold ,color: Colors.grey),)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xfffafcfc),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ]
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryScreen()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container (
                      height: 170,
                      width: 170,
                      child: Image.asset("images/sett.png"),
                      //child: Center(child: Text("Setting" , style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold ,color: Colors.grey),)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xfffafcfc),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ]
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
  }
}
