
class ValidationUtils {
  static bool isStingEmpty(String string) {
    return string.trim().isEmpty ? true : false;
  }

  static bool validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp =  RegExp(patttern);
    if (isStingEmpty(value)) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return (!RegExp(pattern).hasMatch(value!)) ? false : true;
  }
}
