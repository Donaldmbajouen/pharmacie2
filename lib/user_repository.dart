class UserRepository {
  static final List<Map<String, dynamic>> userList = [];
  static String? currentUserEmail;

  static void addUser(String username, String email, String password) {
    userList.add({
      'username': username,
      'email': email,
      'password': password,
      'phone': '',
      'address': '',
      'birthdate': '',
    });
  }

  static bool validateUser(String email, String password) {
    return userList.any((user) =>
    user['email'] == email && user['password'] == password);
  }

  static Map<String, dynamic>? get currentUser {
    if (currentUserEmail == null) return null;
    return userList.firstWhere(
          (user) => user['email'] == currentUserEmail,
      orElse: () => {},
    );
  }

  static void updateUser(String field, dynamic value) {
    if (currentUserEmail == null) return;

    final index = userList.indexWhere((user) => user['email'] == currentUserEmail);
    if (index != -1) {
      userList[index][field] = value;
    }
  }
}