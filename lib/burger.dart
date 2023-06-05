import 'package:flutter/material.dart';

import 'card_page.dart';
import 'food_item.dart';
import 'pizza.dart';

class burger extends StatefulWidget {
  @override
  _OrderingPageState createState() => _OrderingPageState();
}

class _OrderingPageState extends State<burger> {
  List<FoodItem> foodItems = [
    FoodItem('Big-tasty-Chicken', 'assets/images/burger/Big-tasty-Chicken.png', 10.99),
    FoodItem('Chicken-MACDO-Deluxe-Spicy', 'assets/images/burger/Chicken-MACDO-Deluxe-Spicy.png', 10.99),
    FoodItem('Double-Big-Tasty', 'assets/images/burger/Double-Big-Tasty.png', 10.99),
    FoodItem('Double-CheeseBurger', 'assets/images/burger/Double-CheeseBurger.png', 10.99),
    FoodItem('Double-McChicken', 'assets/images/burger/Double-McChicken.png', 10.99),
    FoodItem('Grand-Chicken-Regular', 'assets/images/burger/Grand-Chicken-Regular.png', 10.99),
    FoodItem('Grand-Chicken-Spicy', 'assets/images/burger/Grand-Chicken-Spicy.png', 10.99),
    FoodItem('Little-tasty', 'assets/images/burger/Little-tasty.png', 10.99),
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
  // final selectedItemsModel = Provider.of<SelectedItemsModel>(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text('burger',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/burger/Big-tasty-Chicken.png'),
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
                    ),                    child: ListTile(
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
                Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pizza()));
                      },
                      backgroundColor: Colors.indigo,
                      child: const Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

              ],
            )
          ],
        ),
      ),
    );
  }
}


