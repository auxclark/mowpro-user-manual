import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lawn Mower App',
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Image.asset(
            'assets/images/mowpro.png',
            height: 244,
            width: 350,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'ACCURACY',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AccuracyBar(label: 'Coverage Area Accuracy', percentage: 80),
                AccuracyBar(
                    label: 'Cutting Precision and Uniformity', percentage: 59),
                AccuracyBar(
                    label: 'Obstacle Detection Accuracy', percentage: 89),
                AccuracyBar(label: 'Path Following Accuracy', percentage: 50),
              ],
            ),
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications, size: 80, color: Colors.orange),
          const SizedBox(height: 20),
          const Text(
            'Here are your notifications.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(333, 62),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          backgroundColor: const Color(0xFF00A85B),
          centerTitle: true,
          title: const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
                icon: const Icon(Icons.lightbulb_outline), onPressed: () {}),
            IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
            IconButton(icon: const Icon(Icons.info_outline), onPressed: () {}),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 232, 245, 239),
              Color.fromARGB(255, 239, 251, 250),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          width: 333,
          height: 62,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/home.png',
                        width: 24, height: 24),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/notification.png',
                        width: 24, height: 24),
                    label: 'Notification',
                  ),
                ],
                selectedItemColor: const Color(0xFFFCFCF7),
                unselectedItemColor: const Color(0xFFFCFCF7),
                selectedLabelStyle: const TextStyle(
                  color: Color(0xFFFCFCF7),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Color(0xFFFCFCF7),
                  fontFamily: 'Montserrat',
                ),
                backgroundColor: const Color(0xFF00A85B),
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AccuracyBar extends StatelessWidget {
  final String label;
  final int percentage;

  const AccuracyBar({super.key, required this.label, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Stack(
            children: [
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width * (percentage / 100),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '$percentage%',
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
