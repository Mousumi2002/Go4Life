import 'package:app_go/components/appbar.dart';
import 'package:app_go/components/search_option.dart';
import 'package:app_go/pages/doctorlist.dart';
import 'package:app_go/pages/result_list.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TabControl extends StatelessWidget {
  TabControl({super.key});
  final doc_name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBarTitle(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(children: [
                IconButton(
                  onPressed: () {
                  Navigator.pop(context);
                },
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 31.0,
                ),
                Text(
                  'Hospital',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 10, 55, 214),
                      fontSize: 22),
                )
              ]),
            ),
            DefaultTabController(
              length: 3,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: const Color.fromARGB(255, 235, 242, 255)),
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TabBar(
                        indicatorColor: Color.fromARGB(255, 0, 58, 166),
                        labelColor: const Color.fromARGB(255, 0, 58, 166),
                        tabs: [
                          Tab(text: 'All'),
                          Tab(text: 'Doctor'),
                          Tab(text: 'Category'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200.0,
                      child: TabBarView(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                width: 300,
                                child: SearchDoc(
                                  searchController: doc_name,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Category',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 10, 55, 214),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Container(
                                color: Colors.white,
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.2),
                                  child: DropdownSearch<String>(
                                    items: Results.categories.toList(),
                                    popupProps: PopupProps.menu(
                                      menuProps: MenuProps(
                                          shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                      showSearchBox: true,
                                    ),
                                    dropdownButtonProps: DropdownButtonProps(
                                      color: const Color.fromARGB(255, 10, 55, 214),
                                    ),
                                    dropdownDecoratorProps: DropDownDecoratorProps(
                                      textAlignVertical: TextAlignVertical.center,
                                      dropdownSearchDecoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(10.0),
                                          hintText: 'Categories',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 1.5),
                                          )),
                                    ),
                                    onChanged: (value) {
                                      print('$value');
                                    },
                                    selectedItem: 'All',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 10, 55, 214),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 127, vertical: 6),
                                ),
                                onPressed: () {
                                  String doc = doc_name.text;
                                  print("Doctor Name: $doc");
                                },
                                child: Text('Search'),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.wallet),
                        Icon(Icons.umbrella)
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                'Results',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const ResultList()
          ],
        ),
      ),
    );
  }
}
