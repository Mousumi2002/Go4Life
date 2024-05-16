import 'package:app_go/model/cart_item.dart';
import 'package:app_go/model/medicine_item.dart';
import 'package:app_go/pages/cart_page.dart';
import 'package:app_go/provider/auth_provider.dart';
import 'package:app_go/provider/cart_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedCard extends StatelessWidget {
  const MedCard({super.key, required this.medicineItem});
  final MedicineItem medicineItem;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItem =  cartProvider.getCartItemFromName(medicineItem.name);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              imageUrl:
                  medicineItem.picture,
              fit: BoxFit.fill,
              width: 71,
              height: 71,
            ),
          ),
        ),
         Expanded(
          child: ListTile(
            title: Text(
              medicineItem.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              ),
            subtitle: Row(
              children: [
                Text(
                  medicineItem.manufacturer,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  ),
                  if(cartItem == null)
                  const Spacer()
                  else
                  SizedBox(width: 12,),
                  cartItem == null ? 
                  SizedBox(
                    width: 91,
                    height: 32,
                    child: IconButton(onPressed: (){
                      cartProvider.addItem(medicineItem , context.read<AuthProvider>().uid);
                    }, icon: const Icon(
                      Icons.shopping_cart_rounded,
                      size: 20,
                      ),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 102, 159, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          
                        ),
                      ),
                      ),
                  ) : 
                  ItemQuantity(item: cartItem)
              ],
            ),
          ),
        ),
        
      ],
    );
  }
}
