import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:landingpage/profile_screen.dart';
import 'package:landingpage/statWidget.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(230, 180, 190, 0.9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Image(
              alignment: Alignment.center,
              image: AssetImage('lib/assets/icons/unnamed.png'),
              width: 200,
            ),
            const SizedBox(
              height:100.0,
            ),
            SizedBox(
              width:200.0,
              height:50.0,
              child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
              },
                  child: Text("User Login",
                      style: TextStyle(fontSize: 22)),
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              ),

            ),
            const SizedBox(
              height:40.0,
            ),
            SizedBox(
              width:200.0,
              height:50.0,
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeAdminPage()),
                );
              },
                  child: Text("Admin Login",
                  style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              ),
            ),
            const SizedBox(
              height:40.0,
            ),
          ],
        )
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);


  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 180, 190, 0.9),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return const LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );

  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState  createState() => _LoginScreenState();
}

class _LoginScreenState  extends State<LoginScreen> {

  //Login

  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;

    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print("No user found for that email");
      }
    }
    return user;
  }



  @override
  Widget build(BuildContext context){
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children:[
                const Text(
                  "Golden Hour",
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                const Image(
                  alignment: Alignment.center,
                  image: AssetImage('lib/assets/icons/unnamed.png'),
                  width: 100,
                ),
              ],
            ),

            const Text(
              "User Login",
              style:TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:const InputDecoration(
                hintText: "User Email",
                prefixIcon: Icon(Icons.mail, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration:const InputDecoration(
                hintText: "User Password",
                prefixIcon: Icon(Icons.lock, color: Colors.black),

              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Text(
              "Don't Remember your Password?",
              style: TextStyle(color: Colors.red,
              fontWeight: FontWeight.bold),

            ),
            const SizedBox(
              height:88.0,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color(0xFFF24237),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () async{
                  User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                  print(user);
                  if(user != null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfileScreen()));

                  }
                },
                child: const Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const SizedBox(
              height:40.0,
            ),

          ],
        )
    );
  }
}



// Admin Page




class HomeAdminPage extends StatefulWidget{
  const HomeAdminPage({Key? key}) : super(key: key);

  @override
  _HomeAdminPageState createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 180, 190, 0.9),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return const LoginAdminScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );

  }
}

class LoginAdminScreen extends StatefulWidget {
  const LoginAdminScreen({Key? key}) : super(key: key);

  @override
  _LoginAdminScreenState  createState() => _LoginAdminScreenState();
}

class _LoginAdminScreenState  extends State<LoginAdminScreen> {

  //Login

  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;

    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print("No user found for that email");
      }
    }
    return user;
  }



  @override
  Widget build(BuildContext context){
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children:[
                const Text(
                "Golden Hour",
                style:TextStyle(
                  color: Colors.black,
                  fontSize: 44.0,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                const Image(
                  alignment: Alignment.center,
                  image: AssetImage('lib/assets/icons/unnamed.png'),
                  width: 100,
                ),
              ],
            ),

            const Text(
              "Admin Login",
              style:TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:const InputDecoration(
                hintText: "Admin Email",
                prefixIcon: Icon(Icons.mail, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration:const InputDecoration(
                hintText: "Admin Password",
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Text(
              "Don't Remember your Password?",
              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),

            ),
            const SizedBox(
              height:88.0,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color(0xFFF24237),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () async{
                  User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                  print(user);
                  if(user != null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> AdminHomePage()));

                  }
                },
                child: const Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    )),
              ),
            ),
          ],
        )
    );
  }
}

// Admin Pages


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}


class _AdminHomePageState extends State<AdminHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
          elevation: 0.0,
        ),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //statWidget("Post", "7"),
                  statWidget("Ambulances On The Way", ""),
                  //statWidget("Follow", "36"),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    children:[
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(color:Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 80,
                                child: Image.asset('lib/assets/icons/ambulanceicon.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ambulance 1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('KA03MC1432',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text('20 min',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),


                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Page8()));
                          }, child: Icon(Icons.arrow_forward_ios),)

                        ],
                      )
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    children:[
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(color:Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 80,
                                child: Image.asset('lib/assets/icons/ambulanceicon.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ambulance 2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('KA04MD0007',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text('8 min',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),


                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Page8()));
                          }, child: Icon(Icons.arrow_forward_ios),)

                        ],
                      )
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    children:[
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(color:Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 80,
                                child: Image.asset('lib/assets/icons/ambulanceicon.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ambulance 3',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('KA02MC7600',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text('20 min',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),


                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Page8()));
                          }, child: Icon(Icons.arrow_forward_ios),)

                        ],
                      )
                    ]
                ),
              ),



            ],
          ),
        )
    );
  }
}

class Page8 extends StatelessWidget {
  String avatarUrl = 'lib/assets/icons/person.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
        elevation: 0.0,
        title: const Text(
          "Profile Page",
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(height: 12.0,
            ),
            Text("Eren Jager",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Age:34",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text("Blood Group:O+",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text("Gender:Male",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),


            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //statWidget("Post", "7"),
                statWidget("Current Medical Situation", ""),
                //statWidget("Follow", "36"),
              ],

            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(color:Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 150,
                              child: Image.asset('lib/assets/icons/cardiogram.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Heart Attack',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('13th November, 2022',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),

                                Text(
                                  'Height:165cm',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Weight:75.06kg',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ]
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
            },
              child: Text('Medical History', style: TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),)
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  String avatarUrl = 'lib/assets/icons/person.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
        elevation: 0.0,
        title: const Text(
          "Profile Page",
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(height: 12.0,
            ),
            Text("Eren Jager",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12.0,),
            Text("Age:34            Blood Group:O+",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            //Text("Email id:@erenjager",
            //style: TextStyle(
            //color: Colors.grey,
            //fontWeight: FontWeight.w400,
            //fontSize: 16,
            //),
            //),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //statWidget("Post", "7"),
                statWidget("Past Medical Records", ""),
                //statWidget("Follow", "36"),
              ],

            ),


            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(color:Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 80,
                              child: Image.asset('lib/assets/icons/cardiogram.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Heart Attack',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('4th January, 2018',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Page3()));
                        }, child: Icon(Icons.arrow_forward_ios),)

                      ],
                    )
                  ]
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(color:Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 80,
                              child: Image.asset('lib/assets/icons/cardiogram.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Heart irregularities',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('23rd May, 2015',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Page4()));
                        }, child: Icon(Icons.arrow_forward_ios),)

                      ],
                    )
                  ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(color:Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 80,
                              child: Image.asset('lib/assets/icons/cardiogram.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Heart Ache',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('17th February, 2015',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Page5()));
                        }, child: Icon(Icons.arrow_forward_ios),)

                      ],
                    )
                  ]
              ),
            ),


          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  String avatarUrl = 'lib/assets/icons/person.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
        elevation: 0.0,
        title: const Text(
          "Profile Page",
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(height: 12.0,
            ),
            Text("Eren Jager",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12.0,),
            Text("Age:34            Blood Group:O+",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            //Text("Email id:@erenjager",
            //style: TextStyle(
            //color: Colors.grey,
            //fontWeight: FontWeight.w400,
            //fontSize: 16,
            //),
            //),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //statWidget("Post", "7"),
                statWidget("Details", ""),
                //statWidget("Follow", "36"),
              ],

            ),


            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(color:Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 80,
                              child: Image.asset('lib/assets/icons/cardiogram.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mr Jager was brought to the clinic in',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'a wheel chair. His mood was euthymic.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text('He did not have psychotic symptoms.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Date of examination: 5th Jan 2018',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Diagnosis:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text('Dimensia, Stroke',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Relevant investigation results:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text('[Results of CT brain, MRI scan to be stated.] ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),


                      ],
                    )
                  ]
              ),
            ),



          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  String avatarUrl = 'lib/assets/icons/person.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
        elevation: 0.0,
        title: const Text(
          "Profile Page",
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(height: 12.0,
            ),
            Text("Eren Jager",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12.0,),
            Text("Age:34            Blood Group:O+",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            //Text("Email id:@erenjager",
            //style: TextStyle(
            //color: Colors.grey,
            //fontWeight: FontWeight.w400,
            //fontSize: 16,
            //),
            //),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //statWidget("Post", "7"),
                statWidget("Details", ""),
                //statWidget("Follow", "36"),
              ],

            ),


            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(color:Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 80,
                              child: Image.asset('lib/assets/icons/cardiogram.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mr Jager was unable to perform',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'simple arithmetic, such as 4 plus 3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text('giving 8 as the answer',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Date of examination: 23rd May 2015',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Diagnosis:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text('Atrial Fibrillation',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),


                      ],
                    )
                  ]
              ),
            ),



          ],
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  String avatarUrl = 'lib/assets/icons/person.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(230, 180, 190,0.9),
        elevation: 0.0,
        title: const Text(
          "Profile Page",
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(height: 12.0,
            ),
            Text("Eren Jager",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12.0,),
            Text("Age:34            Blood Group:O+",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            //Text("Email id:@erenjager",
            //style: TextStyle(
            //color: Colors.grey,
            //fontWeight: FontWeight.w400,
            //fontSize: 16,
            //),
            //),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //statWidget("Post", "7"),
                statWidget("Details", ""),
                //statWidget("Follow", "36"),
              ],

            ),


            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(color:Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 80,
                              child: Image.asset('lib/assets/icons/cardiogram.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The clinical impression was that he'
                                  ,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'was manifesting behavioural',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text('symptoms secondary to Dementia.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Date of examination: 20 Feb 2015',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Diagnosis:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text('Pressure in Chest.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),


                      ],
                    )
                  ]
              ),
            ),



          ],
        ),
      ),
    );
  }
}

