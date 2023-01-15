import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text('Palash Halder', style: TextStyle(color: Colors.white)),
          ),

          ListTile(
            onTap: (){},
            title: Text('Help Desk'),
            leading: Icon(Icons.hail),
            //subtitle: Text('Phone'),
            //trailing: Icon(Icons.mic),
          ),

          ListTile(
            onTap: (){},
            title: Text('Log Out'),
            leading: Icon(Icons.logout),
            //subtitle: Text('Phone'),
            //trailing: Icon(Icons.mic),
          ),

          /*
          Row(
            children: const [
              Icon(Icons.help),
              Text('Help Desk'),
            ],
          )
    */
        ],
      ),
    );
  }
}
