class Validators {
  static String? requiredFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo no puede estar vacío';
    }
    return null;
  }
}
