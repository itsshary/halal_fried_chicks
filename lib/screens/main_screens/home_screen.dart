import 'package:flutter/material.dart';
import 'package:halal_fried_chicks/screens/main_screens/menu_screens/burger_screen.dart';
import 'package:halal_fried_chicks/screens/main_screens/menu_screens/offer_screen.dart';
import 'package:halal_fried_chicks/screens/main_screens/menu_screens/pizza_screen.dart';
import 'package:halal_fried_chicks/screens/main_screens/menu_screens/twister_screen.dart';
import 'package:halal_fried_chicks/widgets/dish_item/dish_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listdishes = [
    "Zest Burger",
    "Open Paratha",
    "Zinger Paratha",
  ];

  TextEditingController searchcontroller = TextEditingController();
  List<String> catagories = [
    "Popular",
    "Pizza",
    "Burger",
    "Twister",
    "Offers",
  ];
  List<String> catagoriesimg = [""];
  String categoryName = "Popular";

  List<Color> listcolors = [
    Colors.deepOrange.shade100,
    Colors.deepPurple.shade100,
    Colors.blue.shade100,
  ];

  final imageslist = [
    "https://theburgercity.com/wp-content/uploads/2023/03/imgpsh_fullsize_anim-1-1.png",
    "https://pakistanatlas.com/wp-content/uploads/2020/09/Pakistani-Food_0011_12-Warqui.png",
    "https://pizzaroasters.pk/wp-content/uploads/2024/07/Untitled-paratha_Brownie-copy-5.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.95),
        title: const Text(
          'Doulat Nagar,Gujrat',
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            radius: 20.0,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Welcome Back On\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                ),
                children: [
                  TextSpan(
                      text: 'Halal Fried Chicks',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0)),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: searchcontroller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                fillColor: Colors.white,
                hintText: "Search Item's",
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // Email validation
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                catagories.length,
                (index) => InkWell(
                  onTap: () {
                    categoryName = catagories[index];
                    setState(() {});
                    if (categoryName == "Pizza") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PizzaScreen()));
                    } else if (categoryName == "Burger") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BurgerScreen()));
                    } else if (categoryName == "Twister") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TwisterScreen()));
                    } else if (categoryName == "Offers") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OfferScreen()));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: listcolors[index],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Text(
                        catagories[index],
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              )),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 5, // Dummy item count
                itemBuilder: (context, index) {
                  return Card(
                    color: listcolors[index],
                    child: DishItem(
                      bgcolor: listcolors[index],
                      imageUrl: imageslist[index],
                      title: listdishes[index],
                      price: '${(index + 190) * 5}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
