import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Data/repositories/repository_api.dart';
import 'package:slash/Presentation/cubit/home_cubit.dart';
import '../../Data/models/products_model.dart';
import '../../Domain/useCases/Services.dart';

class ForYou extends StatelessWidget {
  const ForYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepositoryApi repo = RepositoryApi();
    Services services = Services(repo);

    // Use BlocProvider to provide the HomeCubit
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
          left: MediaQuery.of(context).size.width * 0.015,
          right: MediaQuery.of(context).size.width * 0.015,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended For You',
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
            FutureBuilder<Map<String, List<ProductModel>>>(
              future: services.getAllData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError || snapshot.data == null) {
                  return Text('Error: Unable to retrieve data');
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var product in snapshot.data!['recommendedForYou']!)
                          _buildProductItem(context, product),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, ProductModel product) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                child: Image.asset(
                  product.imagePath ?? 'assets/images/default_image.png',
                  width: screenWidth * 0.3, // Use a percentage of the screen width
                  height: screenWidth * 0.3, // Use a percentage of the screen width
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: screenWidth * 0.01,
                right: screenWidth * 0.02,
                child: BlocBuilder<HomeCubit, Map<int, bool>>(
                  builder: (context, state) {
                    final bool isLiked = state.containsKey(product.id) ? state[product.id]! : false;
                    return InkWell(
                      onTap: () {
                        context.read<HomeCubit>().toggleHeartIcon(product.id ?? 0);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[250],
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        ),
                        child: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                          size: screenWidth * 0.05,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.025),
            child: Text(
              product.name ?? 'Unknown Product', // Use a default name if product.name is null
              style: TextStyle(
                fontFamily: 'Urbanist_reg',
                fontWeight: FontWeight.normal,
                fontSize: screenWidth * 0.04, // Adjust font size based on screen width
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.04),
                  child: Text(
                    'EGP ${product.price?.toString() ?? 'N/A'} ', // Display price in EGP
                    style: TextStyle(
                      fontFamily: 'Urbanist_reg',
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04, // Adjust font size based on screen width
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff292929),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: screenWidth * 0.05, // Adjust icon size based on screen width
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
