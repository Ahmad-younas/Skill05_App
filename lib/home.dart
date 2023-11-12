import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_05/forget_password.dart';
import 'package:skill_05/recuriter_dashboard.dart';
import 'package:skill_05/signin_page.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Option {
  Candidate,
  Recuriter
}

class _HomeScreenState extends State<HomeScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  Option _option = Option.Candidate;
  Future fetchData() async {
    final response = await http.post(Uri.parse('http://localhost:3001/api/candidate/candidateLogin'),body: {
      'email': emailController.text,
      'password':passController.text
    });
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response);
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children:[
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
                color: Colors.deepOrange,
                height: 500,
                child: const Center(
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      Text("Welcome to Login", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      Text("Please Fill out the below details to login your account", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18,),),
                      SizedBox(height: 30),
                    ],
                  ),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 200, bottom: 10),
              height: 500,
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
                gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFF5822),
                        Color(0xFFFFFFFF)
                      ],
                      begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formfield,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Email", style: TextStyle(color: Colors.white, fontSize: 18),),
                          const SizedBox(height: 10,),
                          TextFormField(keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: true,
                              hintText: "Noman@gmail.com",
                              hintStyle: TextStyle(color: Color(0xFF961208))
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
                          const Text("Password", style: TextStyle(color: Colors.white, fontSize: 18),),
                          const SizedBox(height: 10,),
                          TextFormField(keyboardType: TextInputType.emailAddress,
                            controller: passController,
                            obscureText: passToggle,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "........",

                              hintStyle: const TextStyle(color: Color(0xFF961208)),
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
                          TextButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                          },
                          child: const Text("Forget Password?", style: TextStyle(color: Colors.white),)
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
                          Container(
                            width: double.maxFinite,
                            child: ElevatedButton(onPressed: (){

                              if(_formfield.currentState !.validate())
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RecuriterDashboard()));
                                emailController.clear();
                                passController.clear();
                                fetchData();
                            },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF961208)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                  )
                                )
                                ,child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ),
          )
        ]
      ),
    );
  }
}
class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h-100, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}