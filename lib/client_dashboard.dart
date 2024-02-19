import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_05/home.dart';
import 'package:skill_05/job_details.dart';

import 'job_detail.dart';
class ClientDashboard extends StatefulWidget {
  const ClientDashboard({super.key});

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  TextEditingController searchController = TextEditingController();
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove the token from shared preferences
    await prefs.remove('token').then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreen()))
    ).catchError((onError)=> throw Exception('Failed to load data'));

  }
  List<Map<String, dynamic>>? _data;
  int _dataLength = 0;
  @override
  void initState() {
    super.initState();
    fetchData(" ");
  }
  Future<void> fetchData( String query) async {
    try {
      final response = await http.get(
          Uri.parse('http://skillo.uk/api/recruiter/getpostedJob'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _data = List<Map<String, dynamic>>.from(responseData);
          _dataLength = _data?.length ?? 0;
          if (query.isNotEmpty) {
            _data = _data?.where((product) =>
                product['JobTitle']
                    .toLowerCase()
                    .contains(query.toLowerCase()))
                .toList();
          }
        });
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
      body: Stack(
          children:[
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                  color: Colors.deepOrange,
                  height: 500,
                  child:  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 60,),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(onTap: (){
                                  logout();
                              },child: const Icon(
                                Icons.logout_outlined,
                                size: 36,
                                color: Colors.white,
                              ),)
                            ],
                          ),
                        ),
                        const Text("Hello", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18,),),
                        const SizedBox(height: 10,),
                        const Text("Noman Sarwar", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30),
                          child: TextFormField(
                            controller: searchController,
                            onChanged: (value) {
                              fetchData(value);
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                fillColor: const Color(0x30676767),
                                filled: true,
                                hintText: "Petroleum",
                                suffixIcon: const Icon(Icons.search,  color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Search Result", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                              Text("${_dataLength} Results", style: const TextStyle(color: Colors.white,  fontWeight: FontWeight.bold, fontSize: 18),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
            const SizedBox(height: 500),
            Container(
              height: 500,
              margin: EdgeInsets.only(top: 200, bottom: 20),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Expanded(
                    child: _data == null ? const Center(
                        child: CircularProgressIndicator()
                    ):ListView.builder(
                        itemCount: _data?.length,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Container(
                                width: 350,
                                height: 250,
                                decoration: BoxDecoration(
                                  color: Color(0xFF961208),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                                  child: Container(
                                    width: double.maxFinite,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                          Text(_data?[index]['JobTitle'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                                          Text(_data?[index]['Country'], style: const TextStyle(fontSize: 18, color: Colors.white),),
                                          const SizedBox(height: 20),
                                          const Text("Salary / Month", style: TextStyle(color: Colors.white),),
                                          Text(_data?[index]['Salary'] + "K USD", style: const TextStyle(fontSize: 25, color: Colors.white),),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF720A02),
                                                  borderRadius: BorderRadius.circular(100)
                                                ),
                                                child: Center(
                                                    child: Text(_data?[index]['WorkType'], style: const TextStyle(color: Colors.white),)
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => JobDetail(data:_data?[index]['id'],),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFFD5621),
                                                      borderRadius: BorderRadius.circular(100),
                                                  ),
                                                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ),

                              ),
                          const SizedBox(height: 20)
                            ],
                          );
                          //   ListTile(
                          //   title: Text(_data?[index]['id'].toString()?? 'No Title'),
                          // );
                        }
                    ),
                  ),
                ],
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