import 'package:easybuy_user_app/controller/address_controller/address_controller.dart';
import 'package:easybuy_user_app/controller/cart_section/order_controlller.dart';
import 'package:easybuy_user_app/controller/nav_bar_controller.dart';
import 'package:easybuy_user_app/controller/wishlist/wishlist_controller.dart';
import 'package:easybuy_user_app/view/screens/cartpage/cart_page.dart';
import 'package:easybuy_user_app/view/screens/homescreen/home_screen.dart';
import 'package:easybuy_user_app/view/screens/navbar/widgets/bottom_nav_items.dart';
import 'package:easybuy_user_app/view/screens/orderpage/new_oredr_page.dart';
import 'package:easybuy_user_app/view/screens/profilepage/profile_page.dart';
import 'package:easybuy_user_app/view/screens/wishllistpage/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController = Get.put(
      LandingPageController(),
    );
    Get.lazyPut(()=> QuantityController());
    Get.lazyPut(() => WishlistController());
    Get.lazyPut(()=> AddressController());
    
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavBarItems(
          landingPageController: landingPageController,
        ),
        body: Obx(
          () => IndexedStack(
            index: landingPageController.tabIndex.value,
            children:  [
              OrdersScreen(),
              WishlistScreen(),
              HomeScreen(),
              CartPage(),
              ProfilePage(),
            ],
          ),
        ),
      ),
    );
  }
}
