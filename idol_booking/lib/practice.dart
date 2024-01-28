
import 'package:flutter/material.dart';

void main()
{
  runApp(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home:Scaffold(
          appBar: AppBar(title: const Text('register'),),
          body: const Register(),
        ),
      )
  );
}

class Register extends StatelessWidget{
  const Register({super.key});
  @override
  Widget build(context){
    return Container(
        child: Column(
          children: [
            Container(
              color: Colors.lightBlueAccent,

              child: const Text('Sign up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            )
          ],
        )
    );
  }
}

/*void login() async{
    String email=emailcontroller.text.trim();
    String password = passcontroller.text.trim();
    if(email==""||password==""){
      log("please enter username or password");
    }
    else{
      try{
        UserCredential userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user !=null){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }
      }on FirebaseAuthException catch(ex){
        log(ex.code.toString());
      }

    }
  }*/



