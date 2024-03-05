import'package:flutter/material.dart';
import 'package:idol_booking/admin_home.dart';
import 'package:idol_booking/admin_profile.dart';
import 'package:idol_booking/admin_customer.dart';

class Admin_Product extends StatefulWidget{
  Admin_Product({super.key});
  @override
  _AdminProduct createState() => _AdminProduct();
}
class _AdminProduct extends State<Admin_Product>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
      ),
      body: Container(
        margin: EdgeInsets.only(right: 30,bottom: 30),
        alignment: Alignment.bottomRight,
        child: SizedBox(
          height: 60,
          width: 60,
          child: Container(
           decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(50)),
              alignment: Alignment.bottomRight,
              child: Center(child: Icon(Icons.add,size: 30,color: Colors.white,)),
              ),
        ),
      ),

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

            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Customers()));
            },
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