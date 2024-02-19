import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Portfilio extends StatefulWidget {
  const Portfilio({super.key});

  @override
  State<Portfilio> createState() => _PortfilioState();
}

class _PortfilioState extends State<Portfilio> {

  late File selectedFile = File('');
  Future<void> _pickAndUploadFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });

      // Upload the file to the server
      await _uploadFile(selectedFile);
    }
  }

  Future<void> _uploadFile(File file) async {
    // Replace "YOUR_SERVER_ENDPOINT" with your server endpoint
    var url = Uri.parse('YOUR_SERVER_ENDPOINT');

    var request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading file: $error');
    }
  }
  String _fileText = "";
  final _formfield = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final birthDate = TextEditingController();
  final fatherName = TextEditingController();
  final cNIC = TextEditingController();
  final city = TextEditingController();
  final position = TextEditingController();
  final yearExp = TextEditingController();
  final preCompany = TextEditingController();
  final expertise = TextEditingController();
  final university = TextEditingController();
  final degree = TextEditingController();
  final cGPA = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Container(
                    child: Center(
                      child: Form(
                        key: _formfield,
                        child: Column(
                          children: [
                            const Text(
                              "Your Portfolio",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF961208)),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Please fill out the following details",
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Personal Information",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold) ,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "FirstName",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: firstName,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061)),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "e.g John",
                                  hintStyle: TextStyle(color: Colors.black87)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter First Name ";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Last Name",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: lastName,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0x00000061))),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "e.g smith",
                                  hintStyle: TextStyle(color: Colors.black87)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Last Name";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Birth Date",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: birthDate,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0x00000061))),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "e.g 04/07/1997",
                                  hintStyle: TextStyle(color: Colors.black87)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Birth Date";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "FatherName",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: fatherName,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Zachary",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Father Name";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "CONIC Number",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: cNIC,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "36502-0000000-7",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter CONIC Number";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "City",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: city,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "New York",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter City";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Experience",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold) ,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Position",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: position,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g Junior Software Engineer",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Position";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Year of Experience",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: yearExp,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g 2 year",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Year of experience";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Previous Company Name",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: preCompany,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g facebook",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Previous Company Name";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Expertise",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 5,
                              maxLength: 1000,
                              controller: expertise,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Java. SpringBoot",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Your Expertise";
                                }
                              },
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Education",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold) ,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "University",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: university,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g Harvard",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Your University";
                                }
                              },
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Degree",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: degree,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g BS Computer Science",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Your Degree";
                                }
                              },
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "CGPA",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: cGPA,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g 3.4",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Your CGPA";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Portfolio",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold) ,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Email",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: email,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g example123@gmail.com",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Your CGPA";
                                }
                                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                                if(!emailValid){
                                  return "Enter Valid Email";
                                }
                              },
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Phone Number",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: phoneNumber,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: TextStyle(color: Colors.black87),
                                hintText: "+92301- 00000000"
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Phone Number";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => _pickAndUploadFile(context),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Upload File'),
                                  SizedBox(width: 8), // Adjust the spacing between text and icon
                                  Icon(Icons.file_upload), // Replace with your desired icon
                                ],
                              )
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("$selectedFile")
                          ],
                        ) ,




                            const SizedBox(
                              height: 20,
                            ),
                            Text(_fileText),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formfield.currentState!.validate()) {
                                      firstName.clear();
                                      lastName.clear();
                                      birthDate.clear();
                                      fatherName.clear();
                                      cNIC.clear();
                                      city.clear();
                                      position.clear();
                                      yearExp.clear();
                                      preCompany.clear();
                                      expertise.clear();
                                      university.clear();
                                      degree.clear();
                                      cGPA.clear();
                                      email.clear();
                                      phoneNumber.clear();
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFF961208)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(5)),
                                      )),
                                  child: const Text('Update',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf']
    );

    if( result != null && result.files.single.path != null){
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.extension);
      print(file.name);
      print(file.path);

      File _file = File(result.files.single.path!);
      setState(() {
        _fileText = _file.path;
      });
    }else{

    }
  }
}

