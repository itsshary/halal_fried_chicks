import 'package:flutter/material.dart';
import 'package:halal_fried_chicks/screens/main_screens/details_screens/dish_details_screen.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({super.key});

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  List<String> burgervarity = [
    "Thunder Crispy Burger",
    "Zest Burger",
    "Chapti Burger",
    "Chicken Burger",
    "Grill Burger",
  ];

  List<String> burderPic = [
    "https://www.chunkychicken.com/wp-content/uploads/2018/09/chicken-fillt-burger.png",
    "https://theburgercity.com/wp-content/uploads/2023/03/imgpsh_fullsize_anim-1-1.png",
    "https://3.imimg.com/data3/YS/KC/MY-14301285/veggie-burger-patty-500x500.png",
    "https://roadstoves.com.pk/wp-content/uploads/2023/04/Chicken-Crunchy-Burger.png",
    "https://www.dairyqueen.com/dA/8c81764df6/quarter-pound-cheese-grillburger.png",
  ];

  List<String> prices = [
    "480",
    "530",
    "410",
    "410",
    "830",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Burger's",
        ),
        backgroundColor: Colors.blue.shade100,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: burgervarity.length,
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
                    title: burgervarity[index],
                    price: prices[index],
                    imageUrl: burderPic[index],
                    bgcolor: Colors.blue.shade100,
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
                    // Burger Image
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(burderPic[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Burger Details
                    Text(
                      burgervarity[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Price: ${prices[index]}",
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
