import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  void initState() {
    super.initState();
    fetchInformation();
  }
  final _formfield = GlobalKey<FormState>();
   TextEditingController companyName = TextEditingController();
  TextEditingController companyEmail = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController companyWebsiteLink = TextEditingController();
  TextEditingController companyBio = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController categories = TextEditingController();
  TextEditingController workingTime = TextEditingController();

  List<Map<String, dynamic>>? _data;
  int _dataLength = 0;
  Future fetchData() async {
    final response = await http.post(Uri.parse('http://10.0.2.2:3001/api/recruiter/updateProfileInfo'),body: {
      'companyName': companyName.text,
      'companyEmail':companyEmail.text,
      'phoneNumber':phoneNumber.text,
      'companyWebsite':companyWebsiteLink.text,
      'bio':companyBio.text,
      'experience':experience.text,
      'categories':categories.text,
      'workingTime':workingTime.text
    },
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    );
    print(response.body);
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('successfully Updated the Company Profile!'),
          duration: Duration(seconds: 2),
        ),
      );
      companyBio.clear();
      companyName.clear();
      categories.clear();
      companyEmail.clear();
      companyWebsiteLink.clear();
      experience.clear();
      workingTime.clear();
      phoneNumber.clear();
    }else {
      throw Exception('Failed to load data');
    }
  }
  Future fetchInformation() async {
    try {
      var userId = '7';
      final response = await http.get(
          Uri.parse('http://skillo.uk/api/recruiter/getprofileInfo?id=$userId'));
       print("---------------------------------------");
       print(response.body);
       print("---------------------------------------");
      if (response.statusCode == 200) {
        final data  = json.decode(response.body);
        // setState(() {
        //   _data = List<Map<String, dynamic>>.from(responseData);
        //   _dataLength = _data?.length ?? 0;
        // });
        companyBio.text = data["JobDescription"];
        companyName.text=data["JobDescription"];
        categories.text=data["Tags"];
        companyEmail.text=data["JobDescription"];
        companyWebsiteLink.text=data["JobDescription"];
        experience.text=data["JobDescription"];
        workingTime.text=data["JobDescription"];
        phoneNumber.text=data["JobDescription"];
      } else {
        throw Exception('Failed to load data');
      }
    }catch(error){
      print('Error fetching data:$error');
    }
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
                              "Update Company Information",
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
                                      BorderSide(color: Color(0x00000061)),
                                  ),
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
}
