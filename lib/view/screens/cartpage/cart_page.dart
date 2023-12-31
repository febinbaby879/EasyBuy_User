import 'package:easybuy_user_app/controller/cart_section/cart_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/view/screens/profilepage/adrees_section/adrees_page.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({super.key});

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    cartController.getCartItems();
    var displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: GetBuilder<CartController>(
        init: cartController,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: displayHeight * .67,
                    child: controller.cartList.isEmpty
                        ? Center(
                            child: Lottie.asset(embtyLottie),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.cartList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: kgrey,
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        controller.cartList[index].imageLink!),
                                  ),
                                  title: Text(controller.cartList[index].name!),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Price: \$${controller.cartList[index].price}.00',
                                      ),
                                      Boldtext(
                                        text:
                                            'Total price: \$${controller.cartList[index].totalprice}.00',
                                      )
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                cartController.decreaseQuentity(
                                                    index: index,
                                                    context: context);
                                              },
                                              child: const Icon(Icons.remove,
                                                  size: 20)),
                                          Text(
                                            '${cartController.cartList[index].quantity}',
                                            style: const TextStyle(
                                                color: purpple, fontSize: 11),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              cartController.increaseQuantity(
                                                  index: index,
                                                  context: context);
                                            },
                                            child:
                                                const Icon(Icons.add, size: 20),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showAlertDialog(
                                              context, controller, index);
                                        },
                                        child: const Icon(
                                          Icons.delete_forever_outlined,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: kgrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 6, left: 12, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Boldtext18(text: 'Total payable amount'),
                            Boldtext18(
                                text: '\$${cartController.totalcartprice}.00')
                          ],
                        ),
                      ),
                      CustomButton(
                          txt: 'Checkout',
                          onPressed: () {
                            if (cartController.cartList.isEmpty) {
                              Get.snackbar(
                                  'Cart is empty', 'Add some items here',
                                  snackPosition: SnackPosition.BOTTOM);
                            } else {
                              Get.to(AdressScreen());
                            }
                          })
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void showAlertDialog(
    BuildContext context,
    CartController controller,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want delete item'),
          content: const Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.deleteCartItem(index: index);
                Navigator.pop(context);
              },
              child: const Text('Sure'),
            ),
          ],
        );
      },
    );
  }
}
