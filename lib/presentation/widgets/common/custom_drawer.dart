import 'package:extreme_work_outs/main.dart';
import 'package:extreme_work_outs/presentation/screens/webpageScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          /* DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, 
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/assets/images/default/user.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'johndoe@example.com',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ), */

          Padding(
            padding: const EdgeInsets.only(
                top: 26.0), 
            child: ListTile(
              title: Text('Settings'.tr()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebPage(
                      url: 'https://extremeworkouts.net/my-challenges/',
                    ),
                  ),
                );
              },
            ),
          ),
          ListTile(
            // leading: Icon(Icons.logout),
            title: Text('Profile'.tr()),
            onTap: () {
              // Abrir la URL directamente en el WebView
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebPage(
                      url: 'https://extremeworkouts.net/athletes/daniela/'),
                ),
              );
            },
          ),
          ListTile(
            // leading: Icon(Icons.logout),
            title: Text('Tutorials'.tr()),
            onTap: () {
              // Abrir la URL directamente en el WebView
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebPage(
                      url: 'https://extremeworkouts.net/athletes/daniela/'),
                ),
              );
            },
          ),
          ListTile(
            // leading: Icon(Icons.logout),
            title: Text('Orders'.tr()),
            onTap: () {
              // Abrir la URL directamente en el WebView
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      WebPage(url: 'https://extremeworkouts.net/'),
                ),
              );
            },
          ),
          ListTile(
            // leading: Icon(Icons.logout),
            title: Text('Settings'.tr()),
            onTap: () {
              // Abrir la URL directamente en el WebView
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebPage(
                      url:
                          'https://extremeworkouts.net/athletes/daniela/settings/'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
