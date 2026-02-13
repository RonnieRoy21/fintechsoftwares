import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Main()));
}

class Main extends StatelessWidget {
  const Main({super.key});
  final String mealMindApkUrlOneDrive =
      'https://1drv.ms/u/c/183e619627e0e8bc/IQBqzJ60PhEHTIp3qUov0v4UAVKx82fy9KOHtuXhuWFE9hs?e=rvaWn2';
  final String mealMindApkUrlDropBox = 'https://ufile.io/nk2laqaf';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MealMind App'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height:
                    screenSize.height * 0.6, // set a max height for carousel
                child: CarouselView(
                  itemExtent: screenSize.width * 0.5,
                  children: [
                    Image.asset('assets/login.jpeg', fit: BoxFit.cover),
                    Image.asset('assets/create.jpeg', fit: BoxFit.cover),
                    Image.asset('assets/home.jpeg', fit: BoxFit.cover),
                    Image.asset(
                      'assets/a well organized macro table.jpeg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset('assets/checkout.jpeg', fit: BoxFit.cover),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(mealMindApkUrlOneDrive);
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
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(mealMindApkUrlDropBox);
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
                child: const Text('Alternative Download Link'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Enable "Install from unknown sources" if prompted to install the app.',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
