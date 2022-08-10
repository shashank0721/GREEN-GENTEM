// import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gg_1/fire_store.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:gg_1/pages/option.dart';
import 'package:gg_1/pages/spalshscreen2.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Auction extends StatefulWidget{ 
  @override
  _AddProductPageState createState() => _AddProductPageState();
}
class _AddProductPageState extends State<Auction> {
  var userID=new TextEditingController();
  var selectedcategory=new TextEditingController();
  var others=new TextEditingController();
  var brand=new TextEditingController();
  var model=new TextEditingController();
  var manufacturing=new TextEditingController();
  var specifications=new TextEditingController();
  bool isworking = false;
  var minimumPrice=new TextEditingController();
  var biddingDuration=new TextEditingController();
  var address=new TextEditingController();
  List<Asset> images = <Asset>[];
  List<String> imageUrls = <String>[];
  bool paytm= false;
  bool ispaid= false;
  bool isrecieved= false;
  bool productcollected= false;
  bool productdelivered= false;
  String tracking ='Yet to be collected';
  String flag='A';
  var paytmnumber=new TextEditingController();
  bool googlepay= false;
  var googlepaynumber=new TextEditingController();
   var bidend=new TextEditingController();
  String max='0';
  String userid='NULL';
  String expectedcollection='NULL';
  String expecteddelivery='NULL';
  bool urgentsale= false;
  bool termandCondition= false;
  DateTime endTime=DateTime.now();
  //final TextEditingController emailEditingController = TextEditingController();
  save() async {
    bool isValidate = _key.currentState!.validate();
      await uploadImages();
      Map<String,dynamic> data = {
                     "USER ID":userID.text,
                     "CATEGORY":selectedcategory.text,
                     "Other category":others.text,
                     "BRAND":brand.text,
                     "MODEL NUMBER":model.text,
                     "MANUFACTURING DATE":manufacturing.text,
                     "SPECIFICTIONS":specifications.text,
                     "WORKING CONDITION":isworking,
                     "MINIMUM PRICE":minimumPrice.text,
                     "BIDDING DURATION":biddingDuration.text,
                     "ADDRESS":address.text,
                     "PAYTM":paytm,
                     "Paytm Number":paytmnumber.text,
                     "GOOGLE PAY":googlepay,
                     "GOOGLE PAY NUMBER":googlepaynumber.text,
                     "URGENT SALE":urgentsale,
                     "URL":imageUrls,
                     "PRODUCT COLLECTED":productcollected,
                     "PRODUCT DELIVERED":productdelivered,
                     "EXPECTED PRODUCT COLLECTED":expectedcollection,
                     "EXPECTED PRODUCT DELIVERED":expecteddelivery,
                     "TRACKING STATUS": tracking,
                     "MONEY PAID":ispaid,
                     "MONEY RECIEVED":isrecieved,
                     "FLAG":flag,
                     "MAXIMUM BID":minimumPrice.text,
                     "MAXIMUM BID ID":userid,
                     "BIDDING END":endTime.toIso8601String()};
                    await FirebaseFirestore.instance.collection("Product under auction").add(data);
                    
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder:(context) => SplashPage2(duration2: 3, goToPage2:Option()))
                         );  
  }
  
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(
         backgroundColor: Colors.transparent,
         leading: IconButton(
           icon: Icon(Icons.arrow_back),
           color: Colors.black,
           onPressed: ()=> Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=> Option())
                          )
           ),
         elevation: 0,
       ),
       backgroundColor: Color(0xFFEAF4E6),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                 child: Text('Auction Page',
                   textAlign: TextAlign.left,
                   style: TextStyle(
                   color: Colors.black,
                   fontSize:30,
                   fontWeight: FontWeight.bold
                           ),),),
                SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,15,5,5),
                    child: Text("User Id:",style: TextStyle(
                         color: Colors.black,
                         fontSize:20,
                         //fontWeight: FontWeight.bold

                                 ),),
                  ),
                Padding(
                 padding: const EdgeInsets.fromLTRB(30,15,30,10),
                 child: TextFormField(
                  controller: userID,
                  keyboardType: TextInputType.emailAddress,
                            //controller: emailEditingController,
                   validator: (e)=>  e!.isEmpty ? "Field is empty":null,
                  // onChanged: (e)=> Manufacturing.text=e,
                   decoration: InputDecoration(
                     hintText: "User@gmail.com",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20), 
                       borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
                     ),
                     filled: true,
                     fillColor: Color(0xFFD7F4CD),
                 )
                 ),
                ),
               
                Padding(
                    padding: const EdgeInsets.fromLTRB(30,15,5,5),
                    
                    child: Text("Select Category",style: TextStyle(
                         color: Colors.black,
                         fontSize:20,
                         //fontWeight: FontWeight.bold

                                 ),),
                  ),
                Padding(
                        padding: const EdgeInsets.fromLTRB(30,15,30,10),
                        child: DropdownButtonFormField<String>(
                        hint: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Select category'),
                        ),
                        decoration: InputDecoration(
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20), 
                              borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
                        ),
                        filled: true,
                        fillColor: Color(0xFFD7F4CD),
                        ),
                        
                        onChanged: (value) {
                          setState(() {
                            validator: (e)=>  e!.isEmpty ? "Field is empty":null;
                            selectedcategory.text = value!;
                            print(selectedcategory.text);
                          });
                        },
                        // value: categories[0].name,
                        items: ["Mobile Phones".toString(),
                                "Laptops/Desktops".toString(),
                                "TV sets".toString(),
                                //"Electronic Detectors".toString(),
                                "Washing Machines".toString(),
                                //"Blender".toString(),
                                "Kitchen".toString(),
                                "Electronic Tools".toString(),
                                "Medical Equipments".toString(),
                                "Lighting Equipments".toString(),
                                "Vaccum Cleaner".toString(),
                                "Iron".toString(),
                                "Others".toString()]
                                .map((e) => DropdownMenuItem(
                                value: e,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    e,
                                  ),
                                )))
                            .toList()),
                           ),
                           
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50,15,5,5),
                              child: Text("In case of Others Please Mention",style: TextStyle(
                                  color: Colors.black,
                                  fontSize:17.5,
                                  //fontWeight: FontWeight.bold

                                          ),),
                            ),
                          Padding(
                          padding: const EdgeInsets.fromLTRB(50,15,30,10),
                          child: TextFormField(
                            controller: others,
                            // validator: (e)=>  e!.isEmpty ? "Field is empty":null,
                            // onChanged: (e)=> Manufacturing.text=e,
                            decoration: InputDecoration(
                              hintText: "Type Text",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20), 
                                borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
                              ),
                              filled: true,
                              fillColor: Colors.white,
                          )
                          ),
                          ),
                          Padding(
                    padding: const EdgeInsets.fromLTRB(30,15,5,5),
                    child: Text("Brand",style: TextStyle(
                         color: Colors.black,
                         fontSize:20,
                         //fontWeight: FontWeight.bold

                                 ),),
                  ),
                Padding(
                 padding: const EdgeInsets.fromLTRB(30,15,30,10),
                 child: TextFormField(
                  controller: brand,
                  keyboardType: TextInputType.emailAddress,
                            //controller: emailEditingController,
                   validator: (e)=>  e!.isEmpty ? "Field is empty":null,
                  // onChanged: (e)=> Manufacturing.text=e,
                   decoration: InputDecoration(
                     hintText: "Enter Product Brand",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20), 
                       borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
                     ),
                     filled: true,
                     fillColor: Color(0xFFD7F4CD),
                 )
                 ),
                ),
                Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Model Number',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.black,
                fontSize:20,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,15,30,10),
                child: TextFormField(
                  controller: model,
                  //  validator: (e)=>e!.isEmpty?"Field is empty": null,
                  // onChanged: (e)=> model.text=e,
                  decoration: InputDecoration(
                    hintText: "add text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), 
                      borderSide: BorderSide(color:Color(0xFFD7F4CD) )   
                    ),
                    filled: true,
                    fillColor: Color(0xFFD7F4CD),
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Manufacturing year',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.black,
                fontSize:20,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,15,30,10),
                child: TextFormField(
                controller: manufacturing,
                  validator: (e)=>  e!.isEmpty ? "Field is empty":null,
                //  onChanged: (e)=> manufacturing.text=e,
                  decoration: InputDecoration(
                    hintText: "YYYY",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), 
                      borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
                    ),
                    filled: true,
                    fillColor: Color(0xFFD7F4CD),
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Specifications',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.black,
                fontSize:20,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,15,30,10),
                child: TextFormField(
                  controller: specifications,
                  // validator: (e)=>  e!.isEmpty? 'Field is empty':null,
                  // onChanged: (e)=> specifications.text=e,
                  maxLength: 500,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Add text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), 
                      borderSide: BorderSide(color:Color(0xFFD7F4CD),width: 0),

                    ),
                    filled: true,
                    fillColor: Color(0xFFD7F4CD),
                    
                ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(22.5,15,30,10),
                child: SwitchListTile(
                    title: Text('In Working Condition', style: TextStyle(fontSize: 20),),
                    value: isworking,
                    onChanged: (v) {
                      setState(() {
                        isworking = v;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Add Product images',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.black,
                fontSize:20,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,15,30,10),
                child: Container(
                  
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFD7F4CD), 
                     // borderSide: BorderSide(color:Color(0xFFD7F4CD) )   
                    ),
                  
                    height: 250,
                    child: Column(
                      children: [
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                              
                          ),
                                            color: Color(0xFF80C038),
 
                            onPressed: () {
                              loadAsset();
                            },
                            child: Text('Select Images')),
                            
                        Expanded(child: buildGrdiView())
                      ],
                    ),
                  ),
              ),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                      child: Text(
                          '*Add atleast one image',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,

                            fontSize: 12,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Minimum Price',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.black,
                fontSize:20,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,15,30,10),
                child: TextFormField(
                  controller: minimumPrice,
                   validator: (e)=>  e!.isEmpty? 'Field is empty':null,
                  // onChanged: (e)=> specifications.text=e,
                  decoration: InputDecoration(
                    hintText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), 
                      borderSide: BorderSide(color:Color(0xFFD7F4CD),width: 0),

                    ),
                    filled: true,
                    fillColor: Color(0xFFD7F4CD),
                    
                ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Bidding Duration',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.black,
                fontSize:20,
                //fontWeight: FontWeight.bold
                        ),),
              ), 
              Padding(
                padding: const EdgeInsets.fromLTRB(30,15,30,10),
                child: TextFormField(
                  controller: biddingDuration,
                   validator: (e)=>  e!.isEmpty? 'Field is empty':null,
                  // onChanged: (e)=> specifications.text=e,
                  decoration: InputDecoration(
                    hintText: "In hours",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), 
                      borderSide: BorderSide(color:Color(0xFFD7F4CD),width: 0),

                    ),
                    filled: true,
                    fillColor: Color(0xFFD7F4CD),
                    
                ),
                ),
                
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                      child: Text(
                          '*upto 72',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,

                            fontSize: 12,
                            //fontWeight: FontWeight.bold
                          )),
                    )
                  ],
                ),
               
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                
                child: Text('Mode of Payment',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.black,
                fontSize:20,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,15,30,10),
                child: SwitchListTile(
                    title: Text('Paytm', style: TextStyle(fontSize: 17.5),),
                    value: paytm,
                    onChanged: (v) {
                      setState(() {
                        paytm = v;
                      });
                    }),
              ),
                        Padding(
                              padding: const EdgeInsets.fromLTRB(50,15,5,5),
                              child: Text("Paytm Number\\ Paytm UPI id",style: TextStyle(
                                  color: Colors.black,
                                  fontSize:15,
                                  //fontWeight: FontWeight.bold

                                          ),),
                            ),
                          Padding(
                          padding: const EdgeInsets.fromLTRB(50,15,30,10),
                          child: TextFormField(
                            controller: paytmnumber,
                            // validator: (e)=>  e!.isEmpty ? "Field is empty":null,
                            // onChanged: (e)=> Manufacturing.text=e,
                            decoration: InputDecoration(
                              hintText: "Type Text",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20), 
                                borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
                              ),
                              filled: true,
                              fillColor: Colors.white,
                          )
                          ),
                          ),
                          Padding(
                padding: const EdgeInsets.fromLTRB(20,15,30,10),
                child: SwitchListTile(
                    title: Text('GooglePay', style: TextStyle(fontSize: 17.5),),
                    value: googlepay,
                    onChanged: (v) {
                      setState(() {
                        googlepay = v;
                      });
                    }),
              ),
                        Padding(
                              padding: const EdgeInsets.fromLTRB(50,15,5,5),
                              child: Text("GooglePay Number\\ GooglPay UPI id",style: TextStyle(
                                  color: Colors.black,
                                  fontSize:15,
                                  //fontWeight: FontWeight.bold

                                          ),),
                            ),
                          Padding(
                          padding: const EdgeInsets.fromLTRB(50,15,30,10),
                          child: TextFormField(
                            controller: googlepaynumber,
                            // validator: (e)=>  e!.isEmpty ? "Field is empty":null,
                            // onChanged: (e)=> Manufacturing.text=e,
                            decoration: InputDecoration(
                              hintText: "Type Text",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20), 
                                borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
                              ),
                              filled: true,
                              fillColor: Colors.white,
                          )
                          ),
                          ),
                          Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Pickup Address',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.black,
                fontSize:20,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,15,30,10),
                child: TextFormField(
                  controller: address,
                   validator: (e)=>  e!.isEmpty? 'Field is empty':null,
                  // onChanged: (e)=> specifications.text=e,
                  maxLength: 500,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Add text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), 
                      borderSide: BorderSide(color:Color(0xFFD7F4CD),width: 0),

                    ),
                    filled: true,
                    fillColor: Color(0xFFD7F4CD),
                    
                ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.fromLTRB(20,15,30,10),
                 child: SwitchListTile(
                      title: Text('Urgent Sale', style: TextStyle(fontSize: 20),),
                      value: urgentsale,
                      onChanged: (v) {
                        setState(() {
                          urgentsale = v;
                        });
                      }),
               ),
             Row(
               children: [
                 Padding(
                padding: const EdgeInsets.fromLTRB(20,15,30,10),
                   child: Checkbox(
                      checkColor: Colors.blue,
                      //fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: termandCondition,
                      
                      onChanged: (bool? value) {
                      setState(() {
                        
                        validator: (e)=>  e!.isEmpty ? "You need to accept terms and conditions":null;
                        termandCondition = value!;
                    });
                    }
                     ),
                 ),
                  SizedBox(width: 2,),
                  Text('I accept all terms and condtions',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                    color: Colors.black,
                    fontSize:20,
                    //fontWeight: FontWeight.bold
                            ),)
               ],
             ),
             SizedBox(height: 20,),
             Center(
               child: FlatButton(
                onPressed: () async{
                                if (_key.currentState!.validate()) { 
                                                                 
                                    User? user =FirebaseAuth.instance.currentUser;
                                    print(user);
                                    print(userID.text);
                                    if(user!.email==userID.text){
                                      print('correct');
                                      save();
                                      endTime = DateTime.now().add(Duration(hours: int.parse(biddingDuration.text)));
                                    }
                                    else{
                                    // on FirebaseAuthException catch (e) {
                                    // if (e.code == 'user-not-found') {
                                    //   print('No user found for that email.');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("Incorrect Email-id"),
                                        
                                      ));
                                      print('INcorrect');} }                                      
                                      },
                                    
                   
                
                
                  shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                              
                          ), 
                  color: Color(0xFF80C038),
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                  child: Text('     Submit   > ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                        fontWeight: FontWeight.bold,),
             ),)),
             SizedBox(height: 20,),
                  Center(
                    child: Text('You will recieve an Email & SMS confirmation',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      
                    ),),
                  ),
                  SizedBox(height: 40,),
                
            ],
            )),
        ),
      ),
    );
    }
    loadAsset() async {
          List<Asset> resultImages = <Asset>[];
          String error = "something went wrong";
          try {
            resultImages = await MultiImagePicker.pickImages(
              maxImages: 10,
              enableCamera: true,
              selectedAssets: images,
            );
            setState(() {
              images = resultImages;
            });
          } catch (e) {
            error = e.toString();
            print(error);
          }
        }
        Widget buildGrdiView() {
          return Container(
              width: double.infinity,
              child: images.length == 0
                  ? IconButton(
                      onPressed: () {
                        loadAsset();
                      },
                      icon: Icon(Icons.add),
                    )
                  : GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(images.length, (index) {
                        Asset asset = images[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              child:
                                  AssetThumb(asset: asset, width: 150, height: 150)),
                        );
                      }),
                    ));
                    
        }
          Future postImages(Asset imagefile) async {
          String filename = DateTime.now().millisecondsSinceEpoch.toString();
          FirebaseStorage db = FirebaseStorage.instance;
          await db
              .ref()
              .child("images")
              .child(filename)
              .putData((await imagefile.getByteData()).buffer.asUint8List());

          return db.ref().child("images").child(filename).getDownloadURL();
        }

        uploadImages() async {
          for (var image in images) {
            await postImages(image).then((downloadUrl) {
              imageUrls.add(downloadUrl);
            }).catchError((e) {
              print(e());
            });
          }
        }
}

// // import 'package:flutter/foundation.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gg_1/fire_store.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:gg_1/pages/option.dart';
// import 'package:gg_1/pages/spalshscreen2.dart';
// // import 'package:gg_1/pages/option.dart';
// // import 'package:gg_1/pages/utils/auctiondetails.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';


// class Auction extends StatefulWidget{ 
//   @override
//   _AddProductPageState createState() => _AddProductPageState();
// }
// class _AddProductPageState extends State<Auction> {
//   var userID=new TextEditingController();
//   var selectedcategory=new TextEditingController();
//   var others=new TextEditingController();
//   var brand=new TextEditingController();
//   var model=new TextEditingController();
//   var manufacturing=new TextEditingController();
//   var specifications=new TextEditingController();
//   bool isworking = false;
//   var minimumPrice=new TextEditingController();
//   var biddingDuration=new TextEditingController();
//   var address=new TextEditingController();
//   List<Asset> images = <Asset>[];
//   List<String> imageUrls = <String>[];
//   bool paytm= false;
//   bool ispaid= false;
//   bool isrecieved= false;
//   var paytmnumber=new TextEditingController();
//   bool googlepay= false;
//   var googlepaynumber=new TextEditingController();
//   var bidend=new TextEditingController();
//   String max='0';
//   String decider='0';
//   String userid='NULL';
//   bool urgentsale= false;
//   bool termandCondition= false;
//   DateTime endTime=DateTime.now();
//   //final TextEditingController emailEditingController = TextEditingController();
//   save() async {
//     bool isValidate = _key.currentState!.validate();
//       await uploadImages();
//       Map<String,dynamic> data = {
//                      "USER ID":userID.text,
//                      "CATEGORY":selectedcategory.text,
//                      "Other category":others.text,
//                      "BRAND":brand.text,
//                      "MODEL NUMBER":model.text,
//                      "MANUFACTURING DATE":manufacturing.text,
//                      "SPECIFICTIONS":specifications.text,
//                      "WORKING CONDITION":isworking,
//                      "MINIMUM PRICE":minimumPrice.text,
//                      "BIDDING DURATION":biddingDuration.text,
//                      "ADDRESS":address.text,
//                      "PAYTM":paytm,
//                      "Paytm Number":paytmnumber.text,
//                      "GOOGLE PAY":googlepay,
//                      "GOOGLE PAY NUMBER":googlepaynumber.text,
//                      "URGENT SALE":urgentsale,
//                      "URL":imageUrls,
//                      "DECIDER":decider,
//                      "MONEY RECIEVED":isrecieved,
//                      "MONEY PAID ":ispaid,
//                      "MAXIMUM BID":max,
//                      "MAXIMUM BID ID":userid,
//                      "BIDDING END":endTime.toIso8601String()};
//                     await FirebaseFirestore.instance.collection("Product under auction").add(data);
                    
//                     Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                 builder:(context) => SplashPage2(duration2: 3, goToPage2:Option()))
//                          );  
//   }
  
//   final _key=GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(

//       appBar: AppBar(
//          backgroundColor: Colors.transparent,
//          leading: IconButton(
//            icon: Icon(Icons.arrow_back),
//            color: Colors.black,
//            onPressed: ()=> Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context)=> Option())
//                           )
//            ),
//          elevation: 0,
//        ),
//        backgroundColor: Color(0xFFEAF4E6),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Form(
//             key: _key,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Center(
//                  child: Text('Auction Page',
//                    textAlign: TextAlign.left,
//                    style: TextStyle(
//                    color: Colors.black,
//                    fontSize:30,
//                    fontWeight: FontWeight.bold
//                            ),),),
//                 SizedBox(height: 30,),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(30,15,5,5),
//                     child: Text("User Id:",style: TextStyle(
//                          color: Colors.black,
//                          fontSize:20,
//                          //fontWeight: FontWeight.bold

//                                  ),),
//                   ),
//                 Padding(
//                  padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                  child: TextFormField(
//                   controller: userID,
//                   keyboardType: TextInputType.emailAddress,
//                             //controller: emailEditingController,
//                    validator: (e)=>  e!.isEmpty ? "Field is empty":null,
//                   // onChanged: (e)=> Manufacturing.text=e,
//                    decoration: InputDecoration(
//                      hintText: "User@gmail.com",
//                      border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(20), 
//                        borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
//                      ),
//                      filled: true,
//                      fillColor: Color(0xFFD7F4CD),
//                  )
//                  ),
//                 ),
               
//                 Padding(
//                     padding: const EdgeInsets.fromLTRB(30,15,5,5),
                    
//                     child: Text("Select Category",style: TextStyle(
//                          color: Colors.black,
//                          fontSize:20,
//                          //fontWeight: FontWeight.bold

//                                  ),),
//                   ),
//                 Padding(
//                         padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                         child: DropdownButtonFormField<String>(
//                         hint: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Text('Select category'),
//                         ),
//                         decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20), 
//                               borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
//                         ),
//                         filled: true,
//                         fillColor: Color(0xFFD7F4CD),
//                         ),
                        
//                         onChanged: (value) {
//                           setState(() {
//                             validator: (e)=>  e!.isEmpty ? "Field is empty":null;
//                             selectedcategory.text = value!;
//                             print(selectedcategory.text);
//                           });
//                         },
//                         // value: categories[0].name,
//                         items: ["Mobile Phones".toString(),
//                                 "Laptops/Desktops".toString(),
//                                 "TV sets".toString(),
//                                 //"Electronic Detectors".toString(),
//                                 "Washing Machines".toString(),
//                                 //"Blender".toString(),
//                                 "Kitchen".toString(),
//                                 "Electronic Tools".toString(),
//                                 "Medical Equipments".toString(),
//                                 "Lighting Equipments".toString(),
//                                 "Vaccum Cleaner".toString(),
//                                 "Iron".toString(),
//                                 "Others".toString()]
//                                 .map((e) => DropdownMenuItem(
//                                 value: e,
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(horizontal: 10),
//                                   child: Text(
//                                     e,
//                                   ),
//                                 )))
//                             .toList()),
//                            ),
                           
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(50,15,5,5),
//                               child: Text("In case of Others Please Mention",style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize:17.5,
//                                   //fontWeight: FontWeight.bold

//                                           ),),
//                             ),
//                           Padding(
//                           padding: const EdgeInsets.fromLTRB(50,15,30,10),
//                           child: TextFormField(
//                             controller: others,
//                             // validator: (e)=>  e!.isEmpty ? "Field is empty":null,
//                             // onChanged: (e)=> Manufacturing.text=e,
//                             decoration: InputDecoration(
//                               hintText: "Type Text",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20), 
//                                 borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                           )
//                           ),
//                           ),
//                           Padding(
//                     padding: const EdgeInsets.fromLTRB(30,15,5,5),
//                     child: Text("Brand",style: TextStyle(
//                          color: Colors.black,
//                          fontSize:20,
//                          //fontWeight: FontWeight.bold

//                                  ),),
//                   ),
//                 Padding(
//                  padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                  child: TextFormField(
//                   controller: brand,
//                   keyboardType: TextInputType.emailAddress,
//                             //controller: emailEditingController,
//                    validator: (e)=>  e!.isEmpty ? "Field is empty":null,
//                   // onChanged: (e)=> Manufacturing.text=e,
//                    decoration: InputDecoration(
//                      hintText: "Enter Product Brand",
//                      border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(20), 
//                        borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
//                      ),
//                      filled: true,
//                      fillColor: Color(0xFFD7F4CD),
//                  )
//                  ),
//                 ),
//                 Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
//                 child: Text('Model Number',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                 color: Colors.black,
//                 fontSize:20,
//                 //fontWeight: FontWeight.bold
//                         ),),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                 child: TextFormField(
//                   controller: model,
//                    validator: (e)=>e!.isEmpty?"Field is empty": null,
//                   // onChanged: (e)=> model.text=e,
//                   decoration: InputDecoration(
//                     hintText: "add text",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20), 
//                       borderSide: BorderSide(color:Color(0xFFD7F4CD) )   
//                     ),
//                     filled: true,
//                     fillColor: Color(0xFFD7F4CD),
//                 )
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
//                 child: Text('Manufacturing date',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                 color: Colors.black,
//                 fontSize:20,
//                 //fontWeight: FontWeight.bold
//                         ),),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                 child: TextFormField(
//                 controller: manufacturing,
//                   validator: (e)=>  e!.isEmpty ? "Field is empty":null,
//                 //  onChanged: (e)=> manufacturing.text=e,
//                   decoration: InputDecoration(
//                     hintText: "DD/MM/YYYY",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20), 
//                       borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
//                     ),
//                     filled: true,
//                     fillColor: Color(0xFFD7F4CD),
//                 )
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
//                 child: Text('Specifications',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                 color: Colors.black,
//                 fontSize:20,
//                 //fontWeight: FontWeight.bold
//                         ),),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                 child: TextFormField(
//                   controller: specifications,
//                   // validator: (e)=>  e!.isEmpty? 'Field is empty':null,
//                   // onChanged: (e)=> specifications.text=e,
//                   maxLength: 500,
//                   maxLines: 10,
//                   decoration: InputDecoration(
//                     hintText: "Add text",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20), 
//                       borderSide: BorderSide(color:Color(0xFFD7F4CD),width: 0),

//                     ),
//                     filled: true,
//                     fillColor: Color(0xFFD7F4CD),
                    
//                 ),
//                 ),
//               ),
              
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(22.5,15,30,10),
//                 child: SwitchListTile(
//                     title: Text('In Working Condition', style: TextStyle(fontSize: 20),),
//                     value: isworking,
//                     onChanged: (v) {
//                       setState(() {
//                         isworking = v;
//                       });
//                     }),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
//                 child: Text('Add Product images',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                 color: Colors.black,
//                 fontSize:20,
//                 //fontWeight: FontWeight.bold
//                         ),),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                 child: Container(
                  
//                    decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Color(0xFFD7F4CD), 
//                      // borderSide: BorderSide(color:Color(0xFFD7F4CD) )   
//                     ),
                  
//                     height: 250,
//                     child: Column(
//                       children: [
//                         FlatButton(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50)
                              
//                           ),
//                                             color: Color(0xFF80C038),
 
//                             onPressed: () {
//                               loadAsset();
//                             },
//                             child: Text('Select Images')),
                            
//                         Expanded(child: buildGrdiView())
//                       ],
//                     ),
//                   ),
//               ),
              
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
//                       child: Text(
//                           '*Add atleast one image',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.red,

//                             fontSize: 12,
//                             //fontWeight: FontWeight.bold
//                           )),
//                     )
//                   ],
//                 ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
//                 child: Text('Minimum Price',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                 color: Colors.black,
//                 fontSize:20,
//                 //fontWeight: FontWeight.bold
//                         ),),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                 child: TextFormField(
//                   controller: minimumPrice,
//                    validator: (e)=>  e!.isEmpty? 'Field is empty':null,
//                   // onChanged: (e)=> specifications.text=e,
//                   decoration: InputDecoration(
//                     hintText: "Amount",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20), 
//                       borderSide: BorderSide(color:Color(0xFFD7F4CD),width: 0),

//                     ),
//                     filled: true,
//                     fillColor: Color(0xFFD7F4CD),
                    
//                 ),
//                 ),
//               ),
//                 Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
//                 child: Text('Bidding Duration',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                 color: Colors.black,
//                 fontSize:20,
//                 //fontWeight: FontWeight.bold
//                         ),),
//               ), 
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                 child: TextFormField(
//                   controller: biddingDuration,
//                    validator: (e)=>  e!.isEmpty? 'Field is empty':null,
//                   // onChanged: (e)=> specifications.text=e,
//                   decoration: InputDecoration(
//                     hintText: "In hours",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20), 
//                       borderSide: BorderSide(color:Color(0xFFD7F4CD),width: 0),

//                     ),
//                     filled: true,
//                     fillColor: Color(0xFFD7F4CD),
                    
//                 ),
//                 ),
                
//               ),
               
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                
//                 child: Text('Mode of Payment',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                 color: Colors.black,
//                 fontSize:20,
//                 //fontWeight: FontWeight.bold
//                         ),),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20,15,30,10),
//                 child: SwitchListTile(
//                     title: Text('Paytm', style: TextStyle(fontSize: 17.5),),
//                     value: paytm,
//                     onChanged: (v) {
//                       setState(() {
//                         paytm = v;
//                       });
//                     }),
//               ),
//                         Padding(
//                               padding: const EdgeInsets.fromLTRB(50,15,5,5),
//                               child: Text("Paytm Number\\ Paytm UPI id",style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize:15,
//                                   //fontWeight: FontWeight.bold

//                                           ),),
//                             ),
//                           Padding(
//                           padding: const EdgeInsets.fromLTRB(50,15,30,10),
//                           child: TextFormField(
//                             controller: paytmnumber,
//                             // validator: (e)=>  e!.isEmpty ? "Field is empty":null,
//                             // onChanged: (e)=> Manufacturing.text=e,
//                             decoration: InputDecoration(
//                               hintText: "Type Text",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20), 
//                                 borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                           )
//                           ),
//                           ),
//                           Padding(
//                 padding: const EdgeInsets.fromLTRB(20,15,30,10),
//                 child: SwitchListTile(
//                     title: Text('GooglePay', style: TextStyle(fontSize: 17.5),),
//                     value: googlepay,
//                     onChanged: (v) {
//                       setState(() {
//                         googlepay = v;
//                       });
//                     }),
//               ),
//                         Padding(
//                               padding: const EdgeInsets.fromLTRB(50,15,5,5),
//                               child: Text("GooglePay Number\\ GooglPay UPI id",style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize:15,
//                                   //fontWeight: FontWeight.bold

//                                           ),),
//                             ),
//                           Padding(
//                           padding: const EdgeInsets.fromLTRB(50,15,30,10),
//                           child: TextFormField(
//                             controller: googlepaynumber,
//                             // validator: (e)=>  e!.isEmpty ? "Field is empty":null,
//                             // onChanged: (e)=> Manufacturing.text=e,
//                             decoration: InputDecoration(
//                               hintText: "Type Text",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20), 
//                                 borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                           )
//                           ),
//                           ),
//                           Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
//                 child: Text('Pickup Address',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                 color: Colors.black,
//                 fontSize:20,
//                 //fontWeight: FontWeight.bold
//                         ),),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30,15,30,10),
//                 child: TextFormField(
//                   controller: address,
//                    validator: (e)=>  e!.isEmpty? 'Field is empty':null,
//                   // onChanged: (e)=> specifications.text=e,
//                   maxLength: 500,
//                   maxLines: 10,
//                   decoration: InputDecoration(
//                     hintText: "Add text",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20), 
//                       borderSide: BorderSide(color:Color(0xFFD7F4CD),width: 0),

//                     ),
//                     filled: true,
//                     fillColor: Color(0xFFD7F4CD),
                    
//                 ),
//                 ),
//               ),
//                Padding(
//                 padding: const EdgeInsets.fromLTRB(20,15,30,10),
//                  child: SwitchListTile(
//                       title: Text('Urgent Sale', style: TextStyle(fontSize: 20),),
//                       value: urgentsale,
//                       onChanged: (v) {
//                         setState(() {
//                           urgentsale = v;
//                         });
//                       }),
//                ),
//              Row(
//                children: [
//                  Padding(
//                 padding: const EdgeInsets.fromLTRB(20,15,30,10),
//                    child: Checkbox(
//                       checkColor: Colors.blue,
//                       //fillColor: MaterialStateProperty.resolveWith(getColor),
//                       value: termandCondition,
                      
//                       onChanged: (bool? value) {
//                       setState(() {
                        
//                         validator: (e)=>  e!.isEmpty ? "You need to accept terms and conditions":null;
//                         termandCondition = value!;
//                     });
//                     }
//                      ),
//                  ),
//                   SizedBox(width: 2,),
//                   Text('I accept all terms and condtions',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                     color: Colors.black,
//                     fontSize:20,
//                     //fontWeight: FontWeight.bold
//                             ),)
//                ],
//              ),
//              SizedBox(height: 20,),
//              Center(
//                child: FlatButton(
//                 onPressed: () async{
//                                 if (_key.currentState!.validate()) { 
                                                                 
//                                     User? user =FirebaseAuth.instance.currentUser;
//                                     print(user);
//                                     print(userID.text);
//                                     if(user!.email==userID.text){
//                                       print('correct');
//                                       save();
//                                       endTime = DateTime.now().add(Duration(hours: int.parse(biddingDuration.text)));
//                                     }
//                                     else{
//                                     // on FirebaseAuthException catch (e) {
//                                     // if (e.code == 'user-not-found') {
//                                     //   print('No user found for that email.');
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text("Incorrect Email-id"),
                                        
//                                       ));
//                                       print('INcorrect');} }                                      
//                                       },
                                    
                   
                
                
//                   shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50)
                              
//                           ), 
//                   color: Color(0xFF80C038),
//                   padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
//                   child: Text('     Submit   > ',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                         fontWeight: FontWeight.bold,),
//              ),)),
//              SizedBox(height: 20,),
//                   Center(
//                     child: Text('You will recieve an Email & SMS confirmation',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
                      
//                     ),),
//                   ),
//                   SizedBox(height: 40,),
                
//             ],
//             )),
//         ),
//       ),
//     );
//     }
//     loadAsset() async {
//           List<Asset> resultImages = <Asset>[];
//           String error = "something went wrong";
//           try {
//             resultImages = await MultiImagePicker.pickImages(
//               maxImages: 10,
//               enableCamera: true,
//               selectedAssets: images,
//             );
//             setState(() {
//               images = resultImages;
//             });
//           } catch (e) {
//             error = e.toString();
//             print(error);
//           }
//         }
//         Widget buildGrdiView() {
//           return Container(
//               width: double.infinity,
//               child: images.length == 0
//                   ? IconButton(
//                       onPressed: () {
//                         loadAsset();
//                       },
//                       icon: Icon(Icons.add),
//                     )
//                   : GridView.count(
//                       crossAxisCount: 3,
//                       children: List.generate(images.length, (index) {
//                         Asset asset = images[index];
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Card(
//                               child:
//                                   AssetThumb(asset: asset, width: 150, height: 150)),
//                         );
//                       }),
//                     ));
                    
//         }
//           Future postImages(Asset imagefile) async {
//           String filename = DateTime.now().millisecondsSinceEpoch.toString();
//           FirebaseStorage db = FirebaseStorage.instance;
//           await db
//               .ref()
//               .child("images")
//               .child(filename)
//               .putData((await imagefile.getByteData()).buffer.asUint8List());

//           return db.ref().child("images").child(filename).getDownloadURL();
//         }

//         uploadImages() async {
//           for (var image in images) {
//             await postImages(image).then((downloadUrl) {
//               imageUrls.add(downloadUrl);
//             }).catchError((e) {
//               print(e());
//             });
//           }
//         }
// }