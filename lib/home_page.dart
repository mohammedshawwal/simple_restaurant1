import 'package:eng_heba_project/burger.dart';
import 'package:eng_heba_project/cafi.dart';
import 'package:eng_heba_project/chicken.dart';
import 'package:eng_heba_project/desserts.dart';
import 'package:eng_heba_project/pizza.dart';
import 'package:flutter/material.dart';
import 'profile_screen/view/profile_screen.dart';
import 'profile_screen/view/setting_screen.dart';

class Homepage extends StatelessWidget {
   Homepage({Key? key}) : super(key: key);
  final bool _isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                  leading: Image.asset("assets/images/burger/Big-tasty-Chicken.png"),
                  title: const Text('Burger'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => burger()
                        ),);
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
                  leading: Image.asset("assets/images/pizza/BBQ-CHICKEN-RANCH-.png"),
                  title: const Text('Pizza'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pizza()),
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
                  leading: Image.asset("assets/images/chicken/My Bucket.png"),

                  title: const Text('Chicken'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => chicken()),
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
                  leading: Image.asset("assets/images/cafe/Hot-Choc.png"),
                  title: const Text('Cofee'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => cafe()),
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
                  leading: Image.asset("assets/images/desserts/Chocolate-Fudge.png"),
                  title: const Text('Dessert'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  desserts()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home,
                    color: _isTap ? Colors.white : Colors.indigo),
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => CardPage()),
                  // );
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
