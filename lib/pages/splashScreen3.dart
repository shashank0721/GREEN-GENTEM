import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';


class SplashPage3 extends StatelessWidget{
  int duration3=0;
  Widget goToPage3;

  SplashPage3({ required this.goToPage3, required this.duration3});

  @override
  Widget build(BuildContext context)
  {
    Future.delayed(Duration(seconds: this.duration3),(){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage3 )
      );
    });
    return Scaffold(
        body: Container(
            color:Colors.black,
            
            child: Column(
              children: [
                SizedBox(height: 50,),
                Container(
                    child: Icon(Icons.thumbs_up_down, color: Color(0xFF80C038), size:100)),
                    SizedBox(height: 200,),
                Center(
                  child: Text('YOUR BID HAS BEEN PLACED',
                  style:TextStyle(
                     color: Colors.white,
                     fontSize:20,
                    fontWeight: FontWeight.bold
                             )),
                ),
                
                // TextFormField(
                //   //controller: userID,
                //   // validator: (e)=>  e!.isEmpty ? "Field is empty":null,
                //   // onChanged: (e)=> Manufacturing.text=e,
                //    decoration: InputDecoration(
                //      hintText: "Search",
                //      border: OutlineInputBorder(
                //        borderRadius: BorderRadius.circular(20), 
                //        borderSide: BorderSide(color:Color(0xFFD7F4CD), width: 0.0 )   
                //      ),
                //      filled: true,
                //      fillColor: Colors.white,
                //  )
                //  ),
              ],
            ), 
                       
        )
        
    );
  }
}