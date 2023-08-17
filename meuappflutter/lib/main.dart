import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' show canLaunchUrl, launchUrl;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apresentação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PresentationCard(),
    );
  }
}

class PresentationCard extends StatelessWidget {
  const PresentationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Apresentação'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                    'https://www.instagram.com/p/Cp8-TFELo8YMoT_vyyx34DRkn-BoJcD_zb_x3w0/'), //image URL
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Marcos Basos',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Aprendiz Desenvolvedor de Flutter',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.link),
                    color: Colors.white,
                    onPressed: () {
                      // Open GitHub link
                      _launchURL(
                          'https://github.com/MarcosN7'); //  GitHub profile URL
                    },
                  ),
                  const SizedBox(width: 20.0),
                  IconButton(
                    icon: const Icon(Icons.link),
                    color: Colors.white,
                    onPressed: () {
                      // Open LinkedIn link
                      _launchURL(
                          'https://www.linkedin.com/in/marcosb67/'); //LinkedIn profile URL
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL(String url) async {
  final Uri launchUri = Uri.parse(url);

  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    throw 'Could not launch $url';
  }
}
