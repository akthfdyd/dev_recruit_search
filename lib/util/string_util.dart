isNullOrEmpty(String? str) {
  return str == null || str == "null" || str.isEmpty;
}

int? resultStringToInt(text) {
  return (text == null || text == 'null')
      ? null
      : int.parse(
          text
              .replaceAll('"', '')
              .replaceAll("'", '')
              .replaceAll(',', '')
              .replaceAll('건', '')
              .replaceAll(' ', ''),
        );
}
