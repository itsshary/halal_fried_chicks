import 'package:flutter/material.dart';
import 'package:halal_fried_chicks/screens/main_screens/details_screens/dish_details_screen.dart';

class TwisterScreen extends StatefulWidget {
  const TwisterScreen({super.key});

  @override
  State<TwisterScreen> createState() => _TwisterScreenState();
}

class _TwisterScreenState extends State<TwisterScreen> {
  List<String> twisters = [
    "Open Paratha",
    "Open Shawarma",
    "Fajita Open Paratha",
    "Fajita Paratha Roll",
    "Tikka Paratha",
    "Tikka Shawarma",
    "Zinger Paratha",
  ];

  List<String> twisterimages = [
    "https://pakistanatlas.com/wp-content/uploads/2020/09/Pakistani-Food_0011_12-Warqui.png",
    "https://boustan.ca/wp-content/uploads/2023/11/boustan-lebanese-restaurant-mixed-saj.png",
    "https://5.imimg.com/data5/SELLER/Default/2023/2/CA/TX/YD/164404726/aloo-paratha-500x500.png",
    "https://malikfoods.pk/wp-content/uploads/2024/09/delicious-indian-tikka-wrap-isolated-transparent-background_1036908-4767-removebg-preview.png",
    "https://5.imimg.com/data5/SELLER/Default/2023/2/CA/TX/YD/164404726/aloo-paratha-500x500.png",
    "https://pakistanatlas.com/wp-content/uploads/2020/09/Pakistani-Food_0011_12-Warqui.png",
    "https://pizzaroasters.pk/wp-content/uploads/2024/07/Untitled-paratha_Brownie-copy-5.png",
  ];

  List<String> twisterprices = [
    "680",
    "630",
    "730",
    "450",
    "380",
    "310",
    "380",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Twisters",
        ),
        backgroundColor: Colors.amber.shade100,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: twisters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10, // Spacing between columns
          mainAxisSpacing: 10, // Spacing between rows
          childAspectRatio: 0.7, // Adjust the ratio to fit content
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DishDetailsScreen(
                    title: twisters[index],
                    price: twisterprices[index],
                    imageUrl: twisterimages[index],
                    bgcolor: Colors.amber.shade100,
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.white.withOpacity(0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Twister Image
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(twisterimages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Twister Details
                    Text(
                      twisters[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Price: ${twisterprices[index]}",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
