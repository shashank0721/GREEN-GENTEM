import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gg_1/pages/auction.dart';
import 'package:gg_1/pages/category.dart';
import 'package:gg_1/pages/registeras.dart';
import 'package:gg_1/pages/welcomePage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset('assets/bg.jpg', fit: BoxFit.cover),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: SizedBox(
                        height: 275,
                      ),
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Auction()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: Color.fromARGB(255, 71, 190, 35),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '               Sell e-waste           >  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    FlatButton(
                        onPressed: () async {
                          User? user = FirebaseAuth.instance.currentUser;
                          DocumentReference ref = FirebaseFirestore.instance
                              .collection('users')
                              .doc(user?.email);
                          var userData =
                              (await ref.get()).data() as Map<String, dynamic>;
                          bool isLicenseUploaded;
                          bool isform;
                          bool isUploadPressed;                         
                          isLicenseUploaded = userData['isLicenseUploaded'];
                          isform = userData['isform'];
                          isUploadPressed = userData['isUploadPressed'];
                          print(isLicenseUploaded);
                          print(isform);

                          if (isform == true &&
                              isLicenseUploaded == true &&
                              isUploadPressed == true) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => categoryPage()));
                          } else if (isform == true &&
                              isLicenseUploaded == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("License under verification")));
                          } else if ((isform == false &&
                                  isLicenseUploaded == true) ||
                              isUploadPressed == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Incomplete Registration')));

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterAsPage()));
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: Color.fromARGB(255, 71, 190, 35),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '               Buy e-waste           >  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                    SizedBox(
                      height: 75,
                    ),
                    Text(
                      '© Copyright Green Gentem. All rights Reserved',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
