class ValidationInput {
  static String? checkEmpty(String? value) =>
      (value != null && value.isEmpty) ? 'This field cannot be empty.' : null;

  static String? checkNumber(String value) {
    if (double.tryParse(value) == null) {
      return 'Invalid number.';
    } else if (double.parse(value) <= 0) {
      return 'Number must be greater than 0.';
    }
    return null;
  }

  static String? checkIsUrl(String value) =>
      (value.startsWith('http') || value.startsWith('https'))
          ? null
          : 'Invalid URL.';
}
