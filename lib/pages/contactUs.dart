import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gg_1/pages/splashScreen5.dart';

class ContactUs extends StatefulWidget{
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

    var name=new TextEditingController();
    var emailid=new TextEditingController();
    var phone_number=new TextEditingController();
    var comments=new TextEditingController();
    bool query_resolved= false;
    final _key=GlobalKey<FormState>();
      save() async {
      Map<String,dynamic> data = {
                     "NAME":name.text,
                     "EMAIL ID":emailid.text,
                     "COMMENTS":comments.text,
                     "PHONE NUMBER":phone_number.text,
                     "QUERY RESOLVED":query_resolved,};
                     
                    await FirebaseFirestore.instance.collection("Grievance").add(data);
                    
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder:(context) => SplashPage5(duration5: 3, goToPage5:ContactUs()))
                         );  
      }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: ()=> Navigator.of(context).pop(),
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
                
              const SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 0, 0),
                child: Text('Help Centre',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.black,
                fontSize:40,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 5, 30),
                child: Text('Get in touch',
                textAlign: TextAlign.left,
                
                style: TextStyle(
                color: Color.fromARGB(255, 139, 138, 138),
                fontSize:20,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Name',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Color.fromARGB(255, 139, 138, 138),
                fontSize:15,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,0,30,10),
                child: TextFormField(
                  controller: name,
                 validator: (e)=>e!.isEmpty?"Field is empty": null,
                  
                  decoration: InputDecoration(
                    hintText: "Your Name", prefixIcon: Icon(Icons.person, color: Colors.black,
                  ),
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Email ID',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Color.fromARGB(255, 139, 138, 138),
                fontSize:15,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,0,30,10),
                child: TextFormField(
                  controller: emailid,
                 validator: (e)=>  e!.isEmpty ? "Field is empty":null,
                 //onChanged: (e)=> mail=e,
                  decoration: InputDecoration(
                    hintText: "Your Email-ID", prefixIcon: Icon(Icons.email, color: Colors.black,
                  )
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Phone number',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Color.fromARGB(255, 139, 138, 138),
                fontSize:15,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,0,30,10),
                child: TextFormField(
                  controller: phone_number,
                  validator: (e)=>  e!.isEmpty? 'Field is empty':null,
                 // onChanged: (e)=> contact=e,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Your Phone Number", prefixIcon: Icon(Icons.phone, color: Colors.black,
                  )
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 5, 5),
                child: Text('Comments',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Color.fromARGB(255, 139, 138, 138),
                fontSize:15,
                //fontWeight: FontWeight.bold
                        ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,15,30,10),
                child: TextFormField(
                  controller: comments,
                  validator: (e)=>  e!.isEmpty? 'Field is empty':null,
                  //onChanged: (e)=> comment=e,
                  maxLength: 500,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Add comment",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),              
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    
                ),
                ),
              ),
              SizedBox(height: 10,),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,0),
                child: Center(
                  child: FlatButton(
                    onPressed: ()async {
                      if(_key.currentState!.validate())
                        {save();}
                      

                    },
                    shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ), 
                    color: Color(0xFF80C038),
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                    child: Text('     Submit   > ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      
                    ),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                child: Center(
                  child: Text('  We will get in touch with you soon!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Color.fromARGB(255, 139, 138, 138),
                  fontSize:12,
                  //fontWeight: FontWeight.bold
                          ),),
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                child: Center(
                  child: Text("  Green Gentem\n  Wohnpark Gentilly 80 a\n  09500 Freilberg, Saxony\n  Germany",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Color.fromARGB(255, 139, 138, 138),
                  fontSize:15,
                  //fontWeight: FontWeight.bold
                          ),),
                ),
              ),
              SizedBox(height: 30,),
                
      ]
      ),
      )
        ))  );
  }
}
