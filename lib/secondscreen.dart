import 'package:flutter/material.dart';
import 'thirdscreen.dart'; 
import 'home_screen.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  _IntroScreen2State createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  int _currentPage = 1; 

  void _onNextPressed() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
    } else {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThirdScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), 
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Image.asset(
              'assets/images/2.png', 
              width: 344, 
              height: 344, 
              alignment: Alignment.center, 
            ),
            const SizedBox(height: 20),

            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Efficient, quiet, and autonomous.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36, 
                  color: Color(0xFF097142), 
                  fontWeight: FontWeight.bold, 
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "The future of lawn maintenance is here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18, 
                fontStyle: FontStyle.italic, 
                fontWeight: FontWeight.w500, 
                color: Color(0xFF097142), 
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 20),

           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == 0
                        ? const Color(0xFF097142)
                        : const Color(0xFFB5E0C5),
                  ),
                ),
                Container(
                  width: 20,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _currentPage == 1
                        ? const Color(0xFF097142)
                        : const Color(0xFFB5E0C5),
                  ),
                ),
                Container(
                  width: 20,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _currentPage == 2
                        ? const Color(0xFF097142)
                        : const Color(0xFFB5E0C5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

        
            SizedBox(
              width: 302, 
              height: 50,
              child: ElevatedButton(
                onPressed: _onNextPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A85B), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                ),
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            
            SizedBox(
              width: 302, 
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A85B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "SKIP",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
