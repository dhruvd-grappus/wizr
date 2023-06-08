class ValidationUtils {
  static final RegExp _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9!#$%&'*+-/=?^_]+\.[a-zA-Z]+",
  );

  static final RegExp _validMobileNumberRegex = RegExp(r'^[6-9][0-9]{9}$');
  static final RegExp onlyAlphabetsRegex = RegExp(r'^[a-zA-Z]+$');
  static int phoneNumberLength = 10;

  static bool isValidPhoneNumber(String number) {
    return number.isNotEmpty ||
        number.length == 10 && _validMobileNumberRegex.hasMatch(number);
  }

  static bool isValidDate(String date, String month, String year) {
    try {
      if (date.isEmpty || month.isEmpty || year.isEmpty) {
        return false;
      }
      final parseYear = int.parse(year);
      final parseMonth = int.parse(month);
      final parseDate = int.parse(date);
      final dateTime = DateTime(parseYear, parseMonth, parseDate);
      return date.length == 2 &&
          month.length == 2 &&
          year.length == 4 &&
          parseDate <= 31 &&
          parseMonth <= 12 &&
          parseYear > 1900 &&
          parseDate > 0 &&
          parseMonth > 0 &&
          parseYear > 0 &&
          dateTime.isBefore(DateTime.now()) &&
          dateTime.isAfter(DateTime(1900));
    } catch (e) {
      return false;
    }
  }

  static bool isValidLength(String text, int length) {
    return text.length == length;
  }

  static bool isValidUsername(String s) {
    return onlyAlphabetsRegex.hasMatch(s);
  }

  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email);
  }

  static bool isValidUrl(String url) {
    return url.startsWith('https');
  }

  static bool isValidOtp(String otp) {
    return otp.length == 6;
  }
}
