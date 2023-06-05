import 'package:flutter/material.dart';
import 'card_page.dart';
import 'chicken.dart';
import 'burger.dart';
import 'food_item.dart';

class pizza extends StatefulWidget {
  @override
  _OrderingPageState createState() => _OrderingPageState();
}

class _OrderingPageState extends State<pizza> {
  List<FoodItem> foodItems = [
    FoodItem('Big-tasty-Chicken', 'assets/images/pizza/BBQ-CHICKEN-RANCH-.png', 10.99),
    FoodItem('Original-CHICKEN-RANCH', 'assets/images/pizza/Original-CHICKEN-RANCH.png', 10.99),
    FoodItem('Cheese-Lovers-p1', 'assets/images/pizza/Cheese-Lovers-p1.png', 10.99),
    FoodItem('CLASSIC--BBQ-CHICKEN', 'assets/images/pizza/CLASSIC--BBQ-CHICKEN.png', 10.99),
    FoodItem('CLASSIC-VEGETARIAN', 'assets/images/pizza/CLASSIC-VEGETARIAN.png', 10.99),
    FoodItem('Margherita-p1', 'assets/images/pizza/Margherita-p1.png', 10.99),
    FoodItem('MEAT-LOVERS', 'assets/images/pizza/MEAT-LOVERS.png', 10.99),
    FoodItem('PEPPERONI Supreme', 'assets/images/pizza/PEPPERONI Supreme.png', 10.99),
    FoodItem('Super-Supreme-p1', 'assets/images/pizza/Super-Supreme-p1.png', 13.99),

    // Add more food items as needed
  ];

  List<FoodItem> selectedItems = [];


  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in selectedItems) {
      totalPrice += (item.price * item.quantity);
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text('Pizza',style: TextStyle(color: Colors.black),
      ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pizza/CLASSIC-VEGETARIAN.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final foodItem = foodItems[index];
                  final isSelected = selectedItems.contains(foodItem);

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          foodItem.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        foodItem.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (foodItem.quantity > 1) {
                                  foodItem.quantity--;
                                } else {
                                  selectedItems.remove(foodItem);
                                }
                              });
                            },
                          ),
                          Text(foodItem.quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                if (isSelected) {
                                  foodItem.quantity++;
                                } else {
                                  selectedItems.add(foodItem);
                                  foodItem.quantity++;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            FloatingActionButton.extended(
              onPressed: () {
                // Handle checkout logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardPage(
                      selectedItems: selectedItems,
                      totalPrice: calculateTotalPrice(),
                    ),
                  ),
                );

                print('Selected items:');
                for (var item in selectedItems) {
                  print(
                      '${item.name} - ${item.imagePath} - \$${item.price.toStringAsFixed(2)}');
                }
                print(
                    'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}');
              },
              label: Text('Checkout'),
              icon: Icon(Icons.shopping_cart),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => burger()),
                      );
                    },
                    backgroundColor: Colors.indigo,

                    child: Text(
                      "Back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => chicken()),
                      );
                    },
                    backgroundColor: Colors.indigo,
                    child: Text(
                      "next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
