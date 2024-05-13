import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final String label;
  final Function()? onTap;
  const SquareTile({super.key,required this.imagePath,required this.label,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 215, 229, 255),),
          borderRadius: BorderRadius.circular(14),
          color: const Color.fromARGB(255, 215, 229, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 36,
            ),
            Text(label,style: const TextStyle(fontSize: 18),)
          ],
        ),
        
      ),
    );
  }
}