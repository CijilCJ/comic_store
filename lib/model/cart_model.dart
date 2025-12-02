class CartModel {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String author;
  int quantity;

  CartModel({
     required this.id,
     required this.title,
     required this.author,
     required this.price,
     required this.imageUrl,
    this.quantity=1
  });
  factory CartModel.from(Map<String,dynamic>json){
    return CartModel(
      id: json["id"], 
      title: json["title"], 
      author: json["author"], 
      price: json["price"],
      imageUrl: json["image"],
      );
  }
  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "title":title,
      "auther":author,
      "gener":price,
      "image":imageUrl
    };
  }
}