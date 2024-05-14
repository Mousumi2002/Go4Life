import 'package:app_go/components/appbar.dart';
import 'package:flutter/material.dart';

class SearchMed extends StatelessWidget {
  const SearchMed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle(),
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
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 55, 214),
                    fontSize: 22),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(14),
            child: TextField(
              style: const TextStyle(color: Color.fromARGB(255, 124, 124, 124)),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 240 , 240 , 240),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText: "Search Medicine",
                hintStyle: const TextStyle(fontWeight: FontWeight.normal,),
                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search),),
                suffixIconColor: const Color.fromARGB(255, 124, 124, 124)
              ),
            ),
          )
        ],
      ),
    );
  }
}
