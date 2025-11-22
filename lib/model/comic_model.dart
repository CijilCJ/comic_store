class ComicBookModel {
  final String id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  final DateTime releaseDate;
  bool isFavorite;
  
  ComicBookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.releaseDate,
    this.isFavorite=false
  });
  factory ComicBookModel.from(Map<String,dynamic>json){
    return ComicBookModel(
      id: json["id"], 
      title: json["title"], 
      author: json["author"], 
      price: json["price"],
      description: json["description"], 
      imageUrl: json["image"],
      category:  json["category"],
      releaseDate: json["releaseDate"]
      );
  }

  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "title":title,
      "auther":author,
      "gener":price,
      "description":description,
      "category":category,
      "releaseDate":releaseDate,
      "image":imageUrl
    };
  }
}