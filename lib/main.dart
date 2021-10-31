import 'package:flutter/material.dart';
import 'package:task/medication.dart';
import 'package:task/physio.dart';

void main()
{
    runApp(MaterialApp(
      title: "help",
      home: MyApp(),
    ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
          "Helping hand",),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
          padding: EdgeInsets.only(left: 110.0),
         child: ElevatedButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> Medication()),);
         }, child: Text("MEDICATION",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),)
              ),
        ),
          SizedBox(height: 5.0,),
          Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Physio()));
            }, child:  Text("PHYSIOTHERAPY",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),)),
          )
        ]
      ),
    );
  }
}
