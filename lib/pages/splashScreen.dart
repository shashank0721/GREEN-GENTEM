import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';


class SplashPage extends StatelessWidget{
  int duration=0;
  Widget goToPage;

  SplashPage({ required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context)
  {
    Future.delayed(Duration(seconds: this.duration),(){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage )
      );
    });
    return Scaffold(
        body: Container(
            color:Colors.black,
            child: Center(
                child: Icon(Icons.recycling_sharp, color: Color(0xFF80C038), size:100))
        )
    );
  }
}