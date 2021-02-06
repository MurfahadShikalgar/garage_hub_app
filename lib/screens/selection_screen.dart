
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:garagehubapp/Widgets/selection_card.dart';
import 'package:garagehubapp/alert_screen.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/helperFunction.dart';
import 'package:garagehubapp/screens/bike_jobcard_screen.dart';
import 'package:garagehubapp/screens/car_jobcard_screen.dart';
import 'package:garagehubapp/screens/history_screen.dart';
import 'package:garagehubapp/screens/pending_jobs.dart';
import 'package:garagehubapp/settings_screens/setting_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  var tabColour= Color(0xfffafcfc);

  HelperFunction _helperFunction = HelperFunction();
  Map<String,dynamic> userData;

  int validityNumber ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserSubscriptionDetails();
  }

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

                     if(validityNumber == 0){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => CarJobcardScreen()));

                     }else if(validityNumber == 1){
                       _helperFunction.showAlertWithButtons(context, AlertType.warning, "No Subscription Found! ", "Subscribe to our app to create Job Card", "Subscribe", (){
                         // Navigate To Subscrption Screen
                       }, "Cancel");
                     }else if(validityNumber == 2){
                       _helperFunction.showAlertWithButtons(context, AlertType.warning, "Validity Over", "Recharge subscriptions to create jobcard", "Reacharge", (){
                         // Navigate to Subscription
                       }, "cancel");
                     }else if(validityNumber == 3){
                       _helperFunction.showAlertWithButtons(context, AlertType.warning, "Vehicles Quota Over", "You have used up your monthly Vehicle Quota!, Recharge or upgrade to higher package!!", "Reacharge", (){
                         // Navigate to Subscription
                       }, "cancel");
                     }
                   }
                   ,),

                  SelectionCard(width: width, height2: height2, height: height, imagePath: 'images/bikes.jpg', onPressed: (){

                    if(validityNumber == 0){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BikeJobcardScreen()));

                    }else if(validityNumber == 1){
                      _helperFunction.showAlertWithButtons(context, AlertType.warning, "No Subscription Found! ", "Subscribe to our app to create Job Card", "Subscribe", (){
                        // Navigate To Subscrption Screen
                      }, "Cancel");
                    }else if(validityNumber == 2){
                      _helperFunction.showAlertWithButtons(context, AlertType.warning, "Validity Over", "Recharge subscriptions to create jobcard", "Reacharge", (){
                        // Navigate to Subscription
                      }, "cancel");
                    }else if(validityNumber == 3){
                      _helperFunction.showAlertWithButtons(context, AlertType.warning, "Vehicles Quota Over", "You have used up your monthly Vehicle Quota!, Recharge or upgrade to higher package!!", "Reacharge", (){
                        // Navigate to Subscription
                      }, "cancel");
                    }


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

  getUserSubscriptionDetails() async {
    var uid = await FirebaseAuth.instance.currentUser.uid;
    var fData = FirebaseFirestore.instance.collection('garages').doc(uid).get().then((dataSnapshot){
      setState(() {
        userData = dataSnapshot.data();
        validityNumber = isValidSubcription(userData);
      });

    }).catchError((e){
      AlertScreen(context, AlertType.error, 'Error', "${e}", "OK", Colors.red);
    });
  }


  int isValidSubcription(Map<String,dynamic> userData) {
    var validity = userData[kValidity];
    var subscrptionType = userData[kSubscriptionType];
    var numberOfVehicles = userData[kNumberOfVehicles];

    print(subscrptionType);

    if (subscrptionType != "" && numberOfVehicles > 0) {
      //
      return 0;
    } else if (subscrptionType == "") {
      return 1;
    } else if (numberOfVehicles == 0 ) {
      return 3;
    }
      //validity
//    }else if(){
//
//    }
  }


   showAlert(int number){
    print(number);
    if(number == 0){

    }else if(number == 1){
      _helperFunction.showAlertWithButtons(context, AlertType.warning, "No Subscription Found! ", "Subscribe to our app to create Job Card", "Subscriber", (){
        // Navigate To Subscrption Screen
      }, "Cancel");
    }else if(number == 2){
      _helperFunction.showAlertWithButtons(context, AlertType.warning, "Validity Over", "Recharge subscriptions to create jobcard", "Reacharge", (){
        // Navigate to Subscription
      }, "cancel");
    }else if(number == 3){
      _helperFunction.showAlertWithButtons(context, AlertType.warning, "Vehicles Quota Over", "You have used up your monthly Vehicle Quota!, Recharge or upgrade to higher package!!", "Reacharge", (){
        // Navigate to Subscription
      }, "cancel");
    }
  }
}




