import 'package:flutter/material.dart';
import 'package:gg_1/pages/Buyhistory.dart';
import 'package:gg_1/pages/Sellhistory.dart';
import 'package:gg_1/pages/auction.dart';
import 'package:gg_1/pages/category.dart';
import 'package:gg_1/pages/delivery.dart';

import 'package:gg_1/pages/home.dart';
import 'package:gg_1/pages/livebid.dart';
import 'package:gg_1/pages/payments.dart';
import 'package:gg_1/pages/prfoile.dart';
import 'package:gg_1/pages/registeras.dart';
import 'package:gg_1/pages/welcomePage.dart';

import 'aboutUs.dart';
import 'collab.dart';
import 'contactUs.dart';
import 'myproducts.dart';

class Option extends StatefulWidget
{
  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  int currentIndex=0;
  final screens= [
    Home(),
    Myproducts(),
    Mylivebid(),
    Payments(),
    delivery(),

  ]; 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
          child: Container(
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
                  leading: Icon(Icons.history, color: Colors.white, size: 20,),
                  title: Text('My Buy History', style: TextStyle(color: Colors.white,fontSize: 15),),
                  onTap: (){
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder:(context) => BuyHistory())
                         );
                  },
                ),
                Divider(color: Colors.black,),
                ListTile(
                  leading: Icon(Icons.history_edu_rounded, color: Colors.white, size: 20,),
                  title: Text('My Sell History', style: TextStyle(color: Colors.white,fontSize: 15),),
                  onTap: (){
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder:(context) => SellHistory())
                         );
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
                  title: Text('Contact Us', style: TextStyle(color: Colors.white,fontSize: 15),),
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
                  leading: Icon(Icons.logout,color: Colors.white, size: 25,),
                  title: Text('Logout', style: TextStyle(color: Colors.white,fontSize: 15),),
                  onTap: (){
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder:(context) => WelcomePage())
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
            
            actions: [
              Container(
              alignment: Alignment.topRight,
              child: Builder (
                  builder:(context) => IconButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed("/profile",
                                //arguments: {"userid":userID}
                                );
                      },
                      icon: Icon(Icons.account_circle_rounded, color: Colors.black,size: 35,))),
                      
            ),
            ],
            flexibleSpace: Container(),
            title: Image.asset('assets/logo.png',height: 125, width: 250, alignment: Alignment.bottomCenter,),
            backgroundColor: Colors.white.withOpacity(0.75),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))
            )
        ),
        
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          //Color.fromARGB(255, 71, 190, 35).withOpacity(0),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index)=> setState(()=>currentIndex = index),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.recycling),
              label: 'Products',
              ),
              // BottomNavigationBarItem(
              // icon: Icon(Icons.favorite),
              // label: 'Favourite',
              // ),
              
              BottomNavigationBarItem(
              icon: Icon(Icons.list,),
              label: 'Live Bid',
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Payments',
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining),
              label: 'Delivery',
              ),

          ],
        ),
        body: screens[currentIndex]
        
        );
    
  }
}