abstract class UserModel {
  String id;
  String name;
  String email;
  //String phone;
  String password;
  String image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    //required this.phone,
    required this.password,
    required this.image,
  });
}
