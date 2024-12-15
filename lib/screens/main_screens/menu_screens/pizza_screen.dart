import 'package:flutter/material.dart';
import 'package:halal_fried_chicks/screens/main_screens/details_screens/pizza_details_screen.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  final pizzalist = Pizzalists.instance;

  // Default pizza type to display
  String selectedPizzaType = "Cheezy Pizza";
  List<String> pizzaNames = [];
  List<String> pizzaImages = [];

  @override
  void initState() {
    super.initState();
    _updatePizzaList(); // Initialize with the default pizza type
  }

  void _updatePizzaList() {
    // Update the pizzaNames and pizzaImages based on the selected type
    switch (selectedPizzaType) {
      case "Cheezy Pizza":
        pizzaNames = pizzalist.cheezzypizza;
        pizzaImages = pizzalist.cheezzypizzaimag;
        break;
      case "Spicy Pizza":
        pizzaNames = pizzalist.spicyPizza;
        pizzaImages = pizzalist.spicyPizzaimg;
        break;
      case "Classic Pizza":
        pizzaNames = pizzalist.classicpizza;
        pizzaImages = pizzalist.classicpizzaimg;
        break;
      case "Pizza Deals":
        pizzaNames = pizzalist.pizzadeals;
        pizzaImages = List.generate(
          pizzalist.pizzadeals.length,
          (index) => "https://via.placeholder.com/150", // Placeholder image
        );
        break;
      default:
        pizzaNames = [];
        pizzaImages = [];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pizza Menu",
        ),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown for pizza types
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton<String>(
              value: selectedPizzaType,
              isExpanded: true,
              items: pizzalist.pizzatypes.map((String pizzaType) {
                return DropdownMenuItem<String>(
                  value: pizzaType,
                  child: Text(
                    pizzaType,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedPizzaType = newValue;
                    _updatePizzaList();
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          // GridView for pizzas
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: pizzaNames.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PizzaDetailsScreen(
                          title: pizzaNames[index],
                          price: "",
                          imageUrl: pizzaImages[index],
                          bgcolor: Colors.deepPurple.shade100,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pizza Image
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(pizzaImages[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Pizza Name
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            pizzaNames[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Pizzalists {
  static Pizzalists instance = Pizzalists();

  List<String> pizzatypes = [
    "Spicy Pizza",
    "Classic Pizza",
    "Cheezy Pizza",
    "Pizza Deals",
  ];

  List<String> cheezzypizza = [
    "Cheesy Creamy Pizza",
    "Special Malai Pizza",
    "HFC Special Dinner Pizza",
    "HFC Special Kababish Pizza",
    "HFC Special Pizza",
  ];

  List<String> pizzadeals = [
    "Pizza Deal # 1",
    "Pizza Deal # 2",
    "Pizza Deal # 3",
    "Pizza Deal # 4",
    "Pizza Deal # 5",
  ];
  List<String> cheezzypizzaimag = [
    "https://cheesyocean.com/wp-content/uploads/2023/11/C-CO-CLASSIC-300X300--100x100.png",
    "https://pizza360.businesswala.pk/assets/uploads/605a1dfffef3f0de232b66bc8943cda1.png",
    "https://everydaypizza.ca/wp-content/uploads/2016/08/product-10.png",
    "https://halodili.com/pub/media/catalog/product/cache/e307f1ad14a0fd621bf74586c5477419/h/a/hawaiian-pizza_1_-removebg-preview_1__3.png",
    "https://img.cdn4dd.com/p/fit=cover,width=1200,height=600,format=auto,quality=90/media/photosV2/b10077a8-1ef3-4214-9696-107025db6eaf-retina-large.png",
  ];

  List<String> spicyPizza = [
    "Chicken Mughlai ",
    "Chicken Fajita Spicy",
    "Chicken Mexican",
    "Achari Pizza",
    "Bonfire pizza",
  ];
  List<String> spicyPizzaimg = [
    "https://cheeros.pk/wp-content/uploads/2024/04/MELTY-FEAST-PIZZA.png",
    "https://d2l1qb2xg9gi7w.cloudfront.net/om/web-static-images/menu/chicken-fajita.png",
    "https://d2l1qb2xg9gi7w.cloudfront.net/za/images/Website/mexican-chicken6892.png",
    "https://pngimg.com/uploads/pizza/small/pizza_PNG7137.png",
    "https://bonfire.pizza/assets/images/slider-pizza/Margarita.png",
  ];

  List<String> classicpizza = [
    "Chicken Tikka",
    "Chicken Arabian",
    "Chicken Supreme",
    "Veggie Lover",
  ];
  List<String> classicpizzaimg = [
    "https://d2l1qb2xg9gi7w.cloudfront.net/za/images/Website/mexican-chicken6892.png",
    "https://pizzahutaruba.com/wp-content/uploads/2023/06/Veggie-removebg-preview-1.png",
    "https://everydaypizza.ca/wp-content/uploads/2016/08/product-10.png",
    "https://cheesyocean.com/wp-content/uploads/2023/11/C-CO-CLASSIC-300X300--100x100.png",
  ];
}
