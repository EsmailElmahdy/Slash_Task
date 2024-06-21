import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        top: screenWidth * 0.038, // Adjust top padding based on screen width
        left: screenWidth * 0.01, // Adjust left padding based on screen width
        right: screenWidth * 0.01, // Adjust right padding based on screen width
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontFamily: 'Urbanist_reg',
                  color: Color(0xff292929),
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    Text(
                      'See all',
                      style: TextStyle(
                        fontFamily: 'Urbanist_reg',
                        color: Color(0xff292929),
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0075,
                        right: MediaQuery.of(context).size.width * 0.02,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.0075),
                        ),
                        child: Image.asset(
                          'assets/images/arrow-left.png',
                          width: MediaQuery.of(context).size.width * 0.06,
                          height: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.02), // Adjust top padding based on screen width
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryItem(
                    "assets/images/Category1.png",
                    "Fashion",
                    screenWidth,
                  ),
                  _buildCategoryItem(
                    "assets/images/Category2 (1).png",
                    "Games",
                    screenWidth,
                  ),
                  _buildCategoryItem(
                    "assets/images/Category3.png",
                    "Accessories",
                    screenWidth,
                  ),
                  _buildCategoryItem(
                    "assets/images/Category4.png",
                    "Books",
                    screenWidth,
                  ),
                  _buildCategoryItem(
                    "assets/images/Category5.png",
                    "Artifacts",
                    screenWidth,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String imagePath, String title, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.03), // Adjust right padding for spacing between items
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: screenWidth * 0.4, // Adjust width based on screen width
            height: screenWidth * 0.4, // Adjust height based on screen width
          ),
          Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.01), // Adjust top padding based on screen width
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Urbanist_reg',
                fontWeight: FontWeight.normal,
                fontSize: screenWidth * 0.043, // Adjust font size based on screen width
              ),
            ),
          ),
        ],
      ),
    );
  }
}
