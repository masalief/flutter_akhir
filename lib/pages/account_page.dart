import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance.collection("user");
    var userCurrent = FirebaseAuth.instance.currentUser;

    // String username = "";
    // String rekening = "";

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 12, 11),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white54,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: 7,
                      ),
                    ],
                    // shape: BoxShape.circle,
                    color: Color.fromARGB(255, 0, 74, 52),
                    image: DecorationImage(
                      image: AssetImage('images/aang.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: FutureBuilder<DocumentSnapshot>(
                future: users.doc(userCurrent!.uid).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    String username = snapshot.data!['username'];
                    return Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          width: 420,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color.fromARGB(255, 0, 74, 52),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Text(
                            'Selamat Datang : ' + '$username',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'avenir',
                              color: Color.fromARGB(255, 163, 171, 130),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 163, 171, 130),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: FutureBuilder<DocumentSnapshot>(
                future: users.doc(userCurrent!.uid).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    int rekening = snapshot.data!['rekening'];
                    return Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          width: 420,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color.fromARGB(255, 0, 74, 52),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Text(
                            'Rekening Aktif : ' + '$rekening',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'avenir',
                              color: Color.fromARGB(255, 163, 171, 130),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 163, 171, 130),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 400,
            ),
            Container(
              alignment: Alignment.center,
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color.fromARGB(255, 0, 74, 52),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.exit_to_app_outlined,
                  size: 25,
                  color: Color.fromARGB(255, 163, 171, 130),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
