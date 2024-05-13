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
              Text(
                'Medicine',
                style: TextStyle(
                    color: const Color.fromARGB(255, 10, 55, 214),
                    fontSize: 22),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(14),
            child: TextField(
              style: TextStyle(color: const Color.fromARGB(255, 124, 124, 124)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 240 , 240 , 240),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none
                ),
                hintText: "Search Medicine",
                hintStyle: TextStyle(fontWeight: FontWeight.normal,),
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search),),
                suffixIconColor: Color.fromARGB(255, 124, 124, 124)
              ),
            ),
          )
        ],
      ),
    );
  }
}
