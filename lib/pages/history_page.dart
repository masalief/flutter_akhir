import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
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
                Radius.circular(5),
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
          for (int i = 0; i < 12; i++)
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 3),
                  width: 420,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: Color.fromARGB(255, 4, 136, 70),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(
                    user.email! + ' ' + 'Kamu Berhasil Top Up ${i}',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
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
          for (int i = 0; i < 12; i++)
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 3),
                  width: 420,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: Color.fromARGB(255, 255, 92, 92),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(
                    user.email! + ' ' + 'Kamu Berhasil Transfer ${i}',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
