

import 'package:flutter/material.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/screens/login_page.dart';

class Welcome1Screen extends StatefulWidget {
  @override
  _Welcome1ScreenState createState() => _Welcome1ScreenState();
}

class _Welcome1ScreenState extends State<Welcome1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50,),
          Center(child: Text("Make Your Car Service From Us" , style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, color: Colors.black),textAlign: TextAlign.center,)),
         SizedBox(height: 35,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Image.asset("images/car2.jpg", height: 390,),
         ),
          Text("For Healthy Future of Your car" , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 14),),
          SizedBox(height: 40,),
          GestureDetector(
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width-40,
              child: Center(child: Text("Get Started" ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,color: Colors.white),)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [buttonColour , nextButton],
                  ),
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
