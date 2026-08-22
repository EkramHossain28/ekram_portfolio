import 'package:flutter/material.dart';

import 'home_page.dart';
import 'profile_page.dart';
import 'messages_page.dart';
import 'notification_page.dart';
import 'settings_page.dart';
import 'logout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainLayout(),

      // 🟢 এখানে আপনার নতুন ইন্টারন্যাশনাল কর্পোরেট কালার থিম যুক্ত করা হলো
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(
          0xFF022C22,
        ), // ১. গভীর এমারেল্ড গ্রিন ক্যানভাস (Deep Emerald)
        cardColor: const Color(
          0xFF064E3B,
        ), // ২. সারফেস কার্ড কালার (Forest Green Slate)
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(
            0xFF064E3B,
          ), // ৩. অ্যাপবারের ব্যাকগ্রাউন্ড কালার
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(
            0xFF34D399,
          ), // ৪. প্রিমিয়াম নর্ডিক মিন্ট অ্যাকসেন্ট (Nordic Mint)
        ),
      ),
    );
  }
}

// মেনুর ডাটা মডেল
class MenuItemModel {
  final String title;
  final Widget page;

  MenuItemModel({required this.title, required this.page});
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<MenuItemModel> myDynamicMenu = [
    MenuItemModel(title: 'Home', page: HomePage()),
    MenuItemModel(title: 'Profile', page: ProfilePage()),
    MenuItemModel(title: 'Message', page: MessagePage()),
    MenuItemModel(title: 'Notification', page: NotificationPage()),
    MenuItemModel(title: 'Setting', page: SettingsPage()),
    MenuItemModel(title: 'LogOut', page: LogoutPage()),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myDynamicMenu[_selectedIndex].title),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  'Main Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myDynamicMenu.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.arrow_forward_ios, size: 16),
                    title: Text(myDynamicMenu[index].title),
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: myDynamicMenu[_selectedIndex].page,
    );
  }
}
