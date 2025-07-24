import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center( // This centers the whole column on the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical centering
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/194/194938.png', // Avatar image URL
              ),
            ),
            SizedBox(height: 16),
            Text(
              'User: user@test.com',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
