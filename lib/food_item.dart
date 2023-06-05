class FoodItem {
  String name;
  String imagePath;
  double price;
  int quantity; // Add quantity property

  FoodItem(this.name, this.imagePath, this.price, {this.quantity = 0});
}
