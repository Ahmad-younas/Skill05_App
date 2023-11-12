import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_05/utils.dart';

class PostJob extends StatefulWidget {
  const PostJob({super.key});

  @override
  State<PostJob> createState() => _PostJobState();
}

class _PostJobState extends State<PostJob> {
  final _formfield = GlobalKey<FormState>();
  final jobTitle = TextEditingController();
  final country = TextEditingController();
  final city = TextEditingController();
  final salary = TextEditingController();
  final workType = TextEditingController();
  final jobDescription = TextEditingController();
  final tags = TextEditingController();
  bool passToggle = true;

  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
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
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(padding: EdgeInsets.only(left: 20.0, top: 30.0),
                //     child: Container(
                //       child: IconButton(icon: const Icon(Icons.arrow_back_ios_sharp),
                //         onPressed: () {
                //           Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=>HomeScreen()));
                //         },),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Container(
                    child: Center(
                      child: Form(
                        key: _formfield,
                        child: Column(
                          children: [
                            const Text(
                              "Post Your Job",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF961208)),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Please fill out the company details",
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            _image != null ?
                                CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                ):
                            CircleAvatar(
                              radius: 64,
                            ),
                            Positioned(
                                child: IconButton(
                                    onPressed: selectImage,
                                    icon: const Icon(Icons.add_a_photo),
                                ),
                              bottom: -10,
                              left: 80,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Job Title",
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
                              controller: jobTitle,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00000061))),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "e.g Senior Product Designer",
                                  hintStyle: TextStyle(color: Colors.black87)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Job Title ";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Country",
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
                              controller: country,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00000061))),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "e.g USA",
                                  hintStyle: TextStyle(color: Colors.black87)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Country";
                                }
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
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
                              keyboardType: TextInputType.emailAddress,
                              controller: city,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00000061))),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "e.g New York",
                                  hintStyle: TextStyle(color: Colors.black87)),
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
                                  "Salary",
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
                              controller: salary,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "2200-2500",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Salary";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Work Type",
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
                              controller: workType,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g remote",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Work Type";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Job Description",
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
                              controller: jobDescription,
                              maxLines: 7,
                              minLines: 2,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    "e.g The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Job description";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Tags(optionals",
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
                              controller: tags,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Figma, UI/UX",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "Enter ";
                              //   }
                              // },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formfield.currentState!.validate())
                                      jobDescription.clear();
                                      country.clear();
                                      city.clear();
                                      salary.clear();
                                      workType.clear();
                                      jobDescription.clear();
                                      tags.clear();
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
                                  child: const Text('Post Job',
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
}
