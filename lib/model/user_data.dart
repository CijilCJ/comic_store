class UserModel {
  final String id;
  final String userName;
  final String email;
  final String? avatarUrl;
  final String? phone;
  final String role;
  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.avatarUrl,
    required this.phone,
    required this.role
  });

  factory UserModel.from(Map<String,dynamic>json){
    return UserModel(
      id: json["id"], 
      userName: json["userName"], 
      email: json["email"], 
      avatarUrl: json["avatarUrl"], 
      phone: json["phone"],
      role: json['role']);
  }
  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "userName":userName,
      "email":email,
      "avatarUrl":avatarUrl,
      "phone":phone,
      "role":role
    };
  }
}