import 'package:eng_heba_project/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../card_page.dart';
import '../../home_page.dart';
import 'aboutus_screen.dart';
import 'privasypolicy.dart';
import 'setting_screen.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
   bool _isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading:  const Icon(Icons.arrow_back_ios),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    //set border radius to 50% of square height and width
                    image: const DecorationImage(
                      image: AssetImage("assets/profile.jpg"),
                      fit: BoxFit.cover, //change image fill type
                    ),
                  ),
                ),
                const Text(
                  "shawwal mo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.edit),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.card_giftcard,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Card'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.privacy_tip,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Privacy Policy'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PrivacyPolicy()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.info,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('About Us'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Settings'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Log Out'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Homepage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.card_giftcard),
              onPressed: () {
                // Navigate to search screen
              },
            ),
            IconButton(
              icon: Icon(Icons.person,
                  color: _isTap ? Colors.white : Colors.indigo),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
