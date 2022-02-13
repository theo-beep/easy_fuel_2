class User {
  String image;
  String name;
  String email;
  String phone;
  bool delivery;
  String aboutMeDescription;

  // Constructor
  User({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.delivery,
    required this.aboutMeDescription,
  });

  User copy({
    String? imagePath,
    String? name,
    String? phone,
    String? email,
    String? about,
  }) =>
      User(
        image: imagePath ?? image,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        aboutMeDescription: about ?? aboutMeDescription,
        delivery: false,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    image: json['imagePath'],
    name: json['name'],
    email: json['email'],
    aboutMeDescription: json['about'],
    phone: json['phone'],
    delivery: json['delivery']
  );

  Map<String, dynamic> toJson() => {
    'imagePath': image,
    'name': name,
    'email': email,
    'about': aboutMeDescription,
    'phone': phone,
    'delivery': delivery
  };
}