import 'package:flutter/material.dart';
import 'package:slash/Presentation/widgets/app_bar.dart';
import 'package:slash/Presentation/widgets/best_selling.dart';
import 'package:slash/Presentation/widgets/category_list.dart';
import 'package:slash/Presentation/widgets/for_you.dart';
import 'package:slash/Presentation/widgets/new_arrival.dart';
import 'package:slash/Presentation/widgets/news.dart';
import 'package:slash/Presentation/widgets/search_bar.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slash Web'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarDetails(),
            SearchInput(),
            NewsWidget(),
            Category(),
            BestSelling(),
            NewArrival(),
            ForYou(),
          ],
        ),
      ),
    );
  }
}
