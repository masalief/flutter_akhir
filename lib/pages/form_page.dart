import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rekeningController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 3, 12, 11),
            ),
            child: SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Tambah Pengguna Transfer",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 163, 171, 130),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                height: size.height - (size.height / 6),
                width: size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 74, 52),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      5,
                    ),
                    topRight: Radius.circular(
                      5,
                    ),
                    bottomLeft: Radius.circular(
                      5,
                    ),
                    bottomRight: Radius.circular(
                      5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15, top: 40),
                        child: TextFormField(
                          controller: _emailController,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Email Tidak Boleh Kosong!";
                            }
                            return null;
                          }),
                          decoration: InputDecoration(
                            hintText: "Masukan Email Anda",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            labelText: 'Email Anda',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 163, 171, 130),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 163, 171, 130),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: _rekeningController,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "No Rekening Tidak Boleh Kosong";
                            }
                            return null;
                          }),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Input No Rekening",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            labelText: 'No Rekening',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 163, 171, 130),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 163, 171, 130),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: _usernameController,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Username Tidak Boleh Kosong!";
                            }
                            return null;
                          }),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Username Pengguna",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            labelText: 'Username Anda',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 163, 171, 130),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 163, 171, 130),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        // width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 11, 106, 58),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              users.add({
                                "email": _emailController.text,
                                "rekening":
                                    int.tryParse(_rekeningController.text) ?? 0,
                                "username": _usernameController.text,
                                "balance": 0,
                              });
                              _emailController.text = "";
                              _rekeningController.text = "";
                              _usernameController.text = "";
                              Navigator.of(context).pop();
                            }
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    icon: Icon(
                                      Icons.check_circle_outline,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 15, 225, 120),
                                    title: Center(
                                      child: Text(
                                        "Berhasil Tambah Rekening Baru, Silahkan Transfer",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: const Text(
                            "Tambah",
                            style: TextStyle(
                              color: Color.fromARGB(255, 163, 171, 130),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
