import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Collab extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      
      body: Container( 
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration( 
          gradient: LinearGradient( 
            colors: [Color.fromARGB(255, 26, 112, 29), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView( 
          children: <Widget>[ 
            const SizedBox(height: 20,),
            Text('Our Global Team',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:42,
                        fontWeight: FontWeight.bold)),
                       
                       const SizedBox(height: 30,),
                       CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/pic1.png"),

                       ),
                       const SizedBox(height: 20,),
                        Text('M.Sc.Avinash Kandalam',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:20,fontWeight: FontWeight.bold)),
                       
                       
                       Text('Founder and Tech Lead',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:15,)),
                        SizedBox(height: 30),
                         CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/pic1.png"),

                       ),
                       const SizedBox(height: 20,),
                        Text('Dr.rer.nat.Hripsime Gevorgyan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:20,fontWeight: FontWeight.bold)),
                       
                       
                       Text('Co-Founder ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:15,)),
                         SizedBox(height: 30),
                         CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/pic1.png"),

                       ),
                       const SizedBox(height: 20,),
                        Text('M.Sc.Golam Muktadir',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:20,fontWeight: FontWeight.bold)),
                       
                       
                       Text('Co-Founder',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:15,)),
                         SizedBox(height: 30),
                         CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/pic1.png"),

                       ),
                       const SizedBox(height: 20,),
                        Text('Ms.Sania Ahmed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:20,fontWeight: FontWeight.bold)),
                       
                       
                       Text('Legal and Finance Head',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:15,)),
                         SizedBox(height: 30),
                         CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/pic1.png"),

                       ),
                       const SizedBox(height: 20,),
                        Text('M.Sc.Sayan Chatterjee',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:20,fontWeight: FontWeight.bold)),
                       
                       
                       Text('Director and Software Lead',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:15,)),
                        SizedBox(height: 40),
                        Text('Collaborations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:42,
                        fontWeight: FontWeight.bold)),
                        SizedBox(height: 40),
                        Image(image: AssetImage("assets/collaborator1.png"),height: 100,width: 100,),
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/collaborator2.png"),height: 100,width: 100),
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/collaborator3.png"),height: 100,width: 100),
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/collaborator4.png"),height: 100,width: 100),
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/collaborator5.png"),height: 100,width: 100),
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/collaborator6.png"),height: 100,width: 100),
                        SizedBox(height: 20),
                         Text('© Copyright Green Gentem. All rights Reserved',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:15,)),
                        SizedBox(height: 15),

          ]
        )

                      ),);
      
       
      
  
  }
}