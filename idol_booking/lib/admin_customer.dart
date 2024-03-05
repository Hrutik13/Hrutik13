import 'package:flutter/material.dart';
import 'package:idol_booking/admin_profile.dart';
import 'package:idol_booking/admin_home.dart';
import 'package:idol_booking/admin_upload.dart';



class Customers extends StatefulWidget{
  Customers({super.key});
  @override
  _CustomerState createState() => _CustomerState();
}
class _CustomerState extends State<Customers>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
      ),
      body: Text('this are the your customers'),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Admin_Home()));
            },
              icon: Icon(Icons.home),
            ),

            IconButton(onPressed: (){},
              icon: Icon(Icons.people_alt),
            ),
            IconButton(onPressed: (){},
              icon: Icon(Icons.production_quantity_limits),
            ),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Product()));
            },
              icon: Icon(Icons.add_a_photo),
            ),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Profile()));
            },
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}