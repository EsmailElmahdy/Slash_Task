import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% of screen width padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Slash.',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: screenWidth * 0.06, // 6% of screen width font size
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/location_on.png',
                width: screenWidth * 0.06, // 6% of screen width image width
                height: screenWidth * 0.06, // 6% of screen width image height
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01), // 1% of screen width padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nasr City",
                      style: TextStyle(
                        fontSize: screenWidth * 0.024, // 2.4% of screen width font size
                        fontFamily: 'Urbanist',
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Cairo",
                      style: TextStyle(
                        fontSize: screenWidth * 0.021, // 2.1% of screen width font size
                        color: Colors.grey,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){},
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: screenWidth * 0.06, // 6% of screen width icon size
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              InkWell(
                onTap: (){},
                child: Image.asset(
                  'assets/images/noti.png',
                  width: screenWidth * 0.06, // 6% of screen width image width
                  height: screenWidth * 0.06, // 6% of screen width image height
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: screenWidth * 0.012, // 1.2% of screen width circle diameter
                  height: screenWidth * 0.012, // 1.2% of screen width circle diameter
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
