
import 'package:flutter/material.dart';


void main() {
  runApp(const Home());
}
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
            preferredSize: const Size.fromHeight(80),
            child: AppBar(title: const Text('MurtiShala',textAlign: TextAlign.justify,),)),
        body:
              Row(
                children: [
                        Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 180,
                                  width: 180,
                                  color: Colors.orange,
                                ),
                              ),
                              ElevatedButton(onPressed: (){}, child: const Text('View')
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.amberAccent,
                                  height: 180,
                                  width:180,
                                ),
                              ),
                              ElevatedButton(onPressed: (){}, child: const Text('View')),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 180,
                                  width: 180,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              ElevatedButton(onPressed: (){}, child: const Text('View')),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.black12,
                                  height: 180,
                                  width: 180,
                                ),
                              ),
                              ElevatedButton(onPressed: (){}, child: const Text('View')),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.blueGrey,
                                  height: 180,
                                  width:180,
                                ),
                              ),
                              ElevatedButton(onPressed: (){}, child: const Text('View'))
                            ],
                          ),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                color:Colors.blueGrey,
                                height: 180,
                                width: 180,
                              ),
                              ElevatedButton(onPressed: (){}, child: const Text('View')
                              ),
                              Container(
                                  height: 180,
                                  width: 180,
                                  color: Colors.blue,
                                ),

                              ElevatedButton(onPressed: (){}, child: const Text('View')),
                              Container(
                                color: Colors.red,
                                width: 180,
                                height: 180,
                              ),
                              ElevatedButton(onPressed: (){}, child: const Text('View')),
                            ],
                          ),
                        )
                      ],
                    ),
      );
  }
}



