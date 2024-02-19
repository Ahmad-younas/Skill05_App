import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class AllCandidate extends StatefulWidget {
  const AllCandidate({super.key});

  @override
  State<AllCandidate> createState() => _AllCandidateState();
}

class _AllCandidateState extends State<AllCandidate> {
  List<Map<String, dynamic>>? _data;
  int _dataLength = 0;
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async {
      final response = await http.get(
          Uri.parse('http://skillo.uk/api/candidate/getallcandidate'));
      // print("response");
      // print(response);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _data = List<Map<String, dynamic>>.from(responseData);
          _dataLength = _data?.length ?? 0;
        });
        print(_data);
      } else {
        throw Exception('Failed to load data');
      }
  }

  Future sendShortListed(String? id) async {
    print(id);
    final response = await http.put(Uri.parse('http://skillo.uk/api/candidate/shortList'),body: {
      'uid':id
    },
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    );
    // print("response");
    // print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        _data = List<Map<String, dynamic>>.from(responseData);
        _dataLength = _data?.length ?? 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Job Post Successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Job Not Posted'),
          duration: Duration(seconds: 2),
        ),
      );
      throw Exception('Failed to load data');
    }
    // Navigate to Candidate Dashboard
  }


  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $url';
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: EdgeInsets.only(left: 20.0, top: 30.0),
                    child: Container(
                     child: const Text(
                       "All Candidate",
                       style: TextStyle(
                           fontSize: 24,
                           fontWeight: FontWeight.bold,
                           color: Color(0xFF961208)),
                     ),
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  margin: EdgeInsets.only(bottom: 20),
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
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF961208),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                                      child: Container(
                                        width: double.maxFinite,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(_data?[index]['Name'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                                            SizedBox(height: 10,),
                                            Text(_data?[index]['education'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                                            SizedBox(height: 10,),
                                            Text(_data?[index]['Email'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                                            SizedBox(height: 10,),
                                            Text(_data?[index]['phonenumber'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                ElevatedButton(onPressed: (){
                                                  sendShortListed('${_data?[index]['id']}');
                                                }, child: const Text("Short List"), style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color(0xFFFD5621)
                                                ),
                                                ),
                                                ElevatedButton.icon(onPressed: (){
                                                    _launchURL('http://146.190.36.31:3001/files/${_data?[index]['resume']}');
                                                }, icon: const Icon(Icons.download), label: Text('CV'), style: ElevatedButton.styleFrom(
                                                  backgroundColor:  const Color(0xFFFD5621),
                                                  foregroundColor: Colors.white
                                                ),)
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
