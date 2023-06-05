import 'package:flutter/material.dart';
import 'cafi.dart';
import 'card_page.dart';
import 'food_item.dart';


class desserts extends StatefulWidget {
  @override
  _OrderingPageState createState() => _OrderingPageState();
}

class _OrderingPageState extends State<desserts> {
  List<FoodItem> foodItems = [
    FoodItem('Blueberry Cheese Cake', 'assets/images/desserts/Blueberry Cheese Cake.png', 13.99),
    FoodItem('Chocolate Chip Cookie', 'assets/images/desserts/Chocolate Chip Cookie.png', 15.99),
    FoodItem('Chocolate Walnut', 'assets/images/desserts/Chocolate Walnut.png', 16.99),
    FoodItem('Chocolate-Fudge', 'assets/images/desserts/Chocolate-Fudge.png', 18.99),
    FoodItem('Plain Croissant', 'assets/images/desserts/Plain Croissant.png', 14.99),
    FoodItem('Blueberry Cheese Cake', 'assets/images/desserts/Blueberry Cheese Cake.png', 13.99),
    FoodItem('Red Velvet Cake', 'assets/images/desserts/Red Velvet Cake.png', 17.99),

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
        title: Text('Desserts',style: TextStyle(color: Colors.black),
      ),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/desserts/Red Velvet Cake.png'),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => cafe()),
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


              ],
            )
          ],
        ),
      ),
    );
  }
}
