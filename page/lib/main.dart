import 'package:flutter/material.dart';
import 'package:page/stat_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
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
                                    color: Colors.grey[600],
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
                                        color: Colors.grey[600],
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
                                    color: Colors.grey[600],
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
                                        color: Colors.grey[600],
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
                                    color: Colors.grey[600],
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
                                        color: Colors.grey[600],
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
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text("Blood Group:O+",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text("Gender:Male",
                  style: TextStyle(
                    color: Colors.grey,
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
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),

                                Text(
                                  'Height:165cm',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Weight:75.06kg',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
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
                color: Colors.grey,
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
                                    color: Colors.grey[600],
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
                                    color: Colors.grey[600],
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
                                    color: Colors.grey[600],
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
                color: Colors.grey,
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
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'a wheel chair. His mood was euthymic.',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                Text('He did not have psychotic symptoms.',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Date of examination: 5th Jan 2018',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Diagnosis:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text('Dimensia, Stroke',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Relevant investigation results:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text('[Results of CT brain, MRI scan to be stated.] ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
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
        backgroundColor: Colors.white,
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
                color: Colors.grey,
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
                                  'Mr Jager was unable to perform simple',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'arithmetic, such as 4 plus 3 giving',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                Text('8 as the answer',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Date of examination: 23rd May 2015',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Diagnosis:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text('Atrial Fibrillation',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[600],
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
        backgroundColor: Colors.white,
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
                color: Colors.grey,
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
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'was manifesting behavioural',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                Text('symptoms secondary to Dementia.',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Date of examination: 20 Feb 2015',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Diagnosis:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text('Pressure in Chest.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[600],
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



