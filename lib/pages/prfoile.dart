import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gg_1/pages/option.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override

  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? email = "";
  String? companyName = "";
  String? phoneNumber = "";

  String? companyAddress = "";
  String? country = "";
  String? userEmailId = "";
  String? _role = "";
  int? role = 0;

  Future _getDataFromFirestore() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          email = snapshot.data()!["email"];
          companyAddress = snapshot.data()!["user address"];
          companyName = snapshot.data()!["username"];

          country = snapshot.data()!["country"];
          phoneNumber = snapshot.data()!["phone number"];
          role = snapshot.data()!["role"];
          if (role == 0) {
            _role = "None";
          } else if (role == 1) {
            _role = "Trader";
          } else if (role == 2) {
            _role = "Recycler";
          } else if (role == 3) {
            _role = "Dismantler";
          }
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromFirestore();
  }

  Future _updateEmailId() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({
      'email': userEmailId,
    });
  }

  Future _updatePhoneNumber() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({
      'phone number': phoneNumber,
    });
  }

  _displayTextInputDialogEmailId(BuildContext context) async {
    return showDialog(
      
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update your Email-Id here."),
            content: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  userEmailId = value;
                });
              },
              decoration: InputDecoration(hintText: "Type here"),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 8, 73, 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    _updateEmailId();
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Profile()));
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 8, 73, 18)),
                ),
              )
            ],
          );
        });
  }

  _displayTextInputDialogPhoneNumber(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update your Phone Number here"),
            content: TextField(
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
              decoration: InputDecoration(hintText: "Type here"),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 8, 73, 18)),
              ),
              ElevatedButton(
                onPressed: () {
                  _updatePhoneNumber();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Profile()));
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 8, 73, 18)),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      
        color: Color.fromARGB(255, 234, 244, 230),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 234, 244, 230),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle:true,
            leading: Container(
              alignment: Alignment.topLeft,
              child: Builder (
                  builder:(context) => IconButton(
                      onPressed: (){
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => Option())
                         );
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.black,size: 35,))),
            ),
            
            
            flexibleSpace: Container(),
            title:  Text('PROFILE',
            textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
            backgroundColor: Color.fromARGB(255, 71, 190, 35).withOpacity(0.75),
           // Colors.white.withOpacity(0.75),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(100))
            )
        ),
          body: SingleChildScrollView(
              child: SafeArea(
                  child: Column(
            children: [
              
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Username :- " + companyName!,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "User Address :- " + companyAddress!,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Email-Id :- " + email!,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.topRight,
                      onPressed: () {
                        _displayTextInputDialogEmailId(context);
                      },
                      icon: Icon(Icons.create_rounded),
                    )
                  ],
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Phone Number :- " + phoneNumber!,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.topRight,
                      onPressed: () {
                        _displayTextInputDialogPhoneNumber(context);
                      },
                      icon: Icon(Icons.create_rounded),
                    )
                  ],
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Role :- " + _role!,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // SizedBox(height: 15),
              // Padding(
              //   padding: const EdgeInsets.all(13.0),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Expanded(
              //         child: Text(
              //           "Company Owner :- " + companyAddress!,
              //           style: TextStyle(fontSize: 18, color: Colors.black),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Back"),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 8, 73, 18),
                        side: const BorderSide(
                            width: 3,
                            color: const Color.fromARGB(255, 8, 73, 18)),
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 150, vertical: 15)),
                  )
                ],
              )
            ],
          ))),
        ));
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:gg_1/pages/option.dart';

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   String? email = "";
//   String? userName = "";
//   String? phoneNumber = "";
//   String? companyOwner = "";
//   String? userAddress = "";
//   String? country = "";
//   String? userEmailId = "";
//   String? _role = "";
//   int? role = 0;

//   Future _getDataFromFirestore() async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(FirebaseAuth.instance.currentUser?.email)
//         .get()
//         .then((snapshot) async {
//       if (snapshot.exists) {
//         setState(() {
//           email = snapshot.data()!["email"];
//           userAddress = snapshot.data()!["company address"];
//           userName = snapshot.data()!["company name"];
//           companyOwner = snapshot.data()!["company owner"];
//           country = snapshot.data()!["country"];
//           phoneNumber = snapshot.data()!["phone number"];
//           role = snapshot.data()!["role"];
//           if (role == 0) {
//             _role = "None";
//           } else if (role == 1) {
//             _role = "Trader";
//           } else if (role == 2) {
//             _role = "Recycler";
//           } else if (role == 3) {
//             _role = "Dismantler";
//           }
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getDataFromFirestore();
//   }

//   Future _updateEmailId() async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(FirebaseAuth.instance.currentUser!.email)
//         .update({
//       'email': userEmailId,
//     });
//   }

//   Future _updatePhoneNumber() async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(FirebaseAuth.instance.currentUser!.email)
//         .update({
//       'phone number': phoneNumber,
//     });
//   }

//   _displayTextInputDialogEmailId(BuildContext context) async {
//     return showDialog(
      
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Update your Email-Id here."),
//             content: TextField(
//               keyboardType: TextInputType.emailAddress,
//               onChanged: (value) {
//                 setState(() {
//                   userEmailId = value;
//                 });
//               },
//               decoration: InputDecoration(hintText: "Type here"),
//             ),
//             actions: [
//               Padding(
//                 padding: EdgeInsets.only(left: 0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       Navigator.pop(context);
//                     });
//                   },
//                   child: Text(
//                     "Cancel",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color.fromARGB(255, 8, 73, 18),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 0.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _updateEmailId();
//                     Navigator.push(
//                         context, MaterialPageRoute(builder: (_) => Profile()));
//                   },
//                   child: Text(
//                     "Save",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       primary: Color.fromARGB(255, 8, 73, 18)),
//                 ),
//               )
//             ],
//           );
//         });
//   }

//   _displayTextInputDialogPhoneNumber(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Update your Phone Number here"),
//             content: TextField(
//               keyboardType: TextInputType.phone,
//               onChanged: (value) {
//                 setState(() {
//                   phoneNumber = value;
//                 });
//               },
//               decoration: InputDecoration(hintText: "Type here"),
//             ),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     Navigator.pop(context);
//                   });
//                 },
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     primary: const Color.fromARGB(255, 71, 190, 35).withOpacity(0.75)),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _updatePhoneNumber();
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => Profile()));
//                 },
//                 child: Text(
//                   "Save",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     primary: const Color.fromARGB(255, 71, 190, 35).withOpacity(0.75)),
//               )
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
      
//         color: Color.fromARGB(255, 234, 244, 230),
//         child: Scaffold(
//           backgroundColor: const Color.fromARGB(255, 234, 244, 230),
//           resizeToAvoidBottomInset: false,
//           

        
//           body: SingleChildScrollView(
//               child: SafeArea(
//                   child: Column(
//             children: [
              
              
//               Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 32, vertical: 32)),
//               Padding(
//                 padding: const EdgeInsets.all(13.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "Email-Id :- " + email!,
//                         style: TextStyle(fontSize: 18, color: Colors.black),
//                       ),
//                     ),
//                     IconButton(
//                       alignment: Alignment.topRight,
//                       onPressed: () {
//                         _displayTextInputDialogEmailId(context);
//                       },
//                       icon: Icon(Icons.create_rounded),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 15),
//               Padding(
//                 padding: const EdgeInsets.all(13.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "Phone Number :- " + phoneNumber!,
//                         style: TextStyle(fontSize: 18, color: Colors.black),
//                       ),
//                     ),
//                     IconButton(
//                       alignment: Alignment.topRight,
//                       onPressed: () {
//                         _displayTextInputDialogPhoneNumber(context);
//                       },
//                       icon: Icon(Icons.create_rounded),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 1.5),
//               Padding(
//                 padding: const EdgeInsets.all(13.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "Role :- " + _role!,
//                         style: TextStyle(fontSize: 18, color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               SizedBox(height: 15),
//               Padding(
//                 padding: const EdgeInsets.all(13.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "User Name :- " + userAddress!,
//                         style: TextStyle(fontSize: 18, color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 15),
//               Padding(
//                 padding: const EdgeInsets.all(13.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "User Address :- " + userAddress!,
//                         style: TextStyle(fontSize: 18, color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Column(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text("Back"),
//                     style: ElevatedButton.styleFrom(
//                         primary:  Color.fromARGB(255, 71, 190, 35),
//                         side: const BorderSide(
//                             width: 3,
//                             color:  Color.fromARGB(255, 71, 190, 35)),
//                         elevation: 30,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 150, vertical: 15)),
//                   )
//                 ],
//               )
//             ],
//           ))),
//         ));
//   }
// }