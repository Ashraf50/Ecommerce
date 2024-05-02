String extractFirstThreeWords(String text) {
  // Split the text by whitespace
  List<String> words = text.trim().split(' ');
  int numberOfWords = words.length > 2 ? 2 : words.length;
  String firstThreeWords = words.sublist(0, numberOfWords).join(' ');

  return firstThreeWords;
}
