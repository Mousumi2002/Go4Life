import 'package:app_go/components/appbar.dart';
import 'package:flutter/material.dart';

class OrderMedicinePage extends StatelessWidget {
  const OrderMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            IconButton(
              onPressed: () {
              Navigator.pop(context);
            },
              icon: const Icon(Icons.arrow_back),
              iconSize: 31.0,
            ),
             const Text(
              'Order Medicine',
              style: TextStyle(
                  color: Color.fromARGB(255, 10, 55, 214),
                  fontSize: 22),
            ),
          ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87
                        ),
                        ),
                      SizedBox(height: 8),
                      Text(
                        'Estimated Delivery :',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 121, 121, 121),
                        ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 50,),
                const Expanded(
                  child: Text(
                    'Rs 150',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                    ),
                    maxLines: 2,
                  ),
                ),
                ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        color: Colors.red,
                        ),
                        SizedBox(width: 8),
                      Text(
                        "Diovol is currently out of stock",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 4),
                  child: Row(
                    children: [
                      Image.asset('assets/prescription.png'),
                      const SizedBox(width: 8),
                      const Text(
                        "Some medicines requires prescription",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                        ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text(
                    "Upload Prescription"
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