import 'package:flutter/material.dart';
 
class AboutUs extends StatelessWidget
{
 
  @override
  Widget build(BuildContext context){
    //const primaryColor = Colors.transparent;
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 14, 63, 0),
       //backgroundColor: Colors.green,
        appBar: AppBar(
          //toolbarHeight: 150,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
 
          child:Container(
            //color: const Color.fromARGB(100, 16, 30, 16),
            //color: Color(0xFF19361BFF),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40,0,40,40),
                        //child: SizedBox(height: 10,),
                      ),
                      Text('ABOUT US',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text('We are an emerging international start-up in the waste management based in Germany and expanding our services in Armenia, Bangladesh India. We are a multi-national and multi-disciplinary visionary team on addressing global challenges on waste management and technologies. We believe that each of us should be responsible for and efficiently deal with the supply chain of end-of-life products sustainable future. Our vision is to achieve a circular economy electronic and electrical industry by closely working with the communities, corporates and industries. Together, we can bring the change and towards a smart and circular economy.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 25,),
                      Text('OUR STORY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(height: 25,),
                      Padding(padding: EdgeInsets.all(20),
                        child:
                        Text('Green Gentem concept was always buzzing in the team member\'s minds for a very long time, but it started to take off during the "EMPOWER" program at TU Bergakademie Freiberg (TUBAF), Germany. The TUBAF translates to "University of Mines" and is the oldest running mining and metallurgical university in the world. TUBAF is a resource university located in the Saxony area (~ 40 km from Dresden). The Empower program was started in 2018 by the Graduate and Research Academy (GraFa), TUBAF, to encourage and nurture international Ph.D. candidates in developing social entrepreneurship. During this program, together with experts, we have developed strong skills in governance, management and entrepreneurship, which laid a solid foundation for Green Gentem.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text('WHY RECYCLE ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(height: 25,),
                      Padding(padding: EdgeInsets.all(20),
                        child:
                        Text('Our planet earth has plenty of resources, but they are not infinite. If we use them without caring about sustainability, we will end up vanishing them. Recycling can help to build us this sustainable environment. Because when we recycle a commodity, the old item is not wasted, and new resources are not used, which helps us in many ways. For example, it saves energy, decreases waste production, preserves resources, and will further help reduce global warming, pollution, and health hazards. And if we want to recycle healthily, we need proper infrastructure, the latest statistics, efficient recycling technologies, and an intelligent supply chain. And we at Green Gentem are focused on our main objective to make the environment more sustainable. So come on, let\'s make the change together',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 25,),
                      Text('© Copyright Green Gentem. All rights Reserved',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:15,
                        ),),
                        SizedBox(height: 15,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}