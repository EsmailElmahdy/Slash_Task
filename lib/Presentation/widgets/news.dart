import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({super.key});

  final List<String> imgList = [
    'assets/images/news.png',
    'assets/images/news.png',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.01,
      ),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: screenHeight * 0.25, // Adjust height based on screen height
              enlargeCenterPage: true,
              aspectRatio: 2,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: imgList.map((item) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02), // Adjust border radius based on screen width
                  image: DecorationImage(
                    image: AssetImage(item), // Pass image path as string
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
