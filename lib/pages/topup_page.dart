// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

final balance = TextEditingController();

class _TopupPageState extends State<TopupPage> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 12, 11),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 85,
                  width: 425,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 74, 52),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Image.asset(
                            "images/shopee.png",
                            height: 120,
                            width: 120,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 163, 171, 130),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: balance,
                                    decoration: InputDecoration(
                                      labelText: "Anda Menggunakan Shopee",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        balance.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Batal',
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          users.doc(user!.uid).update({
                                            "balance": FieldValue.increment(
                                                int.parse(balance.text))
                                          });
                                          users
                                              .doc(user!.uid)
                                              .collection('history_topup')
                                              .add({
                                            "keterangan": 'topup',
                                            "nominal": int.parse(balance.text),
                                            // "on_user":'topup',
                                          });
                                        });
                                        balance.clear();
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const AlertDialog(
                                                icon: Icon(
                                                  Icons.check_circle_outline,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 163, 171, 130),
                                                ),
                                                backgroundColor: Color.fromARGB(
                                                    255, 0, 74, 52),
                                                title: Center(
                                                  child: Text(
                                                    "Yeay Kamu Berhasil Isi Saldo !",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 163, 171, 130),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Text('Topup'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          // ignore: prefer_const_constructors
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
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 85,
                  width: 425,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 74, 52),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Image.asset(
                            "images/indomaret.png",
                            height: 120,
                            width: 120,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 163, 171, 130),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: balance,
                                    decoration: InputDecoration(
                                      labelText: "Anda Menggunakan Indomaret",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        balance.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Batal',
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          users.doc(user!.uid).update({
                                            "balance": FieldValue.increment(
                                                int.parse(balance.text))
                                          });
                                          users
                                              .doc(user!.uid)
                                              .collection('history_topup')
                                              .add({
                                            "keterangan": 'topup',
                                            "nominal": int.parse(balance.text),
                                            // "on_user":'topup',
                                          });
                                        });
                                        balance.clear();
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const AlertDialog(
                                                icon: Icon(
                                                  Icons.check_circle_outline,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 163, 171, 130),
                                                ),
                                                backgroundColor: Color.fromARGB(
                                                    255, 0, 74, 52),
                                                title: Center(
                                                  child: Text(
                                                    "Kamu Berhasil Isi Saldo !",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 163, 171, 130),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Text('Topup'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          // ignore: prefer_const_constructors
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
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 85,
                  width: 425,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 74, 52),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Image.asset(
                            "images/atm.png",
                            height: 120,
                            width: 120,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 163, 171, 130),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: balance,
                                    decoration: InputDecoration(
                                      labelText: "Anda Menggunakan Debit",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 67, 46, 151),
                                        ),
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        balance.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Batal',
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          users.doc(user!.uid).update({
                                            "balance": FieldValue.increment(
                                                int.parse(balance.text))
                                          });
                                          users
                                              .doc(user!.uid)
                                              .collection('history_topup')
                                              .add({
                                            "keterangan": 'topup',
                                            "nominal": int.parse(balance.text),
                                            // "on_user":'topup',
                                          });
                                        });
                                        balance.clear();
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const AlertDialog(
                                                icon: Icon(
                                                  Icons.check_circle_outline,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 163, 171, 130),
                                                ),
                                                backgroundColor: Color.fromARGB(
                                                    255, 0, 74, 52),
                                                title: Center(
                                                  child: Text(
                                                    "Kamu Berhasil Isi Saldo !",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 163, 171, 130),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Text('Topup'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          // ignore: prefer_const_constructors
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
