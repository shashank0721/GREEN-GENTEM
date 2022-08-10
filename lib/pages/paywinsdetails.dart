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

class PayWinsDetails extends StatefulWidget {
  static const id = "/PayWinsDetails";
  // const ProductsDetails({Key? key}) : super(key: key);
  @override
  State<PayWinsDetails> createState() => _PayWinsDetails();
}

class _PayWinsDetails extends State<PayWinsDetails> {
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
    var MONEY_PAID = data["MONEY PAID"];
    var USER_ID = data["USER ID"];
    var MAXIMUM_BID_ID = data["MAXIMUM BID ID"];
    var v;
    int max = 0;
    var maximumbid = new TextEditingController();
    var maximumbidid = new TextEditingController();
    double num = 1.3* int.parse(MAXIMUM_BID);
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
                  height: 100,
                ),
                Text(
                                          'The money should be transferred to \nGreen Gentem UPI ID from where it\nwill be traansferred to Seller \nonce product is shipped.',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17.5,
                                            //fontWeight: FontWeight.bold
                                          ),
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
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                      child: Text('PAY to Green Gentem',
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
                      child: Text('Green Gentem Paytm Number : xxxxxxxxxx',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Green Gentem GooglePe Number : xxxxxxxxxx',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text('Amount to be Paid: $num INR',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                      child: Text(
                          '*includes GST and all other taxes & charges ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,

                            fontSize: 12,
                            //fontWeight: FontWeight.bold
                          )),
                    )
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
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                      child: Text('Product Details',
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
                      child: Text('Bidding Details',
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
                      child: Text('Bid Ending Amount : $MAXIMUM_BID INR',
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
                      child: Text('Bid Winner : $MAXIMUM_BID_ID',
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
                      child: Text('Seller ID : $USER_ID',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}