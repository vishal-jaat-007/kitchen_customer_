extension StringExtensions on String {
  String toTitleCase() {
    return (this)
        .toLowerCase()
        .trim()
        .split(" ")
        .map((e) => e.replaceFirst(e[0], e[0].toUpperCase()))
        .join(" ");
  }
}
