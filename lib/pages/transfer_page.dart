import 'package:alief_flutter/pages/home_page.dart';
import 'package:alief_flutter/pages/topup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  TransferPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
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
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 15),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 100,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Text(
                        "Transfer ke : " + " " + user.email!,
                        style: TextStyle(
                          color: Color.fromARGB(255, 163, 171, 130),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "No Rekening : " + " " + user.email!,
                        style: TextStyle(
                          color: Color.fromARGB(255, 163, 171, 130),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Call Center 24 Jam Hub 911",
                        style: TextStyle(
                          color: Color.fromARGB(255, 163, 171, 130),
                        ),
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
          ],
        ),
      ),
    );
  }
}
