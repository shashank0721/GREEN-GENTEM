import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';


class SplashPage5 extends StatelessWidget{
  int duration5=0;
  Widget goToPage5;

  SplashPage5({ required this.goToPage5, required this.duration5});

  @override
  Widget build(BuildContext context)
  {
    Future.delayed(Duration(seconds: this.duration5),(){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage5 )
      );
    });
    return Scaffold(
        body: Container(
            color:Colors.black,
            
            child: Column(
              children: [
                SizedBox(height: 100,),
                Container(
                    child: Icon(Icons.thumb_up_sharp,color: Color(0xFF80C038), size:100)),
                    SizedBox(height: 100,),
                Center(
                  child: Text('Your issue is being processed,\n We will contact you Soon!!',
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