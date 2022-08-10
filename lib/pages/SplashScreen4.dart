import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';


class SplashPage4 extends StatelessWidget{
  int duration4=0;
  Widget goToPage4;

  SplashPage4({ required this.goToPage4, required this.duration4});

  @override
  Widget build(BuildContext context)
  {
    Future.delayed(Duration(seconds: this.duration4),(){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage4 )
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
                  child: Text('Your bidding amount should be greater than\nLast bidding amount',
                  textAlign: TextAlign.center,
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