import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gg_1/pages/productdetails.dart';
import 'package:gg_1/pages/widgets/countdowntimer.dart';

class ProductsPage extends StatelessWidget {
  static const id = "/Productspage";
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var category = data["CATEGORY"];
        // DateTime endTime
    var flag = 'A';
    // var URL = data["URL"];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          category,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            //fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFEAF4E6),
      body: StreamBuilder(
          stream: db
              .collection('Product under auction')
              .where("CATEGORY", isEqualTo: category)
              .where("FLAG", isEqualTo: flag)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              Fluttertoast.showToast(msg: "error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            final values = snapshot.data!.docs;

            return values.length > 0
                ? ListView.builder(
                    itemCount: values.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(7.5, 40, 5, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ProductsDetails.id, arguments: {
                              "ADDRESS": values[index]["ADDRESS"],
                              "BIDDING DURATION": values[index]
                                  ["BIDDING DURATION"],
                              "CATEGORY": values[index]["CATEGORY"],
                              "BRAND": values[index]["BRAND"],
                              "MANUFACTURING DATE": values[index]
                                  ["MANUFACTURING DATE"],
                              "MINIMUM PRICE": values[index]["MINIMUM PRICE"],
                              "MODEL NUMBER": values[index]["MODEL NUMBER"],
                              "Other category": values[index]["Other category"],
                              "PAYTM": values[index]["PAYTM"],
                              "GOOGLE PAY": values[index]["GOOGLE PAY"],
                              "Paytm Number": values[index]["Paytm Number"],
                              "GOOGLE PAY NUMBER": values[index]
                                  ["GOOGLE PAY NUMBER"],
                              "SPECIFICTIONS": values[index]["SPECIFICTIONS"],
                              "URGENT SALE": values[index]["URGENT SALE"],
                              "USER ID": values[index]["USER ID"],
                              "WORKING CONDITION": values[index]
                                  ["WORKING CONDITION"],
                              "URL": values[index]["URL"][0],
                              "MAXIMUM BID": values[index]["MAXIMUM BID"],
                              "MAXIMUM BID ID": values[index]["MAXIMUM BID ID"],
                              "BIDDING END": values[index]["BIDDING END"],
                              "FLAG": values[index]["FLAG"],
                            });
                          },
                          child: Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Image.network(
                                        values[index]['URL'][0],
                                        height: 200,
                                        width: 225,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                          //top: 0,
                                          bottom: 0,
                                          right: 0,
                                          left: 0,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black87,
                                            ),
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        Text(
                                          values[index]['CATEGORY'],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.5,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Brand :',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 15,
                                                //fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text(
                                          values[index]['BRAND'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                          ],
                                        ),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        // Text(
                                        //   'Model Number :',
                                        //   textAlign: TextAlign.left,
                                        //   style: TextStyle(
                                        //     color: Colors.blue,
                                        //     fontSize: 15,
                                        //     //fontWeight: FontWeight.bold
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        // Text(
                                        //   values[index]['MODEL NUMBER'],
                                        //   textAlign: TextAlign.left,
                                        //   style: TextStyle(
                                        //     color: Colors.black,
                                        //     fontSize: 15,
                                        //     //fontWeight: FontWeight.bold
                                        //   ),
                                        // ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Manufacturing Date :',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          values[index]['MANUFACTURING DATE'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Live Bid Price :',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              values[index]['MAXIMUM BID'],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '  INR',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Time Left',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // Row(
                                        //   children: [
                                        //     CountDownTimer(
                                        //     url: 'Null',
                                        //     endTime: endTime,
                                        //   ),
                                        //     // Text(
                                        //     //   values[index]['MAXIMUM BID'],
                                        //     //   textAlign: TextAlign.left,
                                        //     //   style: TextStyle(
                                        //     //       color: Colors.black,
                                        //     //       fontSize: 20,
                                        //     //       fontWeight: FontWeight.bold),
                                        //     // ),
                                        //     // Text(
                                        //     //   '  INR',
                                        //     //   textAlign: TextAlign.left,
                                        //     //   style: TextStyle(
                                        //     //       color: Colors.black,
                                        //     //       fontSize: 20,
                                        //     //       fontWeight: FontWeight.bold),
                                        //     // ),
                                        //   ],
                                        // ),
                                        
                                        Divider(
                                          color: Colors.black,
                                          height: 10,
                                          thickness: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Text(
                      'No Product Listed For Auction',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  );
          }),
    );
  }
}
