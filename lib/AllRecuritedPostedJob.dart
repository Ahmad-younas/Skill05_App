import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

class AllRecuritedPostedJob extends StatefulWidget {
  const AllRecuritedPostedJob({super.key});

  @override
  State<AllRecuritedPostedJob> createState() => _AllRecuritedPostedJobState();
}

class _AllRecuritedPostedJobState extends State<AllRecuritedPostedJob> {
  TextEditingController searchController = TextEditingController();


  List<Map<String, dynamic>>? _data;
  int _dataLength = 0;
  @override
  void initState() {
    super.initState();
    fetchData(" ");
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove the token from shared preferences
    await prefs.remove('token').then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreen()))
    ).catchError((onError)=> throw Exception('Failed to load data'));

  }
  Future<void> fetchData( String query) async {
    try {
      var userId = '19';
      final response = await http.get(Uri.parse('http://skillo.uk/api/recruiter/getPostedJobByEmail?id=$userId'));
      // print("---------------------------------------");
      // print(response.body);
      // print("---------------------------------------");
      if (true) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _data = List<Map<String, dynamic>>.from(responseData);
          print(_data);
          _dataLength = _data?.length ?? 0;
          if (query.isNotEmpty) {
            _data = _data?.where((product) =>
                product['JobTitle']
                    .toLowerCase()
                    .contains(query.toLowerCase()))
                .toList();
          }
        });
        // final Map<String, dynamic> responseData = json.decode(response.body);
        // // Assuming 'jobs' is the key that contains the array of job data
        // final List<dynamic> jobsData = responseData['jobs'];
        // setState(() {
        //   _data = List<Map<String, dynamic>>.from(jobsData);
        //   _dataLength = _data!.length;
        //   if (query.isNotEmpty) {
        //     _data = _data?.where((job) =>
        //         job['JobTitle'].toLowerCase().contains(query.toLowerCase()))
        //         .toList();
        //   }
        // });
      } else {
        throw Exception('Failed to load data');
      }
    }catch(error){
      print('Error fetching data:$error');
    }
  }
  Widget build(BuildContext context) {
    return  Scaffold(
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
                        const Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),

                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("All Posted Job", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
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
                                                // Navigator.pushReplacement(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) => JobDetail(data:_data?[index]['id'],),
                                                //   ),
                                                // );
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 40,
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
