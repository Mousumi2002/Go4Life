import "package:flutter/material.dart";

class CardTile extends StatelessWidget {
  const CardTile({super.key, required this.image,required this.title,required this.tap});

  final String image;
  final String title;
  final void Function() tap;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
        ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(image: AssetImage(
            image
          ),
          colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
          child: InkWell(
            onTap: tap,
          ),
          height: 160,
          fit: BoxFit.cover,
          ),
          Positioned(
            bottom:16,
            right:16,
            left:16,
            child:Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 28,
          ),),
          ),
          ],
      )
    );
  }
}

class CardTile1 extends StatelessWidget {
  const CardTile1({super.key,required this.image,required this.title,required this.tap});

  final String image;
  final String title;
  final void Function() tap;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
        ),
      child: Stack(
        alignment: Alignment.center,
        children:[
          Ink.image(image: AssetImage(
            image
          ),
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          child: InkWell(
            onTap: tap,
          ),
          height: 160,
          width: 185,
          fit: BoxFit.cover,
          ),
          Positioned(
            bottom:16,
            right:16,
            left:16,
            child:Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 251, 251),
            fontSize: 26,
          ),),
          ),
          ],
      )
    );
  }
}