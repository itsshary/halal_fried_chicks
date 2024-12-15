import 'package:flutter/material.dart';

class PizzaDetailsScreen extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final Color bgcolor;
  const PizzaDetailsScreen(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.bgcolor});

  @override
  State<PizzaDetailsScreen> createState() => _PizzaDetailsScreenState();
}

class _PizzaDetailsScreenState extends State<PizzaDetailsScreen> {
  int counter = 0;
  List<String> pizzasizes = ["S", "M", "L", "F"];
  String categoryName = "L";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: widget.bgcolor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Container(
                    height: 270,
                    width: 270,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: widget.bgcolor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                counter++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 20.0,
                            )),
                        Flexible(child: Text(counter.toString())),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (counter > 0) {
                                  counter--;
                                }
                              });
                            },
                            icon: const Icon(size: 20.0, Icons.remove))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Select Size",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                  children: List.generate(
                pizzasizes.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      categoryName = pizzasizes[index];
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: categoryName == pizzasizes[index]
                                ? widget.bgcolor
                                : Colors.white,
                            shape: BoxShape.circle),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(pizzasizes[index]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
              const SizedBox(height: 10.0),
              const Text(
                "This is a delicious dish loved by everyone.\n It's made with fresh ingredients and a unique \nrecipe that brings out an unforgettable taste.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 75,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Rs.${widget.price}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: widget.bgcolor),
              child: const Center(
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
