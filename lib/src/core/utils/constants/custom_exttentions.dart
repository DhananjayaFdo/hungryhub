extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String capitalize2() {
    List list = split(' ');

    String capitalize(String word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }

    return list.map((capitalize) => null).join(' ');
  }

  String limitText(int limit, {bool isDots = true}) {
    if (length < limit) return this;
    return "${substring(0, limit)}${isDots ? '......' : ''}";
  }
}
