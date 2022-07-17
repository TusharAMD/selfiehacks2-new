import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:selfiehacks2/dashboard.dart';
import 'package:selfiehacks2/googlesignin.dart';
import 'package:provider/provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAzDdzTCYn5rs9AO1QPkDTusRApYlkIjgk",
      appId: "1:525550561564:android:00f719bbd287277d63f2d9",
      messagingSenderId: "525550561564",
      projectId: "savvy2glory",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'savvy2glory',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Color.fromARGB(255, 186, 253, 208),
        ),
        home: const MyHomePage(title: 'Savvy2Glory'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TextField(controller: controller,),
            //IconButton(onPressed: (){final name=controller.text; createEntry(name:name);}, icon: const Icon(Icons.add))
            Registration()
          ],
        ),
      ),

    );
  }

  //read in firestore


  //create in firestore
  Future createEntry({required String name}) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = {
      'name':name,
      'age':20,
    };
    await docUser.set(json);
  }
}


// Register Screen

class Registration extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (true){
          return Container(
            height:size.height,
            child: Dashboard(),
          );
        }
        else{
        return Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children:
              <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset("assets/images/top-left.png", width: size.width*0.3,),
                ),
                Positioned(
                  bottom: size.height*0.2,
                  left: 0,
                  child: Image.asset("assets/images/bottom-left.png", width: size.width*0.2,),
                ),
                Positioned(
                  top: -10,
                  right: -10,
                  child: Image.asset("assets/images/top-right.png", width: size.width*0.3,),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset("assets/images/bottom-right.png", width: size.width*0.3,),
                ),
                Positioned(
                  top: size.height/8,
                  right: size.width/4,
                  child: Image.asset("assets/images/center.png", width: size.width*0.6,),
                ),
                Positioned(
                    bottom: size.height*0.2,
                    child: ElevatedButton(onPressed:() {
                      2;
                    }, child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(size.width*0.8, 50)
                        )
                    )
                ),
                Positioned(
                    bottom: (size.height*0.2)-50,
    
                    child: ElevatedButton(onPressed:() {
                      //final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                      //provider.googleLogin();
                    },
                        child: Text("Sign Up",
                            style:TextStyle(color: Colors.green)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.green,
                            minimumSize: Size(size.width*0.8, 50)
                        )
                    )
                )
    
              ],
    
            )
        );}
      }
    );
  }
}
