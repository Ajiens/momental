class Validator {
  static String? rule(
    String? value, {
    bool required = false,
  }) {
    if (required && value!.isEmpty) {
      return 'Input tidak boleh kosong';
    }
    return null;
  }

  static String? required(
    dynamic value, {
    String? fieldName,
  }) {
    if (value == null) {
      return 'Input tidak boleh kosong';
    }

    if (value is String || value == null) {
      if (value.toString() == 'null') return 'Input tidak boleh kosong';
      if (value.isEmpty) return 'Input tidak boleh kosong';
    }

    if (value is List) {
      if (value.isEmpty) return 'Input tidak boleh kosong';
    }
    return null;
  }

  static String? email(String? value) {
    if (value!.isEmpty) return 'Input tidak boleh kosong';

    final isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+",
    ).hasMatch(value);

    if (!isValidEmail) {
      return 'Format email tidak sesuai';
    }
    return null;
  }

  static String? noTelpon(String? value) {
    if (value!.isEmpty) return 'Input tidak boleh kosong';

    final isNumber = RegExp(r'^[1-9][0-9]+$').hasMatch(value);
    if (!isNumber) {
      return 'Format nomor telepon tidak sesuai';
    }
    return null;
  }

  static String? number(String? value) {
    if (value!.isEmpty) return 'Input tidak boleh kosong';

    final isNumber = RegExp(r'^[0-9]+$').hasMatch(value);
    if (!isNumber) {
      return 'Format angka tidak sesuai';
    }
    return null;
  }

  static String? matchingValue (String? value1, String? value2){
    if (value1!.isEmpty) return 'Input tidak boleh kosong';

    if (value1 != value2!){
      return "Katasandi tidak cocok";
    }
    return null;
  }

  static String? atLeastOneitem(List<Map<String, dynamic>> items) {
    final checkedItems = items.where((i) => i['checked'] == true).toList();
    if (checkedItems.isEmpty) {
      return 'Pilih salah satu';
    }
    return null;
  }
}
