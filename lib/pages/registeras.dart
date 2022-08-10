import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gg_1/api/firebase_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class RegisterAsPage extends StatefulWidget {
  const RegisterAsPage({Key? key}) : super(key: key);

  @override
  State<RegisterAsPage> createState() => _RegisterAsPageState();
}

class _RegisterAsPageState extends State<RegisterAsPage> {
  File? file;
  UploadTask? task;
  bool isUpload = false;

  bool isUploadPressed = false;

  int _value = 1;
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 244, 230),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 234, 244, 230),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  const Text(
                    ' Register as',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DM Sans'),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                  const Text(
                    ' Let\'s sign you up',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 10)),
                ],
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (_) {
                      setState(
                        () {
                          _value = 1;
                        },
                      );
                    },
                  ),
                  const Text('Trader',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DM Sans')),
                ],
              ),
              Container(
                width: 400,
                child: const Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(10, 20, 0, 0)),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (_) {
                      setState(
                        () {
                          _value = 2;
                        },
                      );
                    },
                  ),
                  const Text('Recycler',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DM Sans')),
                ],
              ),
              Container(
                width: 400,
                child: const Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (_) {
                      setState(
                        () {
                          _value = 3;
                        },
                      );
                    },
                  ),
                  const Text(
                    'Dismantler',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DM Sans'),
                  ),
                ],
              ),
              Container(
                width: 400,
                child: const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
            ],
          ), // radio button column closed
          const Divider(
            color: Colors.transparent,
          ),
          const SizedBox(
            height: 40,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 8, 73, 18)),
                  onPressed: () async {
                    await selectFile();
                  },
                  icon: Icon(Icons.attach_file),
                  label: Text(
                    "Select  File",
                    style: TextStyle(fontFamily: 'DM Sans'),
                  )),
            ],
          ),
          Text("$fileName",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DM Sans')),
          const SizedBox(height: 32),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 8, 73, 18)),
                  onPressed: () async {
                    await uploadFile();
                  },
                  icon: Icon(Icons.upload_file),
                  label: Text(
                    "Upload License",
                    style: TextStyle(fontFamily: 'DM Sans'),
                  )),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          task != null ? buildUploadStatus(task!) : Container(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.3,
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: ElevatedButton(
                onPressed: () {
                  User? user = FirebaseAuth.instance.currentUser;

                  var collection =
                      FirebaseFirestore.instance.collection('users');
                  // if (isUpload) {
                  //   collection
                  //       .doc(user?.email) // <-- Document ID
                  //       .update({'isLicenseUploaded': false}) // <-- Your data
                  //       .then((_) => print('Added'))
                  //       .catchError((error) => print('Add failed: $error'));
                  // }

                  collection
                      .doc(user?.email) // <-- Document ID
                      .update({'role': _value}) // <-- Your data
                      .then((_) => print('Added'))
                      .catchError((error) => print('Add failed: $error'));
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text('Incomplete Registration')));
                  if (isUpload) {
                    collection
                        .doc(user?.email) // <-- Document ID
                        .update({
                          'isLicenseUploaded': false,
                          'isUploadPressed': true,
                          
                        }) // <-- Your data
                        .then((_) => print('Added'))
                        .catchError((error) => print('Add failed: $error'));
                  }
                  

                  collection
                      .doc(user?.email) // <-- Document ID
                      .update({'isform': true}) // <-- Your data
                      .then((_) => print('Added'))
                      .catchError((error) => print('Add failed: $error'));
                  Navigator.of(context).pushNamed('/option');
                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(fontFamily: 'DM Sans'),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 8, 73, 18)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )))),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(10, 300, 0, 0)),
          Container(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: [
              const Text(
                'We ensure that your data is confidential and secure',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ]),
          )),
        ],
      ),
    );
  }

  late File _result;
  Future selectFile() async {
    final _result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (_result == null) {
      return "Please Select File";
    }
    final path = _result.files.single.path!;

    setState(() => file = File(path));
  }

  Future<String> uploadFile() async {
    if (file == null) {
      return "Please Select File";
    }
    User? user = FirebaseAuth.instance.currentUser;
    final fileName = basename(file!.path);
    final destination = 'license/${user?.email}/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});
    if (task == null) {
      return "Please Upload";
    }

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
    isUploadPressed = true;
    isUpload = true;
    return urlDownload;
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DM Sans'),
            );
          } else {
            return Container();
          }
        },
      );
}