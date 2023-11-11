import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_05/home.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.only(left: 20.0, top: 50.0),
              child: Container(
                child: IconButton(icon: const Icon(Icons.arrow_back_ios_sharp),
                  onPressed: () {
                  Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
            child: Container(
              child:  Center(
                child: Form(
                  key: _formfield,
                  child: Column(
                      children: [
                        const Text("Forgot your password", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF961208)),),
                        const SizedBox(height: 10),
                        const Text("Enter your email and we will send you a code to reset your password", textAlign: TextAlign.center,),
                        const SizedBox(height: 20,),
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
                        Container(
                          width: double.maxFinite,
                          child: ElevatedButton(onPressed: (){
                            if(_formfield.currentState !.validate())
                              emailController.clear();
                          },style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF961208)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              )
                          ), child:const Text('Get Code', style: TextStyle(color: Colors.white, fontSize: 18))),
                        )
                      ],
                    ),
                ),
              ),
              ),
          )
        ],
      ),
      ),
    );
  }
}
