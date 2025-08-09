import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class DeliverablesCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String githubUrl;

  const DeliverablesCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.githubUrl,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: SizedBox(
        width: screenWidth < 400 ? screenWidth * 0.9 : 300,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.black
                )
              ),
              const SizedBox(height: 10),
              //Flexible(
                //fit: FlexFit.loose,
                //child: Text(
                Text(
                  description, 
                  style: const TextStyle(color: Colors.black)),
              //),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => launchURL(githubUrl),
                  child: const Text('GitHub'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Webとアプリの切り替えに備えたlaunchURL関数
void launchURL(String url) async {
  // For mobile/desktop (during dev)
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'このURLを開けません: $url';
  }
}