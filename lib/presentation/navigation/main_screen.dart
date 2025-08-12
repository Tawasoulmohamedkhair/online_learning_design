import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Account/account_screen.dart';
import 'package:online_learning_design/presentation/Course/course_screen.dart';
import 'package:online_learning_design/presentation/Message/message_screen.dart';
import 'package:online_learning_design/presentation/Home/home_screen.dart';
import 'package:online_learning_design/presentation/Search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = <Widget>[
    HomeScreen(),
    CourseScreen(),
    SearchScreen(),
    MessageScreen(),
    AccountScreen(),
  ];
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_currentindex]),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            _currentindex = 2; // Index for the Search screen
          });
        },

        // Set the desired background color for the button
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/Ellipse.svg', // Replace with your SVG path
              width: 56, // Adjust to fit your FAB size
              height: 56,
            ),
            _buildSvgPicture('assets/svg/search.svg', 2),
          ],
        ), // Use the custom SVG builder for the icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // Dark background for the bottom bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('assets/svg/home.svg', S.of(context).home, 0),
            _buildNavItem('assets/svg/course.svg', S.of(context).course, 1),
            _buildNavItem('assets/svg/message.svg', S.of(context).message, 3),
            _buildNavItem('assets/svg/user.svg', S.of(context).account, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildSvgPicture(String svgAssetPath, int index) {
    return SvgPicture.asset(
      svgAssetPath,
      colorFilter: ColorFilter.mode(
        _currentindex == index ? Colors.white : const Color(0xffC6C6C6),
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildNavItem(String svgAssetPath, String label, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _currentindex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSvgPicture(svgAssetPath, index),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color:
                      _currentindex == index
                          ? const Color(0xFF15B86C)
                          : const Color(0xffC6C6C6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
