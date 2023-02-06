import 'package:alief_flutter/pages/carousel_slider.dart';
import 'package:alief_flutter/pages/form_page.dart';
import 'package:alief_flutter/pages/topup_page.dart';
import 'package:alief_flutter/pages/transfer_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var users = FirebaseFirestore.instance.collection("users");
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance.collection("user");
    var user = FirebaseAuth.instance.currentUser;

    return Container(
      padding: EdgeInsets.all(30),
      child: FutureBuilder<DocumentSnapshot>(
        future: users.doc(user!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          //Error Handling conditions
          // Check for connection state then check if snapshot has error
          if (snapshot.connectionState == ConnectionState.done) {
            // Chceck if there is error then check if snapshot has data
            if (!snapshot.hasError) {
              // Check if snapshot has data then return the data
              if (snapshot.hasData) {
                String username = snapshot.data!['username'];
                int rekening = snapshot.data!['rekening'];

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/logogt.png'),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                          },
                          icon: Icon(
                            Icons.exit_to_app_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 163, 171, 130),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        'Selamat datang, $username',
                        style: TextStyle(
                          color: Color.fromARGB(255, 163, 171, 130),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "No. Rekening : $rekening ",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'avenir',
                        color: Color.fromARGB(255, 163, 171, 130),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Color.fromARGB(255, 0, 74, 52),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                "Sisa Saldo Kamu : ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 163, 171, 130),
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                "233.203.652",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 163, 171, 130),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 163, 171, 130),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.1),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TopupPage(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white54,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transfer Uang",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'avenir',
                            color: Color.fromARGB(255, 163, 171, 130),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 163, 171, 130),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FormPage(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Color.fromARGB(255, 0, 74, 52),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: AssetImage('images/avatar1.png'),
                                      fit: BoxFit.contain,
                                    ),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 163, 171, 130),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TransferPage(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: Color.fromARGB(255, 163, 171, 130),
                                  ),
                                ),
                                Text(
                                  user.email!,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: 'avenir',
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 163, 171, 130),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Color.fromARGB(255, 0, 74, 52),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: AssetImage('images/avatar2.png'),
                                      fit: BoxFit.contain,
                                    ),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 163, 171, 130),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TransferPage(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: Color.fromARGB(255, 163, 171, 130),
                                  ),
                                ),
                                Text(
                                  user.email!,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: 'avenir',
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 163, 171, 130),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Color.fromARGB(255, 0, 74, 52),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: AssetImage('images/avatar3.png'),
                                      fit: BoxFit.contain,
                                    ),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 163, 171, 130),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TransferPage(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: Color.fromARGB(255, 163, 171, 130),
                                  ),
                                ),
                                Text(
                                  user.email!,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: 'avenir',
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 163, 171, 130),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terdaftar dan Diawasi Oleh',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'avenir',
                            color: Color.fromARGB(255, 163, 171, 130),
                          ),
                        ),
                        Container(
                          child: Carousel(),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text("Document does not exist"),
                );
              }
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 163, 171, 130),
              ),
            );
          }
        },
      ),
    );
  }
}
