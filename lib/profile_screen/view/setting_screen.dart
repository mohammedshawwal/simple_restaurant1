import 'package:flutter/material.dart';

import '../../home_page.dart';
import 'profile_screen.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({super.key});
   bool _isTap = false;


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        // brightness: Brightness.light,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "common",
                style: TextStyle(color: Colors.grey.shade700),
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
                      Icons.language,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Language'),
                    trailing: Text(
                      "English",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.cloud,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Environment'),
                    trailing: Text(
                      "Production",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.devices,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Platform'),
                    trailing: Text(
                      "Default",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.format_paint,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Enable custom theme'),
                      value: false,
                      onChanged: (bool value) {}),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Contact us",
                style: TextStyle(color: Colors.grey.shade700),
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
                      Icons.phone,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Phone number'),
                    subtitle: Text(
                      "01025452408",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Email'),
                    subtitle: Text(
                      "mohammedshawwal12345@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Security",
                style: TextStyle(color: Colors.grey.shade700),
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
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.screen_lock_portrait_sharp,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text(
                        'Lock app in packground',
                        style: TextStyle(fontSize: 14),
                      ),
                      value: true,
                      onChanged: (bool value) {}),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.fingerprint,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Use fingerprint'),
                      value: true,
                      onChanged: (bool value) {}),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Allow application to stored fingerprint IDs",
                style: TextStyle(color: Colors.grey.shade700),
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
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.password,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Change password'),
                      value: false,
                      onChanged: (bool value) {}),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.notifications_active,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Enable notifications'),
                      value: true,
                      onChanged: (bool value) {}),
                ],
              ),
            ),
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
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings,
                  color: _isTap ? Colors.white : Colors.indigo),
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
