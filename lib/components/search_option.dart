import 'package:flutter/material.dart';

class SearchDoc extends StatelessWidget {
  const SearchDoc({super.key,required this.searchController});
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      child: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            isDense: false,
              contentPadding: EdgeInsets.all(10.0),
              hintText: 'Search Doctor',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              ),
              ),
    );
  }
}
