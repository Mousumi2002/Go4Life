// ignore_for_file: sort_child_properties_last

import 'package:app_go/components/appbar.dart';
import 'package:app_go/components/item_search_result_cart.dart';
import 'package:app_go/model/cart_item.dart';
import 'package:app_go/provider/auth_provider.dart';
import 'package:app_go/provider/vendor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _buttonChange() {
    final vendorProvider = Provider.of<VendorProvider>(context, listen: false);
    vendorProvider.setCartVendorSort(
      vendorProvider.cartVendorSort == CartVendorSort.cost ? CartVendorSort.time : CartVendorSort.cost,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    //This stores the cart items from firebase
    final cartItems = cartProvider.cartItems;
    final vendorProvider = Provider.of<VendorProvider>(context);
    //This stores the cart items from firebase
    final vendorItems = vendorProvider.getVendorsForCart(cartItems);
    final buttonState = vendorProvider.cartVendorSort == CartVendorSort.cost;
    return Scaffold(
      appBar: const AppBarTitle(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Cart',
              style: TextStyle(color: Color.fromARGB(255, 10, 55, 214), fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 215, 229, 255),
              ),
              child: cartItems.isEmpty
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_shopping_cart_outlined,
                          size: 50,
                          color: Color.fromARGB(255, 10, 55, 214),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'No items in cart',
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 55, 214),
                            fontSize: 22,
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = cartItems[index];

                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 140,
                            height: 120,
                            child: DecoratedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          final uid = context.read<AuthProvider>().uid;
                                          cartProvider.removeCartItem(item.name, uid);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                      maxLines: 2,
                                    ),
                                  ),
                                  ItemQuantity(item: item),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              "Available Sellers",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 10, 55, 214),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sorted By",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 10, 55, 214),
                  ),
                ),
                Wrap(
                  spacing: 40,
                  children: <Widget>[
                    MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 215, 229, 255),
                        ),
                      ),
                      onPressed: buttonState ? _buttonChange : null,
                      child: const Text(
                        "Cost",
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 55, 214),
                        ),
                      ),
                      color: const Color.fromARGB(255, 215, 229, 255),
                    ),
                    MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 215, 229, 255),
                          )),
                      onPressed: buttonState ? null : _buttonChange,
                      child: const Text(
                        "Time",
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 55, 214),
                        ),
                      ),
                      color: const Color.fromARGB(255, 215, 229, 255),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (vendorItems.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'No vendors available',
                  style: TextStyle(
                    color: Color.fromARGB(255, 10, 55, 214),
                    fontSize: 22,
                  ),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                height: 6,
              ),
              itemCount: vendorItems.length,
              itemBuilder: (context, index) {
                final item = vendorItems[index];
                return CartSearchOptions(vendor: item);
              },
            ),
        ],
      ),
    );
  }
}

class ItemQuantity extends StatelessWidget {
  const ItemQuantity({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              QuantityAdjustButton(itemName: item.name, isIncrement: false),
              Container(
                width: 60,
                height: 24,
                color: const Color.fromARGB(255, 102, 159, 255),
                child: Text(
                  '${item.quantity}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              QuantityAdjustButton(itemName: item.name),
            ],
          ),
        ),
      ),
    );
  }
}

class QuantityAdjustButton extends StatelessWidget {
  const QuantityAdjustButton({super.key, this.isIncrement = true, required this.itemName});

  final bool isIncrement;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isIncrement ? 0 : 4),
          topLeft: Radius.circular(isIncrement ? 0 : 4),
          bottomRight: Radius.circular(isIncrement ? 4 : 0),
          topRight: Radius.circular(isIncrement ? 4 : 0),
        ),
        color: const Color.fromARGB(255, 102, 159, 255),
      ),
      child: GestureDetector(
        onTap: () {
          final uid = context.read<AuthProvider>().uid;
          context.read<CartProvider>().updateCartItemQuantity(itemName, isIncrement, uid);
        },
        child: Icon(
          isIncrement ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
