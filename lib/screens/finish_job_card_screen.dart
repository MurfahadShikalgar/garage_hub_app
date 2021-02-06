import 'package:flutter/material.dart';
import 'package:garagehubapp/Widgets/custom_round_button.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/helperFunction.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toast/toast.dart';

class FinishJobCardScreen extends StatefulWidget {

  final Map<String, dynamic> pendingJobCard;
  final int index;

  const FinishJobCardScreen({Key key, this.pendingJobCard, this.index}) : super(key: key);
  @override
  _FinishJobCardScreenState createState() => _FinishJobCardScreenState();
}

class _FinishJobCardScreenState extends State<FinishJobCardScreen> {
  HelperFunction _helperFunction = HelperFunction();
  var servicingData = [];
  var charges = [];
  var totalBill;

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var height = _helperFunction.getHeight(context);
    var width = _helperFunction.getWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Finish Jobcard", style: kAppBarTextStyle,),
        backgroundColor: kLightBlue,
      ),
      body: Stack(
        children: [
          Image.asset('images/BG_4.png', width: width,height: height, fit: BoxFit.cover,),

          Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add Servicing Data", style: kHeadingTextStyle,),
                  ),

                  servicingData != null ?
                  Expanded(
                    child: ListView.builder(
                      itemCount: servicingData.length,
                      itemBuilder: (BuildContext context, int index){
                        return Card(

                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(servicingData[index]['servicingItem'].toString(), style: kHeadingTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),),
                                Spacer(),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(servicingData[index]['price'].toString()),
                                    GestureDetector(child: Text("Remove", style: kHeadingTextStyle.copyWith(fontSize: 12),),
                                    onTap: (){
                                      setState(() {
                                        servicingData.removeAt(index);
                                        charges.removeAt(index);
                                        totalBill = charges.fold(0, (p, c) => p + c);

                                      });
                                    },
                                    )

                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ) : Container(),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 125,
            child: FloatingActionButton(
              child: Icon(Icons.add, color: Colors.white,),
              backgroundColor: Colors.green,
              onPressed: (){
                print("Button Pressed");
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
                        SizedBox(height: 10),
                        customRoundButton(
                          width: double.infinity,
                          title: 'Add',
                          textColor: Colors.white,
                          color: Colors.green,
                          onPressed: (){

                            if(serviceNameController.text != "" && priceController.text != null){
                              var price = int.parse(priceController.text.trim());
                              var data = {
                                'servicingItem' : serviceNameController.text.trim(),
                                'price': price,
                              };

                              setState(() {
                                servicingData.add(data);
                                charges.add(price);
                                totalBill = charges.fold(0, (p, c) => p + c);

                              });

                              clearData();
                              Navigator.pop(context);
                            }else {
                              Toast.show("All fields are compulsary", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                            }
                          },
                        )
                      ],
                    )
                ).show();
              },
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Container(
              width: width,
              height: 60,
              color: Colors.white30,
              child: Center(
                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Total Bill', style: kHeadingTextStyle),
                    ),
                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text( totalBill != null ? '₹ ${totalBill}' : '₹ 00', style: kHeadingTextStyle,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              child: Container(
                width: width,
                height: 60,
                color: Colors.green,
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Finish Job card', style: kHeadingTextStyle.copyWith(color: Colors.white),),
                    SizedBox(width: 20,),
                    Icon(Icons.check, color: Colors.white, size: 30,)
                  ],
                )),
              ),
              onTap: (){
                print("Finish Button Pressed");
              },
            ),
          ),
        ],
      ),
    );
  }

  void clearData(){
    serviceNameController.text = "";
    priceController.text = "";
  }
}
