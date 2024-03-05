
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idol_booking/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:idol_booking/register.dart';
import 'package:idol_booking/firebase_options.dart';
import 'package:idol_booking/admin_home.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options:DefaultFirebaseOptions.currentPlatform
//   );
//   runApp(const Login());
// }
//
// class Login extends StatelessWidget {
//   const Login({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Murtishala',
//         theme: ThemeData(useMaterial3: true),
//         home:  LoginPage(),
//     );
//   }
// }
// class LoginPage extends StatelessWidget{
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passcontroller=TextEditingController();
//
//   LoginPage({super.key});
//   @override
//   Widget build(BuildContext context){
//
//   void login() async {
//     String email= emailcontroller.text.trim();
//     String password = passcontroller.text.trim();
//
//     if(email==""||password==""){
//       //log("please fill all the fields");
//       Fluttertoast.showToast(msg: 'Please fill all the field');
//     }
//     else{
//       try{
//         UserCredential userCredential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email, password: password);
//         var admin = await FirebaseFirestore.instance.collection('admin').get();
//
//         if(userCredential.user!= null){
//           Fluttertoast.showToast(msg: 'Login Successfully',gravity: ToastGravity.CENTER);
//          Navigator.push(context , MaterialPageRoute(builder: (context)=>HomePage()));
//           //log("login successfuly");
//         }
//         else if(userCredential==admin){
//           Fluttertoast.showToast(msg: 'Login Successfully',gravity: ToastGravity.CENTER);
//           Navigator.push(context , MaterialPageRoute(builder: (context)=>Admin_Home()));
//         }
//       }
//       on FirebaseAuthException catch(ex) {
//         Fluttertoast.showToast(msg: ex.code.toString(),gravity: ToastGravity.CENTER);
//         //log(ex.code.toString());
//       }
//     }
//   }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Murtishala',
      theme: ThemeData(useMaterial3: true),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    void login() async {
      String email = emailcontroller.text.trim();
      String password = passcontroller.text.trim();

      if (email == "" || password == "") {
        Fluttertoast.showToast(msg: 'Please fill all the fields', gravity: ToastGravity.CENTER);
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          var adminQuery = await FirebaseFirestore.instance.collection('admin').where('email', isEqualTo: email).get();

          if (adminQuery.docs.isNotEmpty) {
            Fluttertoast.showToast(msg: 'Admin Login Successfully', gravity: ToastGravity.CENTER);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Admin_Home()));
          } else {
            Fluttertoast.showToast(msg: 'User Login Successfully', gravity: ToastGravity.CENTER);
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        } on FirebaseAuthException catch (ex) {
          Fluttertoast.showToast(msg: ex.code.toString(), gravity: ToastGravity.CENTER);
        }
      }
    }
        return Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body:
                Center(
                    child: Card(
                      child: Center(
                        child: SizedBox(
                          height: 400,
                          width: 300,
                  
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(padding: const EdgeInsets.all(8.0),
                                child:Container(
                                  alignment: Alignment.topLeft,
                                  child: const Text('LOGIN',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                                )
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: emailcontroller,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orangeAccent),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)
                                            // borderSide: BorderSide(color: Colors.black ),
                                            ),
                                        prefixIcon: const Icon(Icons.email)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: passcontroller,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orangeAccent),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)
                                            //borderSide: BorderSide(color: Colors.black ),
                                            ),
                                        prefixIcon: const Icon(Icons.password),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.remove_red_eye),
                                        )),
                                  ),
                                ),
                                              
                                   Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Container(
                                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                               color:Colors.lightBlueAccent,
                                           ),
                                           alignment: Alignment.center,
                                           width: 275,
                                           child: TextButton(
                                            onPressed: () {
                                              login();
                                            },
                                            child:const Text('Sign in ',style: TextStyle(fontSize:18,),),
                                              
                                         ), 
                                         ),
                                       ),
                                     ],
                                   ),
                                Container(
                                  width: 275,
                                              
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                    color: Colors.amberAccent,
                                    ),
                                  child: TextButton
                                    (
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder:(context) => Register(),));
                                    },
                                    child: const Text('Sign up',style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                ),
                               ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
  }
}
