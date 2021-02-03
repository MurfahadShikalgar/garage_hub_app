import 'package:flutter/material.dart';

class loader extends StatelessWidget {
  const loader({
    Key key,
    @required this.spinner,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final bool spinner;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: spinner,
      child: Positioned(
        top: (height * 0.5) - 75,
        left: (width * 0.5) - 75,
        child: Image.asset('images/loader_gif.gif', width: 150, height: 150, fit: BoxFit.contain,),

      ),
    );
  }
}