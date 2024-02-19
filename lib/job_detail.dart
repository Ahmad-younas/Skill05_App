import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skill_05/client_dashboard.dart';
import 'package:skill_05/thank_you_screen.dart';
class JobDetail extends StatefulWidget {
  final dynamic data;

  const JobDetail({Key? key, required this.data}) : super(key: key);

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  Map<String, dynamic>? serverResponse;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  Future fetchData() async {

      final response = await http.get(Uri.parse('http://10.0.2.2:3001/api/recruiter/getJobDetail/${widget.data.toString()}'),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      );
      print(response.body);
      if (response.statusCode == 200) {
        setState(() {
          serverResponse = json.decode(response.body);
        });
      }else {
        throw Exception('Failed to load data');
      }
      // Navigate to Candidate Dashboard

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
              color: Colors.deepOrange,
              height: 500,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const ClientDashboard()));
                        }, icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.white,size: 25,)),
                      ],
                    ),
                     CircleAvatar(
                      radius: 50,
                     backgroundImage: NetworkImage('http://146.190.36.31:3001/images/${serverResponse?['companyLogo']}'),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )),
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, bottom: 10),
                  height: 450,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 30,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Job information", style: TextStyle(fontSize: 20,color: Color(0xFF650904), fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Job Title: ${serverResponse?['JobTitle']}', style: TextStyle(fontSize: 18,color: Color(0xFF650904),),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Country:  ${serverResponse?['Country']}', style: TextStyle(fontSize: 18,color: Color(0xFF650904)),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('City:  ${serverResponse?['City']}', style: TextStyle(fontSize: 18,color: Color(0xFF650904)),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("WorkType:  ${serverResponse?['WorkType']}", style: TextStyle(fontSize: 18,color: Color(0xFF650904)),),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Description:", style: TextStyle(fontSize: 20,color: Color(0xFF650904), fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('${serverResponse?['JobDescription']}', style: TextStyle(fontSize: 18,color: Color(0xFF650904),),),
                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Salary/ Month: ', style: TextStyle(fontSize: 20,color: Color(0xFF650904), fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('${serverResponse?['Salary']} USD', style: TextStyle(fontSize: 28,color: Color(0xFF650904),),),
                      )
                    ],
                  ),
                ),
                
              ),

              Container(
                width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const thankYouScreen()));
                  },style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Color(0xFF650904)) ), child: const Text("Apply"),))
            ],
          ),
        ),
      ]),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
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
