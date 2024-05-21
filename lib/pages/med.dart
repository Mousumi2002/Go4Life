import 'package:app_go/components/appbar.dart';
import 'package:app_go/components/med_item_card.dart';
import 'package:app_go/provider/medicine_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchMed extends StatelessWidget {
  const SearchMed({super.key});

  @override
  Widget build(BuildContext context) {
    final medProvider = Provider.of<MedicineProvider>(context);
    //This stores the cart items from firebase
    final medItems = medProvider.medicines;
    final searchItems = medProvider.medicinesSearch;
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
                'Medicine',
                style: TextStyle(color: Color.fromARGB(255, 10, 55, 214), fontSize: 22),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(14),
            child: TextField(
              style: const TextStyle(color: Color.fromARGB(255, 124, 124, 124)),
              onChanged: (value) {
                medProvider.searchMedicine(value);
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 240, 240, 240),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: "Search Medicine",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  suffixIconColor: const Color.fromARGB(255, 124, 124, 124)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: searchItems.isNotEmpty ? searchItems.length : medItems.length,
              itemBuilder: (context, index) {
                final item = searchItems.isNotEmpty ? searchItems[index] : medItems[index];
                return MedCard(medicineItem: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}
