class Shoe {
  final int id;
  final String name;
  final double price;
  final String gender;
  final String category;
  final String imageURL;

  Shoe({
    required this.id,     
    required this.name,     
    required this.price,    
    required this.gender,    
    required this.category,    
    required this.imageURL,    
  });

  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe (
      id: json['id'] as int,
      name: json['name'],
      price: (json['price']).toDouble(),
      gender: json['gender'],
      category: json['category'],
      imageURL: json['imageURL'] 
    );
  }
}