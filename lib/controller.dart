import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JoystickController extends StatefulWidget {
  const JoystickController({super.key});

  @override
  _JoystickControllerState createState() => _JoystickControllerState();
}

class _JoystickControllerState extends State<JoystickController> {
  bool isConnected = false;
  bool isAutomaticMode = false;
  final String esp32Ip = "192.168.4.1"; // Change to your ESP32 IP Address

  Future<void> sendCommand(String command) async {
    try {
      final response = await http.get(Uri.parse('http://$esp32Ip/$command'));
      if (response.statusCode == 200) {
        print("Command sent: $command");
      } else {
        print("Failed to send command");
      }
    } catch (e) {
      print("Error sending command: $e");
    }
  }

  Future<void> connectToWiFi() async {
    setState(() {
      isConnected = true;
    });
    print("Connected to ESP32 WiFi module");
  }

  Future<void> disconnectWiFi() async {
    setState(() {
      isConnected = false;
    });
    print("Disconnected from ESP32 WiFi module");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          SizedBox(
            width: 264,
            height: 69.37,
            child: ElevatedButton.icon(
              onPressed: connectToWiFi,
              icon: const Icon(Icons.wifi, color: Colors.white),
              label: const Text(
                "Connect to WiFi",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00A85B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 264,
            height: 69.37,
            child: ElevatedButton.icon(
              onPressed: disconnectWiFi,
              icon: const Icon(Icons.wifi_off, color: Colors.white),
              label: const Text(
                "Disconnect",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00A85B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            isConnected ? "Connected to ESP32" : "Not Connected",
            style: TextStyle(
              fontSize: 18,
              color: isConnected ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          // Joystick Controller
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: IconButton(
                      onPressed: () => sendCommand("forward"),
                      icon: const Icon(Icons.arrow_drop_up, size: 50),
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: IconButton(
                      onPressed: () => sendCommand("backward"),
                      icon: const Icon(Icons.arrow_drop_down, size: 50),
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      onPressed: () => sendCommand("left"),
                      icon: const Icon(Icons.arrow_left, size: 50),
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () => sendCommand("right"),
                      icon: const Icon(Icons.arrow_right, size: 50),
                      color: Colors.green,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => sendCommand("stop"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(24),
                    ),
                    child: const Text(
                      "S",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
