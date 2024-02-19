import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_05/client_bottomnavigation.dart';
import 'package:skill_05/home.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late String token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTokenAndNavigate();
    // Timer(const Duration(seconds: 5),(){
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
    // });
  }

  Future<void> fetchTokenAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    print(token);

    if(token !=null && token.isNotEmpty){
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => (JwtDecoder.isExpired(token) == false)?const clientBottomNavigation():const HomeScreen()),
        );
      });
    }else{
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      });
    }

    // Wait for 5 seconds and then navigate to the next scree
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Splash.jpg"), fit: BoxFit.cover)
          ),
        ),
      );
    }
  }
