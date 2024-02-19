import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_05/client_dashboard.dart';

class thankYouScreen extends StatefulWidget {
  const thankYouScreen({super.key});

  @override
  State<thankYouScreen> createState() => _thankYouScreenState();
}

class _thankYouScreenState extends State<thankYouScreen> {
late ConfettiController _confettiController;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     _confettiController = ConfettiController(duration: const Duration(seconds: 5));
    _confettiController.play();
    // Trigger confetti after a delay (e.g., 1 second)
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context ,  MaterialPageRoute(builder: (context) => const ClientDashboard()));
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("images/Thankyou.jpg"),fit: BoxFit.cover)
        ),
        child: Align(
          alignment: Alignment.center,
          child:  ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive, // radial value in radians (PI is half the circle)// apply drag to the confetti particles
            emissionFrequency: 0.2, // how often the particles should be emitted
            numberOfParticles: 10, // number of particles to be emitted
          ),
        ),
      ),
    );
  }
}
