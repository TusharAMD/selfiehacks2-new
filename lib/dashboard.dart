import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List items = ["a","b","c","d"];
    return Stack(
      children: <Widget>[
        Container(
          height: size.height*0.45,
          decoration: const BoxDecoration(
            color: Color.fromARGB(250, 253, 146, 142),
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
              image: AssetImage('assets/images/dashboardback.png'),),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 108, 103),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.notifications,color: Colors.white,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Hello \nTushar Amdoskar",
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                
                child: TextField(
                  decoration: new InputDecoration(icon:Icon(Icons.search), border: InputBorder.none,hintText: "What service you want today",)
                  
                ),
              ),
            ),
          /*
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount:3,
            itemBuilder: (context,index){
              final item = items[index];
              return ListTile(title: Text(item),);
            },
          
          )*/
         Flexible(
            
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context,index){
                final item =  items[index];
                return ListTile(title: Container(
                  padding: EdgeInsets.only(top:20),
                  margin: EdgeInsets.only(top:20),
                  decoration:BoxDecoration(
                    color:Color.fromARGB(255, 243, 234, 114),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Shop Name"),
                    ],
                  )
                  ),

                );
              }))
            
          ],
        ),
        
      ],
      
    );
  }
}