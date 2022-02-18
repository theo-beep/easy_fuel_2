
class User {
  final String imagePath;
  final String name;
  final String email;
  final String cellphone;
  final bool delivery;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.cellphone,
    required this.delivery,
    required this.isDarkMode,
  });

  User copyWith({
    String? imagePath,
    String? name,
    String? email,
    String? cellphone,
    bool? delivery,
    bool? isDarkMode,
  }) {
    return User(
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      email: email ?? this.email,
      cellphone: cellphone ?? this.cellphone,
      delivery: delivery ?? this.delivery,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': this.imagePath,
      'name': this.name,
      'email': this.email,
      'cellphone': this.cellphone,
      'delivery': this.delivery,
      'isDarkMode': this.isDarkMode,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      imagePath: map['imagePath'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      cellphone: map['cellphone'] as String,
      delivery: map['delivery'] as bool,
      isDarkMode: map['isDarkMode'] as bool,
    );
  }
}