class CustomUser {
  String id;
  String firstName;
  String lastName;
  String email;
  Map<String, dynamic> toJSON() {
    return {"firstName": firstName, "lastName": lastName, "email": email};
  }

  CustomUser(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email});
}
