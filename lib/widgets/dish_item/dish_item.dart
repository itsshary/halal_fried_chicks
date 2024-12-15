import 'package:flutter/material.dart';
import 'package:halal_fried_chicks/screens/main_screens/details_screens/dish_details_screen.dart';

class DishItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final Color bgcolor;

  const DishItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DishDetailsScreen(
              title: title,
              price: price,
              imageUrl: imageUrl,
              bgcolor: bgcolor,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(price, style: const TextStyle(color: Colors.orange)),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
