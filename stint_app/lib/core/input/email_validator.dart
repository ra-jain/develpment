String? validateEmail(String email) {
  if (email == '') {
    return "Please Enter Email";
  }
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);
  if (regExp.hasMatch(email)) {
    return null;
  }
  return 'Please Enter a Valid Email';
}
