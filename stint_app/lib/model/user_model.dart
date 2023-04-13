class CustomUser {
  String id;
  String firstName;
  String lastName;
  String email;
  List<String> projects;

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "projects": projects,
    };
  }

  CustomUser(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.projects});
}
