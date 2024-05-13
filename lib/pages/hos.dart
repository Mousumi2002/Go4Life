import 'package:app_go/components/appbar.dart';
import 'package:app_go/components/custom_button.dart';
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
    return SafeArea(
      child: DefaultTabController(
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
                  const Text(
                    'Hospital',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 55, 214),
                        fontSize: 22),
                  )
                ]),
              ),
              DefaultTabController(
                length: 3,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue.shade200),
                      color: const Color.fromARGB(255, 235, 242, 255)),
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: const TabBar(
                          indicatorColor: Color.fromARGB(255, 0, 58, 166),
                          labelColor: Color.fromARGB(255, 0, 58, 166),
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
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Category',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 10, 55, 214),
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
                                      dropdownButtonProps: const DropdownButtonProps(
                                        color: Color.fromARGB(255, 10, 55, 214),
                                      ),
                                      dropdownDecoratorProps: const DropDownDecoratorProps(
                                        textAlignVertical: TextAlignVertical.center,
                                        dropdownSearchDecoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: EdgeInsets.all(10.0),
                                            hintText: 'Categories',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white, width: 1.5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.transparent),
                                            ),
                                            ),
                                      ),
                                      onChanged: (value) {
                                        print('$value');
                                      },
                                      selectedItem: 'All',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 10, 55, 214),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 127, vertical: 6),
                                  ),
                                  onPressed: () {
                                    String doc = doc_name.text;
                                    print("Doctor Name: $doc");
                                  },
                                  child: const Text('Search',style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                      color: Colors.white,
                                      width: 300,
                                      child: SearchDoc(
                                        searchController: doc_name,
                                      ),
                                    ),
                              const SizedBox(height: 30,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: 40,
                                child: CustomButton(text: "Search", onPressed: (){print("$doc_name");},)),
                            ],
                          ),
                          Column(
                            children: [
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
                                          dropdownButtonProps: const DropdownButtonProps(
                                            color: Color.fromARGB(255, 10, 55, 214),
                                          ),
                                          dropdownDecoratorProps: const DropDownDecoratorProps(
                                            textAlignVertical: TextAlignVertical.center,
                                            dropdownSearchDecoration: InputDecoration(
                                                isDense: true,
                                                contentPadding: EdgeInsets.all(10.0),
                                                hintText: 'Categories',
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white, width: 1.5),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.transparent),
                                                ),
                                                ),
                                          ),
                                          onChanged: (value) {
                                            print('$value');
                                          },
                                          selectedItem: 'All',
                                        ),
                                      ),
                                    ),
                                  const SizedBox(height: 30,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: 40,
                                child: CustomButton(text: "Search", onPressed: (){
                                  String doc = doc_name.text;
                                  print("Doctor Name: $doc");
                                },)),  
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  'Results',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const ResultList()
            ],
          ),
        ),
      ),
    );
  }
}
