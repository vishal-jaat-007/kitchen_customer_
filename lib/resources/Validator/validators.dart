// class TextValidatoryController {
//   static isname(String? value, String title) {
//     if (value == null || value.isEmpty) {
//       return title;
//     } else if (value.length < 4) {
//       return "Please enter atleast 4 characters as name";
//     } else {
//       return null;
//     }
//   }

//   static ispassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return "please enter your password";
//     } else if (value.length < 5) {
//       return "Please enter atleast 8 characters as password";
//     } else {
//       return null;
//     }
//   }

//   static isemail(String? value) {
//     if (value == null || value.isEmpty) {
//       return "please enter your email";
//     } else if (!value.contains("@gmail.com") && (!value.contains(".co.in"))) {
//       return "Please enter a valid email";
//     } else {
//       return null;
//     }
//   }

//   static isdateofbirth(String? value) {
//     if (value == null || value.isEmpty) {
//       return "please enter your DD/MM/YY";
//     } else {
//       return null;
//     }
//   }

//   static isphonenumber(value) {
//     if (value == null || value.isEmpty) {
//       return "please enter your phonenumber";
//     } else {
//       return null;
//     }
//   }
// }

abstract class AppValidator {
  String? validate(String title, String? value);
}

class TextValidator extends AppValidator {
  @override
  String? validate(String title, String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter the ${title.isEmpty ? "value" : title}";
    }
    return null;
  }
}

// ----------EMAIL VALIDATOR-----
class EmailValidator extends AppValidator {
  @override
  String? validate(String title, String? value) {
    if (value == null || value.isEmpty) {
      return "please enter your email";
    } else if (!value.contains("@gmail.com") && (!value.contains(".co.in"))) {
      return "Please enter a valid email";
    }
    return null;
  }
}

// ----------PASSWORD VALIDATOR-----
class PasswordValidator extends AppValidator {
  @override
  String? validate(String title, String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters long";
    } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
      return "Password must contain at least one lowercase letter";
    } else if (!RegExp(r'^(?=.*[0-9])').hasMatch(value)) {
      return "Password must contain at least one number";
    } else if (!RegExp(r'^(?=.*[!@#\$%^&*(),.?":{}|<>])').hasMatch(value)) {
      return "Password must contain at least one special character";
    }
    return null;
  }
}

// ----------USERNAME VALIDATOR-----
class UsernameValidator extends AppValidator {
  @override
  String? validate(String title, String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your username";
    } else if (value.length < 4) {
      return "Username must be at least 4 characters long";
    } else if (value.contains(' ')) {
      return "Username should not contain spaces";
    } else if (!RegExp(r'^[a-zA-Z0-9_.-]+$').hasMatch(value)) {
      return "Username can only contain letters, numbers, underscores, periods, or hyphens";
    }
    return null;
  }
}
