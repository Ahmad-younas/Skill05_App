import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

enum Option {
  Candidate,
  Recuriter
}

class _SigninPageState extends State<SigninPage> {


  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  Option _option = Option.Candidate;
  Future fetchData() async {
    if (_option == Option.Candidate) {
      print("InsideIF");
      final response = await http.post(Uri.parse('http://skillo.uk/api/candidate/candidateSignUp'),body: {
        'email': emailController.text,
        'password':passController.text,
        'name':fullNameController.text,
        'username':userNameController.text
      },
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      );
      if (response.statusCode == 201) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }else if(response.statusCode == 409) {
        Fluttertoast.showToast(
            msg: "User With this email already exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
        throw Exception('Failed to load data');
      }
      // Navigate to Candidate Dashboard

    } else if (_option == Option.Recuriter) {
      print("Ousides IF");
      print(fullNameController.text);
      final response = await http.post(Uri.parse('http://skillo.uk/api/recruiter/recruiterSignUp'),body: {
        'email': emailController.text,
        'password':passController.text,
        'name':fullNameController.text,
        'username':userNameController.text
      }, headers: {'Content-Type': 'application/x-www-form-urlencoded'});
      print(response.body);
      if (response.statusCode == 201) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        Fluttertoast.showToast(
            msg: "Please Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else if(response.statusCode == 409) {
        Fluttertoast.showToast(
            msg: "User With this email already exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
        throw Exception('Failed to load data');
      }
      // Navigate to Recuriter Dashboard
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(padding: EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Container(
                    child: IconButton(icon: const Icon(Icons.arrow_back_ios_sharp),
                      onPressed: () {
                        Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Container(
                  child:  Center(
                    child: Form(
                      key: _formfield,
                      child: Column(
                        children: [
                          const Text("Create new account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF961208)),),
                          const SizedBox(height: 10),
                          const Text("Please fill out the below details to create your new account.", textAlign: TextAlign.center,),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              const Text("Full Name", textAlign: TextAlign.start, style: TextStyle(color: Colors.black87, fontSize: 18),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(keyboardType: TextInputType.emailAddress,
                            controller: fullNameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Noman",
                                hintStyle: TextStyle(color: Colors.black87)
                            ),
                            validator: (value){
                              if(value!.isEmpty) {
                                return  "Enter Name";
                              }
                            },
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Text("Email", textAlign: TextAlign.start, style: TextStyle(color: Colors.black87, fontSize: 18),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Noman@gmail.com",
                                hintStyle: TextStyle(color: Colors.black87)
                            ),
                            validator: (value){
                              if(value!.isEmpty) {
                                return  "Enter Email";
                              }
                              bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                              if(!emailValid){
                                return "Enter Valid Email";
                              }
                            },
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Text("User Name", textAlign: TextAlign.start, style: TextStyle(color: Colors.black87, fontSize: 18),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(keyboardType: TextInputType.emailAddress,
                            controller: userNameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Noman@123",
                                hintStyle: TextStyle(color: Colors.black87)
                            ),
                            validator: (value){
                              if(value!.isEmpty) {
                                return  "Enter User Name";
                              }
                            },
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Text("Password", textAlign: TextAlign.start, style: TextStyle(color: Colors.black87, fontSize: 18),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(keyboardType: TextInputType.emailAddress,
                            controller: passController,
                            obscureText: passToggle,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "........",
                                hintStyle: TextStyle(color: Colors.black87),
                                suffixIcon: InkWell(
                                  onTap: (){
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                                )
                            ),
                            validator: (value){
                              if(value!.isEmpty) {
                                return  "Enter Password";
                              }
                            },
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Text("Confirm Password", textAlign: TextAlign.start, style: TextStyle(color: Colors.black87, fontSize: 18),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(keyboardType: TextInputType.emailAddress,
                            controller: confirmPasswordController,
                            obscureText: passToggle,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0x00000061))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "........",
                                hintStyle: TextStyle(color: Colors.black87),
                                suffixIcon: InkWell(
                                  onTap: (){
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                                )
                            ),
                            validator: (value){
                              if(value!.isEmpty) {
                                return  "Enter Confirm Password";
                              }
                            },
                          ),
                          const SizedBox(height: 20,),
                          Container(
                            width: double.maxFinite,
                            child: ElevatedButton(onPressed: (){
                              if(_formfield.currentState !.validate())
                                fetchData();
                            },style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF961208)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                )
                            ), child:const Text('Signup', style: TextStyle(color: Colors.white, fontSize: 18))),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(contentPadding: EdgeInsets.all(0.0), tileColor: Colors.red.shade50, value: Option.Candidate, groupValue: _option,title: const Text("Register As Candidate") ,onChanged: (option){
                                  setState(() {
                                    _option= option!;
                                  });
                                },
                                  activeColor: Colors.red,
                                ),
                              ),
                              SizedBox(width: 5.0,),
                              Expanded(
                                child: RadioListTile(contentPadding: EdgeInsets.all(0.0), tileColor: Colors.red.shade50, value: Option.Recuriter, groupValue: _option, title: const Text("Register As Recuriter") ,onChanged: (option){
                                  setState(() {
                                    _option= option!;
                                  });
                                },

                                  activeColor: Colors.red,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account!"),
                              TextButton(onPressed: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                              },
                                  child: const Text("Login", style: TextStyle(color: Color(0xFF961208), fontSize: 18),)
                              ),
                            ],
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
    );
  }
}
