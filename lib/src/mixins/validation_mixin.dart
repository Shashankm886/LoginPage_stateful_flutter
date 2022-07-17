class ValidationMixin{
  String? validateEmail(value) {
    
        //return null if valid
        //otherwise string with error message if invalid
        if (value != null && !value.isEmpty) {
          if (!value.contains('@')) {
            return "Not a valid email";
          } else {
            return null;
          }
        }
    
  }


  String? validatePassword(value) {
        if (value != null && !value.isEmpty) {
          if (value.length < 4) {
            return "Password length should be atleast 6";
          } else {
            return null;
          }
        }
      }
}