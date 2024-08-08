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
