import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                child: Center(
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
              margin: EdgeInsets.only(top: 200),
              height: 500,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFaF4e),
                        Color(0xFFFFFFFF)

                      ],
                      begin: Alignment.topCenter,
                  end: Alignment.bottomCenter

                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white

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
    throw UnimplementedError();
  }
}