import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var users = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var users = FirebaseFirestore.instance
        .collection("user/${user!.uid}/history_topup");

    // String username = "";
    // String rekening;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 19,
        top: 5,
      ),
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 5,
            ),
            width: 420,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
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
              "CATATAN TRANSAKSI SAYA",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'avenir'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 10,
            ),
            width: 200,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
              color: Color.fromARGB(255, 0, 74, 52),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Text(
              "RIWAYAT TOP UP",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'avenir'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: users.where('keterangan', isEqualTo: 'topup').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 4, 136, 70),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot users = snapshot.data!.docs[index];

                      return Padding(
                        padding: EdgeInsets.all(1),
                        child: GestureDetector(
                          onTap: () {
                            // Get.toNamed("/DetailHistory",
                            //     parameters: {
                            //       "id": snapshot.data!.docs[index].id,
                            //       "tanggalBeli":
                            //           history["tanggalBeli"]
                            //     });
                            print(snapshot.data!.docs[index].id);
                          },
                          child: Card(
                            child: Text(
                              "Uang Masuk Senilai Rp. ${users['nominal'].toString()} Detail : ${users['keterangan']}",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 163, 171, 130),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Text("Loading");
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 10,
            ),
            width: 200,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(3),
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
              "RIWAYAT TRANSFER",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'avenir'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
            stream:
                users.where('keterangan', isEqualTo: 'transfer').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  alignment: Alignment.centerLeft,
                  color: Color.fromARGB(255, 255, 92, 92),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot users = snapshot.data!.docs[index];

                      return Padding(
                        padding: EdgeInsets.all(1),
                        child: GestureDetector(
                          onTap: () {
                            // Get.toNamed("/DetailHistory",
                            //     parameters: {
                            //       "id": snapshot.data!.docs[index].id,
                            //       "tanggalBeli":
                            //           history["tanggalBeli"]
                            //     });
                            print(snapshot.data!.docs[index].id);
                          },
                          child: Card(
                            child: Text(
                              "Uang Keluar Senilai Rp.${users['nominal']} Detail : ${users['keterangan']}",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 163, 171, 130),
                                fontFamily: "Inter",
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Text("Loading");
              }
            },
          ),
        ],
      ),
    );
  }
}
