import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var user = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Idol booking',
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('idol booking'),
          ),
          body: Center(
            child: Card(
              child: Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: user,
                          decoration: InputDecoration(
                              hintText: "Username",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                  // borderSide: BorderSide(color: Colors.black ),
                                  ),
                              prefixIcon: Icon(Icons.supervised_user_circle)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                              hintText: "Password",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                  //borderSide: BorderSide(color: Colors.black ),
                                  ),
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_red_eye),
                              )),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
