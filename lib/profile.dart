import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formfield = GlobalKey<FormState>();
  final companyName = TextEditingController();
  final companyEmail = TextEditingController();
  final phoneNumber = TextEditingController();
  final companyWebsiteLink = TextEditingController();
  final companyBio = TextEditingController();
  final experience = TextEditingController();
  final categories = TextEditingController();
  final workingTime = TextEditingController();
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
                              "Company Profile Information",
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
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Compnay Name",
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
                              controller: companyName,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0x00000061))),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "e.g Willow Tree",
                                  hintStyle: TextStyle(color: Colors.black87)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Company Name ";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Company Email",
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
                              controller: companyEmail,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0x00000061))),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "e.g Wiloowtree@gmail.com",
                                  hintStyle: TextStyle(color: Colors.black87)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Company Email";
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
                              keyboardType: TextInputType.phone,
                              controller: phoneNumber,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0x00000061))),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "e.g 1234556789",
                                  hintStyle: TextStyle(color: Colors.black87)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Phone Number";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Company Website link",
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
                              controller: companyWebsiteLink,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "https://alithemes.com",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Website Link";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Company Bio",
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
                              maxLines: 5,
                              minLines: 2,
                              controller: companyBio,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Company Bio";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Experience Required",
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
                              controller: experience,
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
                                  return "Enter Experience";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Categories",
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
                              controller: categories,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g UI/UX Design",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return "Enter Categories";
                                 }
                               },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Working Time",
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
                              controller: workingTime,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "e.g Full Time",
                                hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Work Time";
                                }
                              },
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formfield.currentState!.validate()) {
                                         companyName.clear();
                                         companyBio.clear();
                                         companyEmail.clear();
                                         categories.clear();
                                         categories.clear();
                                         companyWebsiteLink.clear();
                                         workingTime.clear();
                                         phoneNumber.clear();
                                         experience.clear();
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
                                  child: const Text('Save',
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
