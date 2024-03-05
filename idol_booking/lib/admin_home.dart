// import 'package:flutter/material.dart';
//
// class Admin_Home extends StatefulWidget{
//   Admin_Home({super.key});
//   @override
//   _AdminHomeState createState() => _AdminHomeState();
// }
// class _AdminHomeState extends State<Admin_Home>{
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MurtiShala',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//         centerTitle: true,
//       ),
//       body: Text("hello"),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:idol_booking/admin_upload.dart';
import 'package:video_player/video_player.dart';
import 'package:idol_booking/admin_profile.dart';
import 'package:idol_booking/admin_customer.dart';
class Admin_Home extends StatefulWidget {
  Admin_Home({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<Admin_Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/back_video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          title: Text(
            'MurtiShala',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          //shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
          ),
          Container(
            alignment: Alignment.bottomCenter,
             padding: EdgeInsets.only(bottom: 220),
            child: Text(
                'Hello, Admin!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
          ),

          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 150),
            child: Text('MurtiShala',style: TextStyle(
                fontSize: 55,
                color:Colors.white,
                fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              ),
            ),
          ),
          BottomAppBar(
            height: 60,
            color: Colors.white.withOpacity(0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Admin_Home()));
                },
                    icon: Icon(Icons.home),
                color: Colors.white,

                ),

                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Customers()));
                },
                    icon: Icon(Icons.people_alt),
                  color: Colors.white,
                ),
                IconButton(onPressed: (){},
                  icon: Icon(Icons.production_quantity_limits),
                  color: Colors.white,
                ),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Product()));
                },
                  icon: Icon(Icons.add_a_photo),
                  color: Colors.white,
                ),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Profile()));
                },
                  icon: Icon(Icons.account_circle),
                  color:Colors.white,

                ),
              ],
            ),
          )
          // Add other widgets here as needed
        ],
      ),
    );
  }
}
