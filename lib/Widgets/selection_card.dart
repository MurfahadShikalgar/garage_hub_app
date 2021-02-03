import 'package:flutter/material.dart';
import 'package:garagehubapp/const.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({
    Key key,
    @required this.width,
    @required this.height2, this.height, this.onPressed, this.imagePath,
  }) : super(key: key);

  final double width;
  final double height2;
  final double height;
  final Function onPressed;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          child: Container (
            height: (width * 0.5) - 32,
            width: (width * 0.5) - 32,
            child: Stack(
                children: [
                  Container(
                    width: 20,
                    height: (width * 0.5) - 32,
                    child: Column(
                      children: [
                        Container(
                          height: height2 / 17,
                          color: kYellowColour,
                        ),
                        Container(
                          height: height2 / 17,
                          color: Colors.black,
                        ),
                        Container(
                          height: height2 / 17,
                          color: kYellowColour,
                        ),
                        Container(
                          height: height2 / 17,
                          color: Colors.black,
                        ),
                        Container(
                          height: height2 / 17,
                          color: kYellowColour,
                        ),
                        Container(
                          height: height2 / 17,
                          color: Colors.black,
                        ),
                        Container(
                          height: height2 / 17,
                          color: kYellowColour,
                        ),
                        Container(
                          height: height2 / 17,
                          color: Colors.black,
                        ),
                        Container(
                          height: height2 / 17,
                          color: kYellowColour,
                        ),
                        Container(
                          height: height2 / 17,
                          color: Colors.black,
                        ),
                        Container(
                          height: height2 / 17,
                          color: kYellowColour,
                        ),
                        Container(
                          height: height2 / 17,
                          color: Colors.black,
                        ),
                        Container(
                          height: height2 / 17,
                          color: kYellowColour,
                        ),
                        Container(
                          height: height2 / 17,
                          color: Colors.black,
                        ),
                        Container(
                          height: height2 / 17,
                          color: kYellowColour,
                        ),
                        Container(
                          height: height2 / 17,
                          color: Colors.black,
                        ),
                        Container(
                          height: height2 / 17,
                          color: kYellowColour,
                        ),

                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset (imagePath),
                    ),
                  ),
                ]
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
          onTap: onPressed
      ),
    );
  }
}
