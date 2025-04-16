import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connecting to GS-Mower"),
        backgroundColor: const Color(0xFF00A85B),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Color(0xFF00A85B)),
            const SizedBox(height: 20),
            const Text(
              "Scanning for GS-Mower...",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                FlutterBluePlus.stopScan();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
