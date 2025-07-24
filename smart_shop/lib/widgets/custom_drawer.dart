import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';
import '../screens/home_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/favourite_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text('Smart Shop')),
          ListTile(
            title: Text('Home'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            ),
          ),
          ListTile(
            title: Text('Cart'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            ),
          ),
          ListTile(
            title: Text('Favourites'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FavouriteScreen()),
            ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen()),
            ),
          ),
          SwitchListTile(
            title: Text('Dark Theme'),
            value: themeProvider.isDarkMode,
            onChanged: (_) => themeProvider.toggleTheme(),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () async {
              await Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                    (_) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}