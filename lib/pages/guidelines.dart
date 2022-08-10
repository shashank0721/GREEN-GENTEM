import 'package:flutter/material.dart';

class Guideline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.transparent;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          //toolbarHeight: 150,
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
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
                          height: 30,
                        ),
                      ),
                      Text(
                        'GUIDELINES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "The app starts with the Homepage. It shows two options -	Sign Up or Already Registered(Login Page). A seller doesn’t require any registration whereas a buyer is supposed to upload a license certificate in order to purchase e-waste.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'About Buyer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "   A buyer(after registration and verification of the license) can go to the “Categories Page” where he/she can bid their price for the required product. Once the timeline for the bid is done, the highest bidder wins and he/she can proceed with the payment to get the product delivered.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'About Seller',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "   A seller will first give the details of the product. Then they are led to the Auction Page and once they confirm all the details, they will get a message to wait for further information.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '© Copyright Green Gentem. All rights Reserved',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}