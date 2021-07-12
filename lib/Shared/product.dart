class Product {
  final String title;
  final String image;
  final double rating;
  final double price;
  final String item;

  Product(
    this.title,
    this.image,
    this.rating,
    this.price,
    this.item,
  );
}

List<Product> product = [
  Product(
      "Fries",
      "https://images.pexels.com/photos/1893555/pexels-photo-1893555.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      4.5,
      2.5,
      "assets/images/fries_.png"),
  Product(
      "Pizza",
      "https://images.pexels.com/photos/2619967/pexels-photo-2619967.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      4.8,
      5.5,
      "assets/images/pizza_.png"),
  Product(
    "Burger",
    "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    4.9,
    3,
    "assets/images/burger_.png",
  ),
  Product(
      "Sandwich",
      "https://images.pexels.com/photos/5337811/pexels-photo-5337811.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      4.3,
      3.8,
      "assets/images/sandwich_.png"),
  Product(
      "Salad",
      "https://images.pexels.com/photos/1059905/pexels-photo-1059905.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      4,
      3.2,
      "assets/images/salad_.png"),
  Product(
    "Noddles",
    "https://images.pexels.com/photos/1059905/pexels-photo-1059905.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    4.7,
    2.7,
    "assets/images/noddles_.png",
  ),
  Product(
    "Pasta",
    "https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    4.3,
    2.3,
    "assets/images/pasta_.png",
  ),
];
