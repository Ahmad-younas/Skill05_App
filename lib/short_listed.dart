import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShortListed extends StatefulWidget {
  const ShortListed({super.key});

  @override
  State<ShortListed> createState() => _ShortListedState();
}

class _ShortListedState extends State<ShortListed> {
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
                        "All Short listed Candidate",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF961208)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
