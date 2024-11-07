import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.account_circle, size: 50),
                  SizedBox(height: 10),
                  Text('Profile'),
                ],
              ),
            ),
            const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.settings, size: 50),
                  SizedBox(height: 10),
                  Text('Settings'),
                ],
              ),
            ),
            const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.notifications, size: 50),
                  SizedBox(height: 10),
                  Text('Notifications'),
                ],
              ),
            ),
            const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.logout, size: 50),
                  SizedBox(height: 10),
                  Text('Logout'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
