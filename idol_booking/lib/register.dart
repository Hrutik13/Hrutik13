

import 'package:flutter/material.dart';
import 'package:idol_booking/Homepage.dart';
import 'package:idol_booking/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*void main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
runApp(Register());
}*/

class Register extends StatefulWidget{
  const Register({super.key});
  @override
  State<Register> createState() =>_RegisterState();
}


class _RegisterState extends State<Register>{

  final nameController=TextEditingController();
  final passController=TextEditingController();
  final emailController=TextEditingController();
  final addController=TextEditingController();
  final contController=TextEditingController();


  @override
  Widget build(BuildContext context){

  void createAccount() async{
    String name = nameController.text.trim();
    String password = passController.text.trim();
    String email = emailController.text.trim();
    String address = addController.text.trim();
    String contact = contController.text.trim();

    if(name=="" ||password==""||email==""||address==""||contact==""){
      Fluttertoast.showToast(msg: 'Enter valid inputs',gravity: ToastGravity.CENTER);
    }

    else{

      try{
        UserCredential userCredential = await FirebaseAuth.instance.
        createUserWithEmailAndPassword(email: email, password: password);
        Fluttertoast.showToast(msg: 'user created successfully',gravity: ToastGravity.CENTER);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),));
      } on FirebaseAuthException catch(ex){
        //log(ex.code.toString());
        Fluttertoast.showToast(msg: ex.code.toString(),gravity: ToastGravity.CENTER);
      }
    }
  }

  //@override
  //Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child:const Text('Sign up',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  focusedBorder:const OutlineInputBorder(
                                    //borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.orange)
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  prefixIcon: const Icon(Icons.person)
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: passController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange)
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  prefixIcon: const Icon(Icons.password),
                                  suffixIcon: IconButton(onPressed:(){}, icon: const Icon(Icons.remove_red_eye)),

                                ),
                              ),
                            ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.orange)
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      prefixIcon: const Icon(Icons.email)
                                  ),
                                ),
                              ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: addController,
                                decoration: InputDecoration(
                                    hintText: 'Address',
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.orange)
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    prefixIcon: const Icon(Icons.location_on)

                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                controller: contController,
                                decoration: InputDecoration(
                                    hintText: 'Contact no.',
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.orange)
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    prefixIcon: const Icon(Icons.phone)

                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                width: 275,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.amberAccent,),
                                child: TextButton(
                                  onPressed: (){
                                    CollectionReference collRef = FirebaseFirestore.instance.collection('Users') ;
                                    collRef.add({
                                      'name':nameController.text,
                                      'email':emailController.text,
                                      'password':passController.text,
                                      'address':addController.text,
                                      'contact':contController.text,
                                    });
                                    createAccount();
                                    },
                                  child: const Text('Submit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50,right: 50),
                              child: Container(
                               child: TextButton(
                                 onPressed: (){},
                                 child: const Text('Sign up with Google'),
                               )
                              ),
                            ),
                            Row(
                              children: [

                                const Padding(
                                  padding: EdgeInsets.only(left:85),
                                  child: SizedBox(child: Text("Already have an account?",)),
                                ),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login(),
                                  ));
                                },
                                    child:const Text("Login")),
                              ],
                            ),
                          ],
                        ),
              ),
            ),
      ),

    );
  }

}