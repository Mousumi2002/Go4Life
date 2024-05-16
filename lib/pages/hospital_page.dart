import 'package:app_go/components/appbar.dart';
import 'package:app_go/components/custom_button.dart';
import 'package:app_go/components/search_option.dart';
import 'package:app_go/pages/doctors_list.dart';
import 'package:app_go/provider/doctor_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({super.key});
  @override
  Widget build(BuildContext context) {
    final doctorProvider = context.watch<DoctorProvider>();
    final docNameCtrl = doctorProvider.docNameCtrl;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: const AppBarTitle(),
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 180,
              child: Column(
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
                      'Hospital',
                      style: TextStyle(color: Color.fromARGB(255, 10, 55, 214), fontSize: 22),
                    )
                  ]),
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
                                        searchController: docNameCtrl,
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
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const _CategorySelector(),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    _SearchButton(
                                      onSearch: () {
                                        doctorProvider.clearFilter();
                                        doctorProvider.filterDoctors();
                                        if (docNameCtrl.text.isNotEmpty) {
                                          doctorProvider.searchDoctors(docNameCtrl.text);
                                        }
                                      },
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
                                      searchController: docNameCtrl,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  _SearchButton(onSearch: () {
                                    doctorProvider.clearFilter();
                                    doctorProvider.searchDoctors(docNameCtrl.text);
                                  }),
                                ],
                              ),
                              Column(
                                children: [
                                  const _CategorySelector(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  _SearchButton(
                                    onSearch: () {
                                      final doctorProvider = context.read<DoctorProvider>();
                                      doctorProvider.clearFilter();
                                      doctorProvider.filterDoctors();
                                    },
                                  ),
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
                  const DoctorsList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({
    required this.onSearch,
  });

  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 40,
      child: CustomButton(
        text: "Search",
        onPressed: onSearch,
      ),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector();

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    return Container(
      color: Colors.white,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: DropdownSearch<String>(
          items: doctorProvider.specialisations,
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
                borderSide: BorderSide(color: Colors.white, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
          onChanged: (value) {
            if (value != null) {
              doctorProvider.setSelectedSpecialisation(value);
            }
          },
          selectedItem: doctorProvider.selectedSpecialisation,
        ),
      ),
    );
  }
}
