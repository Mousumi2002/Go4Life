import 'package:app_go/components/appbar.dart';
import 'package:app_go/model/vendor_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderMedicinePage extends StatelessWidget {
  //final CartItem item;
  final VendorItem vendor;
  const OrderMedicinePage({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    final medicines = vendor.medicines;
    final outOfStockMedicines = getOutOfStock(vendor.outOfStockMedicines);
    final requiresPrescriptions = getPrescriptionsRequirement(vendor.medicines);
    return Scaffold(
      appBar: const AppBarTitle(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                iconSize: 31.0,
              ),
              const Text(
                'Order Medicine',
                style: TextStyle(color: Color.fromARGB(255, 10, 55, 214), fontSize: 22),
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
                        child: CachedNetworkImage(
                          height: 71,
                          width: 71,
                          imageUrl: vendor.picture,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vendor.name,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Estimated Delivery : 1D',
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
                        '${medicines[0]['currency']} ${getPrice(medicines)}',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                if (outOfStockMedicines.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.warning_rounded,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "$outOfStockMedicines ${outOfStockMedicines.contains('and') ? 'are' : 'is'} currently out of stock",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (requiresPrescriptions) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 4,
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/prescription.png'),
                        const SizedBox(width: 8),
                        const Text(
                          "Some medicines requires prescription",
                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {},
                        // ignore: sort_child_properties_last
                        child: const Text('Upload Prescription'),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 102, 156, 255)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.only(right: 180),
                  child: Text(
                    "Available Items (${medicines.length})",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 10, 55, 214),
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Center(
                  child: Container(
                    height: 340,
                    width: 360,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 242, 255), borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          child: Text(
                            "List of Medicine ordered",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 55, 214),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                itemBuilder: (context, index) {
                                  final medicine = medicines[index];
                                  final item = medicines[index]['name'];
                                  return Row(
                                    children: [
                                      Text(
                                        item.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      if (medicine['prescription']) ...[
                                        const SizedBox(width: 8),
                                        Image.asset('assets/prescription.png'),
                                      ],
                                      const Spacer(),
                                      Text(
                                        'Units: ${medicine['quantity']}',
                                        style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                                      )
                                    ],
                                  );
                                },
                                shrinkWrap: true,
                                itemCount: medicines.length,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    showAlertDialog(context);
                                  },
                                  // ignore: sort_child_properties_last
                                  child: const Text('Book Now'),
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(const Color.fromARGB(255, 102, 156, 255)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  double getPrice(List medicines) {
    num price = 0;
    for (var medicine in medicines) {
      price += medicine['quantity'] * medicine['price'];
    }
    return price.toDouble();
  }

  String getOutOfStock(List outOfStockMedicines) {
    String outOfStock = '';
    for (var medicine in outOfStockMedicines) {
      outOfStock += medicine['name'] + ', ';
    }

    if (outOfStock.contains(',')) {
      outOfStock = outOfStock.substring(0, outOfStock.length - 2);
    }
    //Replace last , with and if there are more than 1 out of stock medicines
    if (outOfStock.contains(',')) {
      final lastComma = outOfStock.lastIndexOf(',');
      outOfStock = outOfStock.replaceRange(lastComma, lastComma + 1, ' and');
    }

    if (outOfStock.isEmpty) return '';
    return outOfStock;
  }

  showAlertDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation Notice"),
          content: const Text("Your Booking is successful"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  bool getPrescriptionsRequirement(List medicines) {
    for (var medicine in medicines) {
      if (medicine['prescription']) {
        return true;
      }
    }
    return false;
  }
}
