import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Main extends StatelessWidget {
  const Main({super.key});
  final String mealMindApkUrl =
      'https://1drv.ms/u/c/183e619627e0e8bc/IQBqzJ60PhEHTIp3qUov0v4UAVKx82fy9KOHtuXhuWFE9hs?e=rvaWn2';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: Colors.purple,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'MealMind App',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Create account'),
                Image.asset('assets/create.jpeg', height: 150, width: 150),
                const Text('The Home Page'),
                Image.asset('assets/home.jpeg', height: 150, width: 150),
                const SizedBox(height: 10),
                const Text('Meal analysis and recommendation app'),
                Image.asset(
                  'assets/a well organized macro table.jpeg',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () async {
                    //downloading the app
                    final Uri url = Uri.parse(mealMindApkUrl);
                    try {
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Could not launch URL')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error launching URL: $e')),
                      );
                    }
                  },
                  child: const Text('Download the MealMind App'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enable "Install from unknown sources" if prompted to install the app.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
