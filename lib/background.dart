import 'package:flutter/material.dart';
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,

  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size; //this size provide us total height and width of our screen

    return Container(
      height: double.infinity,
      child:  Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/maintop.png',width: size.width*0.3,),
          ),
          Positioned(
            bottom:0,
            left: 0,
            child: Image.asset('assets/images/mainbottom.png',width: size.width*0.2),
          ),
          /*Positioned(


            left: 0,
            child: Image.asset('assets/images/mainbottom.png',width: size.width*0.2),
          ),*/
        ],
      ),
    );
  }
}