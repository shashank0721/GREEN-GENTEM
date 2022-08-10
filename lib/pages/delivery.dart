import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gg_1/pages/collectiontrack.dart';
import 'package:gg_1/pages/deliverytrack.dart';
import 'package:gg_1/pages/paydues.dart';
import 'package:gg_1/pages/paywins.dart';

class delivery extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                     SizedBox(height: 25,),
                    FlatButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => deliverytrack()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        color: Color.fromARGB(255, 71, 190, 35),
                        padding: EdgeInsets.all(10),
                        child: Text('               Product Delivery           >  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                    ),
                    SizedBox(height: 50,),
                    FlatButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => collectiontrack()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        color: Color.fromARGB(255, 71, 190, 35),
                        padding: EdgeInsets.all(10),
                        child: Text('              Product Collection          >  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                    ),
                    
                    SizedBox(height: 75,),
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