// import 'package:flutter/material.dart';
// import 'package:idol_booking/main.dart';
// import 'package:idol_booking/profile.dart';
// import 'package:idol_booking/customize.dart';
//
//
// class Home extends StatelessWidget{
//   const Home({super.key});
//   @override
//   Widget build(BuildContext context){
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
// class HomePage extends Home{
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//         appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(60),
//             child: AppBar(
//               title:  Text('MurtiShala',textAlign: TextAlign.justify),
//               backgroundColor: Colors.lightBlue.shade50,
//               centerTitle: true,
//               actions: [
//                 Container(
//                   child: TextButton(onPressed: ()
//                   {Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
//                     },
//                       child: Text('Login',style: TextStyle(fontSize: 18),)),
//                 )
//               ],
//             )),
//         body:
//       GridView.count(crossAxisCount: 1,
//       children: [
//         Container(color: Colors.lightBlue,),
//         Container(color: Colors.amberAccent,),
//         Container(color: Colors.black12,),
//         Container(color: Colors.brown,),
//         Container(color: Colors.cyan,),
//         Container(color: Colors.lightBlue,),
//       ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         shadowColor: Colors.black,
//         height: 70,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(onPressed:(){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//               }, icon:Icon(Icons.home),
//               iconSize: 30,
//               tooltip: "home",
//             ),
//             IconButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>Customize()));
//             },
//               icon: Icon(Icons.dashboard_customize_rounded),iconSize: 30,),
//             IconButton(onPressed: (){}, icon: Icon(Icons.list_alt),iconSize: 30,),
//             IconButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
//
//             }, icon: Icon(Icons.account_circle),iconSize: 30,),
//             IconButton(onPressed: (){}, icon:Icon(Icons.more_vert),iconSize: 30,)
//           ],
//         ),
//       ),
//
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idol_booking/product_details_screen.dart';
import 'package:idol_booking/profile.dart';
import 'customize.dart';
import 'main.dart';
import 'product_details_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: Text('MurtiShala', textAlign: TextAlign.justify),
          backgroundColor: Colors.lightBlue.shade50,
          centerTitle: true,
          actions: [
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('product').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<DocumentSnapshot> products = snapshot.data!.docs;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of grid columns
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 10, // Spacing between rows
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> productData = products[index].data() as Map<String, dynamic>;

              // Extract product details
              String imageUrl = productData['imageUrl'] ?? '';
              String name = productData['name'] ?? '';
              String description = productData['description'] ?? '';
              String price = productData['Price'] ?? '';
              String height = productData['Height'] ?? '';

              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Image.network(imageUrl), // Show full image in dialog
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Text('Close'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  imageUrl: imageUrl,
                                  name: name,
                                  description: description,
                                   price: price,
                                  height: height,
                                ),
                              ),
                            );
                          },
                          child: Text('View Details'),
                        ),
                      ],
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl)!, // Use null-aware operator to assert non-null
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 0.5),
                            Text(
                              description,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            // Text(
                            //   price,
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 16,
                            //   ),
                            // ),
                            // SizedBox(height: 0.5),
                            // Text(
                            //   height,
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //   ),
                            // ),// Add space between description and button
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle order button tap
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailsScreen(
                                        imageUrl: imageUrl,
                                        name: name,
                                        description: description,
                                        price: price,
                                        height: height,
                                      ),
                                    ),
                                  );
                                },
                                child: Text('Order'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.black,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.home),
              iconSize: 30,
              tooltip: "home",
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Customize()));
              },
              icon: Icon(Icons.dashboard_customize_rounded),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.list_alt),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: Icon(Icons.account_circle),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              iconSize: 30,
            )
          ],
        ),
      ),
    );
  }
}
