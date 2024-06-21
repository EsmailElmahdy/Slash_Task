import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slash/Presentation/widgets/app_bar.dart';
import 'package:slash/Presentation/widgets/best_selling.dart';
import 'package:slash/Presentation/widgets/category_list.dart';
import 'package:slash/Presentation/widgets/for_you.dart';
import 'package:slash/Presentation/widgets/new_arrival.dart';
import 'package:slash/Presentation/widgets/news.dart';
import 'package:slash/Presentation/widgets/search_bar.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Column(
      children: [
        const AppBarDetails(),
        const SearchInput(),
        NewsWidget(),
        const Category(),
        const BestSelling(),
        const NewArrival(),
        const ForYou(),
      ],
    ),
    const Center(child: Text('Favorites')),
    const Center(child: Text('Profile')),
    const Center(child: Text('Cart')),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the height of the bottom navigation bar based on the screen width
    double navBarHeight = screenHeight * 0.10; // 10% of screen width

    // Make sure the height doesn't exceed a certain maximum value
    if (navBarHeight > 70.0) {
      navBarHeight = 70.0; // Set a maximum height for the bottom navigation bar
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02), // 2% of screen width padding
          child: _screens[_currentIndex],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: navBarHeight,
        width: screenWidth,
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            fontFamily: 'Urbanist_reg',
            fontSize: navBarHeight * 0.1, // 3.5% of screen width font size
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Urbanist_reg',
            fontSize: navBarHeight * 0.1, // 3.5% of screen width font size
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          selectedIconTheme: CupertinoIconThemeData(
            color: Color(0xff292828),
          ),
          unselectedIconTheme: CupertinoIconThemeData(
            color: Colors.grey,
          ),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: navBarHeight * 0.4, // 7.5% of screen width
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: navBarHeight * 0.4, // 7.5% of screen width
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: navBarHeight * 0.4, // 7.5% of screen width
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: navBarHeight * 0.4, // 7.5% of screen width
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
