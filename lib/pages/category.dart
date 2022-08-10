import 'package:flutter/material.dart';
import 'package:gg_1/pages/allproduct.dart';
import 'package:gg_1/pages/option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gg_1/pages/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gg_1/pages/productdetails.dart';
import 'package:gg_1/pages/productspage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
//import 'package:flutter/rendering.dart';


class categoryPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            
            onPressed: ()=> Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=> Option())
                          )
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
          body: Container(
            decoration: BoxDecoration(
              image: new DecorationImage(image: AssetImage('assets/bg.jpg',),
                     fit: BoxFit.cover),
            ),
                                    // color: Color.fromARGB(255, 76, 157, 44),
            child: Container(
              child: Column(
                children: [
                  
                  SizedBox(height: 60,),
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30,15,30,10),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text('Categories',
                      textAlign: TextAlign.left,
                        style:TextStyle(
                           color: Colors.white,
                           fontSize:30,
                          fontWeight: FontWeight.bold
                                   )),
                    ),
                  ),
                  // Padding(
                  //  padding: const EdgeInsets.fromLTRB(30,15,30,10),
                  //  child: TextFormField(
                  //   //controller: userID,
                  //   //validator: (e)=>  e!.isEmpty ? "Field is empty":null,
                  //   // onChanged: (e)=> Manufacturing.text=e,
                  //    decoration: InputDecoration(
                  //      hintText: "Search",
                  //      border: OutlineInputBorder(
                  //        borderRadius: BorderRadius.circular(20), 
                  //        borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
                  //      ),
                  //      filled: true,
                  //      fillColor: Color(0xFFD7F4CD),
                  //  )
                  //  ),
                  // ),
                  SizedBox(height: 30,),
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30,15,30,10),
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                        Column(
                           children: [
                             InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(AllProduct.id,
                                arguments: {"CATEGORY":'ALL PRODUCTS'});
                              },
                               child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/all.png"),
                                  
                                 ),
                             ),
                               SizedBox(height: 5,),
                               Text('     All\nProducts',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                           ],
                         ),
                           SizedBox(width:10,),
                         Column(
                           children: [
                             InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                arguments: {"CATEGORY":'Washing Machines'});
                              },
                               child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/wm.png"),
                                  
                                 ),
                             ),
                               SizedBox(height: 5,),
                               Text('Washing\nMachine',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                           ],
                         ),
                           SizedBox(width:10,),
                           Column(
                             children: [
                               InkWell(
                                onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                arguments: {"CATEGORY":'Vaccum Cleaner'});
                              },
                                 child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/vc.png"),                          
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Text('Vaccum\nCleaner',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                             ],
                           ),
                           SizedBox(width:10,),
                           Column(
                             children: [
                               InkWell(
                                onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                arguments: {"CATEGORY":'TV sets'});
                              },
                                 child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/tv.png"),
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Text('Tv sets\n ',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                             ],
                           ),
                           SizedBox(width:10,),
                           
                    ],),
                    
                  ),
                  SizedBox(height: 10,),
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30,15,30,10),
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                         Column(
                           children: [
                             InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                arguments: {"CATEGORY":'Laptops/Desktops'});
                              },
                               child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/laptop.png"),
                                 ),
                             ),
                               SizedBox(height: 5,),
                               Text('Laptop/\nDesktops',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                           ],
                         ),
                           SizedBox(width:10,),
                           Column(
                             children: [
                               InkWell(
                                onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                arguments: {"CATEGORY":'Mobile Phones'});
                              },
                                 child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/mobile.png"),                          
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Text(' Mobile\nPhones',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                             ],
                           ),
                           SizedBox(width:10,),
                           Column(
                             children: [
                               InkWell(
                                onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                arguments: {"CATEGORY":'Kitchen'});
                              },
                                 child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/ref.png"),
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Text('Kitchen\n ',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                             ],
                           ),
                           SizedBox(width:10,),
                           Column(
                             children: [
                               InkWell(
                                onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                arguments: {"CATEGORY":'Iron'});
                              },
                                 child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/iron.png",),
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Text('Iron\n ',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                             ],
                           ),
                    ],),
                    
                  ),
                  SizedBox(height: 10,),
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30,15,30,10),
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                         Column(
                           children: [
                             InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                 arguments: {"CATEGORY":'Electronic Tools'});
                              },
                               child: CircleAvatar( 
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/tools.png"),
                                 ),
                             ),
                               SizedBox(height: 5,),
                               
                               Text('Electronic\n  Tools',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                           ],
                         ),
                           SizedBox(width:10,),
                           Column(
                             children: [
                               InkWell(
                                onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                 arguments: {"CATEGORY":'Medical Equipments'});
                              },
                                 child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/md.png"),                          
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Text(' Medical\nEquipment',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                             ],
                           ),
                           SizedBox(width:10,),
                           Column(
                             children: [
                               InkWell(
                                onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                arguments: {"CATEGORY":'Lighting Equipments'});
                              },
                                 child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/le.png"),
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Text(' Lighting\nEquipment ',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                             ],
                           ),
                           SizedBox(width:10,),
                           Column(
                             children: [
                               InkWell(
                                onTap: (){
                                Navigator.of(context).pushNamed(ProductsPage.id,
                                arguments: {"CATEGORY":'Others'});
                              },
                                 child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundColor: Color(0xFFD7F4CD),
                                  backgroundImage: AssetImage("assets/other.png",),
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Text('Other\n ',style:TextStyle(
                             color: Colors.white,
                             fontSize:15,
                            //fontWeight: FontWeight.bold
                                     )),
                             ],
                           ),
                    ],),
                    
                  ),
                  
                 

              ],),
            )

          ),
    );
    
  }
 

}
