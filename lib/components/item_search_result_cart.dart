import 'package:app_go/pages/order_med.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CartSearchOptions extends StatelessWidget {
  const CartSearchOptions({super.key});

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
                      child: const Image(
                        image: AssetImage('assets/Apollo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apollo Pharmacy',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Estimated Delivery :',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 121, 121, 121),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Total Items :',
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
                  const Expanded(
                    child: Text(
                      'Rs 150',
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