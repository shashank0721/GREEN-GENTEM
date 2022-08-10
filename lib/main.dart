import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gg_1/pages/BuyHistoryDetails.dart';
import 'package:gg_1/pages/Buyhistory.dart';
import 'package:gg_1/pages/LiveCollectionTracking.dart';
import 'package:gg_1/pages/LiveDeliveryTracking.dart';
import 'package:gg_1/pages/SellHistoryDetails.dart';
import 'package:gg_1/pages/Sellhistory.dart';
import 'package:gg_1/pages/aboutUs.dart';
import 'package:gg_1/pages/allproduct.dart';
import 'package:gg_1/pages/category.dart';
import 'package:gg_1/pages/collab.dart';
import 'package:gg_1/pages/contactUs.dart';
import 'package:gg_1/pages/login_page.dart';
import 'package:gg_1/pages/option.dart';
import 'package:gg_1/pages/payduesdetails.dart';
import 'package:gg_1/pages/paywinsdetails.dart';
import 'package:gg_1/pages/prfoile.dart';
import 'package:gg_1/pages/productdetails.dart';
import 'package:gg_1/pages/productspage.dart';
import 'package:gg_1/pages/registeras.dart';
import 'package:gg_1/pages/signupbuy.dart';
import 'package:gg_1/pages/splashScreen.dart';
import 'package:gg_1/pages/welcomePage.dart';
import 'package:gg_1/pages/widgets/countdowntimer.dart';
import 'package:gg_1/pages/widgets/themes.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // theme: MyTheme.themeData,

      theme: ThemeData(fontFamily: 'Dm Sans'),
      darkTheme: MyTheme.darkTheme,
      // initialRoute: "/login",
      routes: {

        "/": (context) =>  SplashPage(duration: 3, goToPage:WelcomePage()),
        "/welcome": (context) => WelcomePage(),
        "/collab": (context) => Collab(),
        "/login": (context) => LoginPage(),
        "/aboutus": (context) => AboutUs(),
        "/registerAsPage": (context) => RegisterAsPage(),
        "/signUpBuy": (context) => RealSignUpPageBuy(),
        
        "/contactUs": (context) => ContactUs(),
        "/option": (context) => Option(),
        "/profile":(context)=>Profile(),
        ProductsPage.id : (context)=> ProductsPage(),
        AllProduct.id : (context)=> AllProduct(),
        ProductsDetails.id : (context)=> ProductsDetails(),
        BuyHistoryDetails.id : (context)=> BuyHistoryDetails(),
        SellHistoryDetails.id : (context)=> SellHistoryDetails(),
        PayWinsDetails.id : (context)=> PayWinsDetails(),
        PayDueDetails.id : (context)=> PayDueDetails(),
        LiveDeliveryTracking.id : (context)=> LiveDeliveryTracking(),
        LiveCollectionTracking.id : (context)=> LiveCollectionTracking(),
        
      },
    );
  }
}


