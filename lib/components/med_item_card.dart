import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MedCard extends StatelessWidget {
  const MedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: AspectRatio(
                  aspectRatio: 0.5,
                  child: CachedNetworkImage(
                    imageUrl: 'https://cdn01.pharmeasy.in/dam/products/145735/pyrigesic-500mg-tablet-7-1641536310.jpg',
                    fit: BoxFit.cover,
                    width: 71,
                    height: 71,
        ),
    ),),),],
      );
  }
}