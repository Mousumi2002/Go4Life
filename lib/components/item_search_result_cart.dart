import 'package:app_go/model/vendor_item.dart';
import 'package:app_go/pages/order_med.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CartSearchOptions extends StatelessWidget {
  final VendorItem vendor;
  const CartSearchOptions({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            pushScreen(
              context,
              screen: const OrderMedicinePage(),
              withNavBar: true,
            );
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> const OrderMedicinePage()));
            //ConfirmBookDocPage();
          },
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        width: 71,
                        height: 71,
                        imageUrl: vendor.picture,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vendor.name,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Estimated Delivery : 1D',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 121, 121, 121),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Total Items : ${vendor.medicines.length}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 121, 121, 121),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Text(
                      vendor.medicines[0]['currency'] +
                      vendor.medicines[0]['price'].toString(),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}