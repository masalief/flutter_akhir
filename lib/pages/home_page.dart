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
  var users = FirebaseFirestore.instance.collection("user q");

  @override
  Widget build(BuildContext context) {
    // var users = FirebaseFirestore.instance.collection("user");
    // var user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');
    User? user = FirebaseAuth.instance.currentUser;
    return Container(
      padding: EdgeInsets.all(30),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('user').snapshots(),
        builder: (context, snapshotw) {
          return FutureBuilder<DocumentSnapshot>(
            future: users.doc(user!.uid).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (!snapshot.hasError) {
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
                            'Selamat Datang, $username',
                            style: TextStyle(
                              color: Color.fromARGB(255, 163, 171, 130),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "No. Rekening : $rekening ",
                          style: TextStyle(
                            fontSize: 12,
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
                                  Container(
                                    height: 25,
                                    width: 150,
                                    child: StreamBuilder<DocumentSnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('user')
                                          .doc(user!.uid)
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            snapshot.data!['balance']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 163, 171, 130),
                                            ),
                                          );
                                        } else {
                                          return Text('Saldo Kosong');
                                        }
                                      },
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                height: 140,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshotw.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot data =
                                        snapshotw.data!.docs[index];
                                    return Container(
                                      margin: EdgeInsets.only(right: 8),
                                      height: 60,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        color: Color.fromARGB(255, 0, 74, 52),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.transparent,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'images/avatar1.png'),
                                                fit: BoxFit.contain,
                                              ),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 163, 171, 130),
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: TextField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller: balance,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            "Masukkan Nominal Transfer",
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.amber,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          balance.clear();
                                                        },
                                                        child: Text('Batal'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Colors.redAccent,
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          users
                                                              .doc(data.id)
                                                              .update({
                                                            "balance": FieldValue
                                                                .increment(int
                                                                    .parse(balance
                                                                        .text))
                                                          });

                                                          users
                                                              .doc(user.uid)
                                                              .update({
                                                            "balance": FieldValue
                                                                .increment(-int
                                                                    .parse(balance
                                                                        .text))
                                                          });

                                                          users
                                                              .doc(user.uid)
                                                              .collection(
                                                                  'history_topup')
                                                              .add({
                                                            "keterangan":
                                                                'transfer',
                                                            "nominal":
                                                                int.parse(
                                                                    balance
                                                                        .text),
                                                            // "on_user":'topup',
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                          balance.clear();
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return const AlertDialog(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .check_circle_outline,
                                                                    size: 50,
                                                                    color: Color.fromARGB(255, 163, 171, 130),
                                                                  ),
                                                                  backgroundColor:
                                                                      Color.fromARGB(255, 0, 74, 52),
                                                                  title: Center(
                                                                    child: Text(
                                                                      "Transfer Berhasil !",
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(255, 163, 171, 130),
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                        child: Text(
                                                          'Kirim',
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors.amber,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            // ignore: prefer_const_constructors
                                            icon: Icon(
                                              Icons.send,
                                              color: Color.fromARGB(
                                                  255, 163, 171, 130),
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            '${data['username']}',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'avenir',
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 163, 171, 130),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
          );
        },
      ),
    );
  }
}
