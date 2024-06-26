import 'package:easybuy_user_app/controller/aearch_controler.dart';
import 'package:easybuy_user_app/controller/home_page_controlller/coming_soon_slid_images.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/view/screens/homescreen/all_products.dart';
import 'package:easybuy_user_app/view/screens/search_page.dart/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  SearchGetxController searchController = SearchGetxController();
  final controller = Get.put(SlidingImagesController());
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * .06;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to EasyBuy'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SearchPage());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: Column(
              children: [
                SizedBox(height: size),
                const Row(
                  children: [
                    Boldtext18(text: 'Coming Soon'),
                    Spacer(),
                    Boldtext18(text: 'See All'),
                  ],
                ),
                SizedBox(height: size),
                //  ScrollImage(controller: controller),
                khieg10,
                const Boldtext18(text: 'All Products'),
                khiegh20,
                CustomProductBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
