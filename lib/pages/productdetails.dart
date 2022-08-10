import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gg_1/pages/SplashScreen4.dart';
import 'package:gg_1/pages/category.dart';
import 'package:gg_1/pages/option.dart';
import 'package:gg_1/pages/productspage.dart';
import 'package:gg_1/pages/splashScreen3.dart';
import 'package:gg_1/pages/widgets/countdowntimer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductsDetails extends StatefulWidget {
  static const id = "/Productsdetails";
  // const ProductsDetails({Key? key}) : super(key: key);
  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  String? email = "";
  String? Url = "";
  String? maximum = "";
  String _fName = 'a';
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var ADDRESS = data["ADDRESS"];
    var BIDDING_DURATION = data["BIDDING DURATION"];
    var CATEGORY = data["CATEGORY"];
    var BRAND = data["BRAND"];
    var MANUFACTURING_DATE = data["MANUFACTURING DATE"];
    var MINIMUM_PRICE = data["MINIMUM PRICE"];
    var MODEL_NUMBER = data["MODEL NUMBER"];
    var Other_category = data["Other category"];
    var PAYTM = data["PAYTM"];
    var GOOGLE_PAY = data["GOOGLE PAY"];
    var Paytm_Number = data["Paytm Number"];
    var GOOGLE_PAY_NUMBER = data["GOOGLE PAY NUMBER"];
    var SPECIFICTIONS = data["SPECIFICTIONS"];
    var URGENT_SALE = data["URGENT SALE"];
    var WORKING_CONDITION = data["WORKING CONDITION"];
    var URL = data["URL"];
    var FLAG = data["FLAG"];
    var MAXIMUM_BID = data["MAXIMUM BID"];
    var MAXIMUM_BID_ID = data["MAXIMUM BID ID"];
    var v;
    int max = 0;
    String amount_str='a';
    double amount = 1;
    var maximumbid = new TextEditingController();
    var maximumbidid = new TextEditingController();
    int num = int.parse(MAXIMUM_BID);
    DateTime endTime = DateTime.parse(data["BIDDING END"]);

    print(URL);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(CATEGORY,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                //fontWeight: FontWeight.bold
              )),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xFFEAF4E6),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFEAF4E6),
            child: Column(
              children: [
                // buildTimer(),
                //SizedBox(height:200),

                SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.network(
                        URL,
                        height: 300,
                        width: 400,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                  height: 2,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Brand : $BRAND',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text(SPECIFICTIONS,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Starting Price : $MINIMUM_PRICE INR',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Other Category : $Other_category',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Model Number : $MODEL_NUMBER',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
                
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Manufacturing Date : $MANUFACTURING_DATE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('In Working Condition : $WORKING_CONDITION',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                      child: Text('Other details of Seller',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Paytm Number : $Paytm_Number',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Google Pay Number : $GOOGLE_PAY_NUMBER',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Seller Address : $ADDRESS',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                      child: Text('Live Bidding Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Time Left :',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        
                        child: CountDownTimer(
                          url: URL,
                          endTime: endTime,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Current Highest Bid : $MAXIMUM_BID INR',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Highest Bidder Id : $MAXIMUM_BID_ID',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                      child: Text('Place Your Bid',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Enter your Bidding Amount',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 71, 190, 35),

                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFormField(
                            //controller: int.parse(maximumbid.text),
                            controller: maximumbid,
                            onChanged: (s) {
                              int s = int.parse(maximumbid.text);
                              max = s;
                              // amount =1.3*max;
                              // amount_str= amount.toString();
                              // setState(() {
                                
                              // });
                            },
                            decoration: InputDecoration(
                              hintText: "Amount in Ruppes",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                //borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                      child: Center(
                        child: Text(
                            '*Final pay amount will include GST, Service\nand Logistic Charges around 30%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,

                              fontSize: 12,
                              //fontWeight: FontWeight.bold
                            )),
                      ),
                    )
                  ],
                ),
                
                //int var =int.parse(maximumbid.text);
                //i = int.parse(e),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Enter your Email id to confirm ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 71, 190, 35),
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
                //test =int.parse(maximumbid),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Center(
                        child: SizedBox(
                          height: 60,
                          width: 200,
                          child: TextFormField(
                              controller: maximumbidid,

                              //  onChanged: (e)=> manufacturing.text=e,
                              decoration: InputDecoration(
                                hintText: "User@gmail.com",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  //borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                      child: Text(
                          '*You can\'t edit or withdraw your bid once placed',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,

                            fontSize: 12,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),

                
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                //       child: Text('Approximate Paying Amount : ${amount_str}',
                //           style: TextStyle(
                //               color: Colors.blue,
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold)),
                //     )
                //   ],
                // ),
                

                
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        onPressed: () async {
                         
                            if (max > num) {
                            await FirebaseFirestore.instance
                                .collection('Product under auction')
                                .where("URL", isEqualTo: [URL])
                                .get()
                                .then((value) => (value.docs.forEach((element) {
                                      v = element.id;
                                    })));

                            print(maximumbid);
                            await FirebaseFirestore.instance
                                .collection('Product under auction')
                                .doc(v)
                                .update({
                              "MAXIMUM BID": maximumbid.text,
                              "MAXIMUM BID ID": maximumbidid.text
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SplashPage3(
                                        duration3: 3,
                                        goToPage3: categoryPage())));
                          } 
                           else {
                            print('yesterday');
                            print(max);
                            print(num);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SplashPage4(
                                        duration4: 3,
                                        goToPage4: categoryPage())));
                                        
                                        
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: Color.fromARGB(255, 71, 190, 35),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '     Submit      ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
