import 'package:finace_app/screen/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Finace App",
      home: MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    HomeView(),
    Center(child: Text("Page 2", style: TextStyle(fontSize: 24))),
    Center(child: Text("Page 3", style: TextStyle(fontSize: 24))),
    Center(child: Text("Page 4", style: TextStyle(fontSize: 24))),
  ];
  final List<IconData> _iconList = [
    Icons.settings,
    Icons.nightlight_round,
    Icons.brightness_4,
    Icons.settings
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         _currentIndex + 1 >= _pages.length ? _currentIndex = 0 : _currentIndex++;
          setState(() {});
        },
        child: Icon(Icons.add_circle_rounded),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        activeColor: Colors.orange,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }
}
