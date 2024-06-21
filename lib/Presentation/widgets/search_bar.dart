import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  hintStyle: TextStyle(
                    fontSize: 21.0,
                    fontFamily: 'Urbanist_reg',
                    fontWeight: FontWeight.normal,
                  ),
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                    icon: Image.asset(
                      'assets/images/search.png',
                    ),
                    onPressed: () {
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                icon: Image.asset(
                  'assets/images/filter.png',
                ),
                onPressed: () {
                  // Handle filter icon press
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
