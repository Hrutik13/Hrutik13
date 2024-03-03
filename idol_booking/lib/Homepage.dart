import 'package:flutter/material.dart';
import 'package:idol_booking/main.dart';
import 'package:idol_booking/profile.dart';
import 'package:idol_booking/customize.dart';


class Home extends StatelessWidget{
  const Home({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends Home{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              title:  Text('MurtiShala',textAlign: TextAlign.justify),
              backgroundColor: Colors.lightBlue.shade50,
              centerTitle: true,
              actions: [
                Container(
                  child: TextButton(onPressed: ()
                  {Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
                    },
                      child: Text('Login',style: TextStyle(fontSize: 18),)),
                )
              ],
            )),
        body:
      GridView.count(crossAxisCount: 1,
      children: [
        Container(color: Colors.lightBlue,),
        Container(color: Colors.amberAccent,),
        Container(color: Colors.black12,),
        Container(color: Colors.brown,),
        Container(color: Colors.cyan,),
        Container(color: Colors.lightBlue,),
      ],
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.black,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              }, icon:Icon(Icons.home),
              iconSize: 30,
              tooltip: "home",
            ),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Customize()));
            },
              icon: Icon(Icons.dashboard_customize_rounded),iconSize: 30,),
            IconButton(onPressed: (){}, icon: Icon(Icons.list_alt),iconSize: 30,),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));

            }, icon: Icon(Icons.account_circle),iconSize: 30,),
            IconButton(onPressed: (){}, icon:Icon(Icons.more_vert),iconSize: 30,)
          ],
        ),
      ),

    );
  }
}



