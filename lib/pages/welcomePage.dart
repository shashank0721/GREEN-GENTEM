import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gg_1/pages/aboutUs.dart';
import 'package:gg_1/pages/auction.dart';
import 'package:gg_1/pages/category.dart';

import 'package:gg_1/pages/contactUs.dart';
import 'package:gg_1/pages/guidelines.dart';

import 'package:gg_1/pages/login_page.dart';
import 'package:gg_1/pages/option.dart';

import 'collab.dart';



class WelcomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
          drawer: Drawer(
          
          child: Container(
              // decoration: BoxDecoration(
              //   image: new DecorationImage(image: AssetImage('assets/bg.jpg',),
              //       fit: BoxFit.cover),),
              
            color: const Color.fromARGB(255, 71, 190, 35),
            child: ListView(
              children: <Widget>[
                
                ListTile(
                  leading: Icon(Icons.close, color: Colors.white, size: 25,),
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                ),
                Divider(color: Colors.black,),
                ListTile(
                  leading: Icon(Icons.people, color: Colors.white, size: 20,),
                  title: Text('Team & Collaboration', style: TextStyle(color: Colors.white,fontSize: 15),),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => Collab())
                         );
                  },
                ),
                
                Divider(color: Colors.black,),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.white, size: 20,),
                  title: Text('About Us', style: TextStyle(color: Colors.white,fontSize: 15),),
                  onTap: (){
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder:(context) => AboutUs())
                         );
                  },
                ),
                Divider(color: Colors.black,),
                ListTile(
                  leading: Icon(Icons.mail, color: Colors.white, size: 20,),
                  title: Text('Contact us', style: TextStyle(color: Colors.white,fontSize: 15),),
                  onTap: (){
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder:(context) => ContactUs())
                         );
                  },
                ),
                Divider(color: Colors.black,),
                ListTile(
                  leading: Icon(Icons.book,color: Colors.white, size: 25,),
                  title: Text('Legal info', style: TextStyle(color: Colors.white,fontSize: 15),),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => Collab())
                         );
                  },
                ),
                Divider(color: Colors.black,),
                //Image(image: AssetImage("assets/bg2.png"),height: 350,width: 400),
              ],
            ),

          ),
        ),
        appBar: AppBar(
            toolbarHeight: 150,
            centerTitle:true,
            leading: Container(
              alignment: Alignment.topLeft,
              child: Builder (
                  builder:(context) => IconButton(
                      onPressed: (){
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu, color: Colors.black,size: 35,))),
            ),
            flexibleSpace: Container(),
            title: Image.asset('assets/logo.png',height: 125, width: 250, alignment: Alignment.bottomCenter,),
            backgroundColor: Colors.white.withOpacity(0.75),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))
            )
        ),

        body:

           Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child:Image.asset('assets/bg.jpg',
                    fit: BoxFit.cover),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: SizedBox(height: 275,),
                    ),
                    FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=> LoginPage())
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        color: Color.fromARGB(255, 71, 190, 35),
                        padding: EdgeInsets.all(10),
                        child: Text('               Explore with us           >  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                    ),
                    SizedBox(height: 40,),
                    FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=> Guideline())
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        color: Color.fromARGB(255, 71, 190, 35),
                        padding: EdgeInsets.all(10),
                        child: Text('       How to Recycle with us     >  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                    ),

                    SizedBox(height: 140,),
                    Text('© Copyright Green Gentem. All rights Reserved',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:15,
                      ),)
                  ],
                ),
              )
            ],
          ),


        )






    );
  }
}