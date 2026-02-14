import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Main()));
}

class Main extends StatelessWidget {
  const Main({super.key});

  // Update this URL to point to the APK hosted on Vercel
  final String mealMindApkUrl =
      'https://fintechsoftwares.vercel.app/mealmind.apk';

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
        color: Colors.grey[400],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * 0.6,
                child: CarouselView(
                  itemExtent: screenSize.width * 0.5,
                  children: const [
                    Image(
                      image: AssetImage('assets/login.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage('assets/create.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage('assets/home.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage(
                        'assets/a well organized macro table.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage('assets/checkout.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(mealMindApkUrl);
                  try {
                    if (!await launchUrl(url)) {
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
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'After downloading, open your downloads folder and tap the APK file to install the app on your Android device.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Enable "Install from unknown sources" if prompted to install the app.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
