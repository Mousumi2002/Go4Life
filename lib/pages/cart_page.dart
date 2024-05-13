import 'package:app_go/components/appbar.dart';
import 'package:app_go/components/item_search_result_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool buttonState = true;

  void _buttonChange() {
    setState(() {
      buttonState = !buttonState;
    });
  }

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
              'Cart',
              style: TextStyle(
                  color: Color.fromARGB(255, 10, 55, 214),
                  fontSize: 22),
            ),
          ],
          ),
          const SizedBox(height: 4,),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 215, 229, 255),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 140,
                      height: 120,
                      child: DecoratedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: (){}, 
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey.shade500,
                                  ),
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Pyregesic 500",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                ),
                                maxLines: 2,
                                ),
                            ),
                            _shoppingItems()
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 255, 255)
                        ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 140,
                      height: 120,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 255, 255)
                        ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 140,
                      height: 120,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 255, 255)
                        ),),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 140,
                      height: 120,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 255, 255)
                        ),),
                    ),
                  ),
                ],
              ),
              ),
          ),
          const SizedBox(height: 6,),
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              "Available Sellers",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 10, 55, 214),
              ),
              ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sorted By",
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 10, 55, 214),
                  ),
                  ),
                Wrap(
                  spacing: 40,
                  children: <Widget>[
                    MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Color.fromARGB(255, 215, 229, 255),
                        )
                      ),
                      onPressed: buttonState ? _buttonChange : null,
                      child: Text(
                        "Cost",
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 55, 214),
                        ),
                        ),
                      color: Color.fromARGB(255, 215, 229, 255),
                    ),
                    MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Color.fromARGB(255, 215, 229, 255),
                        )
                      ),
                      onPressed: buttonState ? null : _buttonChange,
                      child: Text(
                        "Time",
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 55, 214),
                        ),
                        ),
                      color: Color.fromARGB(255, 215, 229, 255),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Column(
          //   children: [
          //     ListView(
          //       scrollDirection: Axis.vertical,
          //       children: [
          //         CartSearchOptions(),
          //         CartSearchOptions(),
          //         CartSearchOptions(),
          //       ],
          //     ),
          //   ],
          // ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  CartSearchOptions(),
                  SizedBox(height: 6,),
                  CartSearchOptions(),
                  SizedBox(height: 6,),
                  CartSearchOptions(),
                  SizedBox(height: 6,),
                  CartSearchOptions(),
                  SizedBox(height: 6,),
                  CartSearchOptions(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _shoppingItems(){
    return Expanded(
      child: Card(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _decrementButton(),//decrementButton(itemIndex)
            Text(
              "1",
              //'${numberOfItems[itemIndex]}',
              style: TextStyle(fontSize: 18.0),
            ),
            _incrementButton(),//incrementButton(itemIndex)
            ],
          ),
        ),
      ),
    );
  }
  Widget _incrementButton() { //Widget _incrementButton(int index)
  return SizedBox(
    width: 40,
    height: 30,
    child: FloatingActionButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Icon(Icons.add, color: Colors.white),
      backgroundColor: Color.fromARGB(255, 102, 159, 255),
      onPressed: () {
        setState(() {
          // numberOfItems[index]++;
        });
      },
    ),
  );
}
Widget _decrementButton() { //Widget _decrementButton(int index)
  return SizedBox(
    width: 40,
    height: 30,
    child: FloatingActionButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
        onPressed: () {
          setState(() {
            //numberOfItems[index]--;
          });
        },
        child: Icon(Icons.remove, color: Colors.white),
      backgroundColor: Color.fromARGB(255, 102, 159, 255),),
  );
}
}