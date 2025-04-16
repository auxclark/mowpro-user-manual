import 'package:flutter/material.dart';
import 'dart:developer';
import 'firstscreen.dart'; 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, 
          children: [
           
            Padding(
              padding: const EdgeInsets.only(
                  top: 300.0), 
              child: Image.asset(
                'assets/images/logo.png',
                height: 150, 
              ),
            ),
            const SizedBox(height: 150), 

            
            SizedBox(
              width: 300, 
              height: 60, 
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A85B), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  shadowColor: Colors.black
                      .withOpacity(0.25), 
                  elevation: 5, 
                ),
                onPressed: () {
                  log('Get Started Pressed');
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroScreen(),
                    ),
                  );
                },
                child: const Text(
                  'GET STARTED',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
