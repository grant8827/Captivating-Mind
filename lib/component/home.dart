import 'package:captivating_mind/component/radio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 136, 9, 0),
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
        actions: [
          IconButton(
            onPressed: () async {
              await Share.share(
                  'https://apps.apple.com/us/app/captivating-mind/id6504638762');
            },
            icon: const Icon(Icons.share),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/image/bgimage.jpg'),
              fit: BoxFit.fill),
        ),
        child: const radioPlayer(),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 221, 221, 221),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 136, 9, 0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        'lib/assets/image/captivating_ming.png',
                      ),
                      width: 100,
                      height: 80,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Captivating Mind Radio',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.phone,
                  size: 35, color: Color.fromARGB(255, 23, 21, 12)),
              title: const Text('407-234-9036',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              onTap: () async {
                Uri phone = Uri.parse('tel:407-234-9036');
                if (await launchUrl(phone)) {
                  //dialer open
                } else {
                  //do nothing
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone,
                  size: 35, color: Color.fromARGB(255, 23, 21, 12)),
              title: const Text('321-350-2773',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              onTap: () async {
                Uri phone = Uri.parse('tel:321-350-2773');
                if (await launchUrl(phone)) {
                  //dialer open
                } else {
                  //do nothing
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.email,
                size: 35,
                color: Color.fromARGB(255, 23, 21, 12),
              ),
              title: const Text(
                'captivating1mind@gmail.com',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () async {
                Uri email = Uri.parse('mailto:captivating1mind@gmail.com');
                if (await launchUrl(email)) {
                  //open email
                } else {
                  //do nothing
                }
                Navigator.pop(context);
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(
                  Icons.facebook,
                  color: Color.fromARGB(255, 0, 140, 255),
                  size: 35,
                ),
                title: const Text('Facebook'),
                onTap: () async {
                  Uri email = Uri.parse('https://search.app/sc94q9M66iArER156');
                  if (await launchUrl(email)) {
                    //open email
                  } else {
                    //do nothing
                  }
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.pink,
                  size: 35,
                ),
                title: const Text('instagram'),
                onTap: () async {
                  Uri email = Uri.parse(
                      'https://www.instagram.com/captivating1mind/?hl=en');
                  if (await launchUrl(email)) {
                    //open email
                  } else {
                    //do nothing
                  }
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(
                  FontAwesomeIcons.tiktok,
                  color: Colors.black,
                  size: 35,
                ),
                title: const Text('TikTak'),
                onTap: () async {
                  Uri email = Uri.parse('#');
                  if (await launchUrl(email)) {
                    //open email
                  } else {
                    //do nothing
                  }
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(
                  FontAwesomeIcons.twitter,
                  color: Color.fromARGB(255, 66, 162, 240),
                  size: 35,
                ),
                title: const Text('Twitter'),
                onTap: () async {
                  Uri email = Uri.parse('#');
                  if (await launchUrl(email)) {
                    //open email
                  } else {
                    //do nothing
                  }
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(
                  FontAwesomeIcons.youtube,
                  color: Colors.red,
                  size: 35,
                ),
                title: const Text('YouTube'),
                onTap: () async {
                  Uri email = Uri.parse(
                      'https://youtube.com/@captivatingmind3914?si=TL3io2z3KY-9Js0T');
                  if (await launchUrl(email)) {
                    //open email
                  } else {
                    //do nothing
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
