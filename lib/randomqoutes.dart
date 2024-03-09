import 'dart:math';

import 'quote.dart';

class RandomQuote {
  int _quoteNumber = 0;
  final List<Quote> favoriteQuotes = [];
  int _nextId = 1;

  void addToFavorites() {
    final currentQuote = _quoteData[_quoteNumber];
    if (!favoriteQuotes.contains(currentQuote)) {
      favoriteQuotes.add(currentQuote);
    }
  }

  List<Quote> getFavoriteQuotes() {
    return favoriteQuotes;
  }

  final List<Quote> _quoteData = [
    Quote(1, "No one can make you feel inferior without your consent.",
        "Eleanor Roosevelt"),
    Quote(
      2,
      "It is better to remain silent at the risk of being thought a fool, than to talk and remove all doubt of it.",
      "Maurice Switzer",
    ),
    Quote(
        3,
        "The fool doth think he is wise, but the wise man knows himself to be a fool.",
        " William Shakespeare"),
    Quote(
        4,
        "Whenever you find yourself on the side of the majority, it is time to reform (or pause and reflect).",
        " Mark Twain "),
    Quote(
        5, "The only true wisdom is in knowing you know nothing.", " Socrates"),
    Quote(
        6,
        "The saddest aspect of life right now is that science gathers knowledge faster than society gathers wisdom.",
        " Isaac Asimov"),
    Quote(
        7,
        "Hold fast to dreams,For if dreams die, Life is a broken-winged bird,That cannot fly.",
        "Langston Hughes"),
    Quote(
        8,
        "It is the mark of an educated mind to be able to entertain a thought without accepting it.",
        " Aristotle"),
    Quote(
        9, "Any fool can know. The point is to understand.", "Albert Einstein"),
    Quote(
        10,
        "The best index to a person's character is how he treats people who can't do him any good, and how he treats people who can't fight back.",
        " Abigail Van Buren"),
    Quote(
        11,
        "There are three things all wise men fear: the sea in storm, a night with no moon, and the anger of a gentle man.",
        " Patrick Rothfuss"),
    Quote(
        12,
        "By three methods we may learn wisdom: First, by reflection, which is noblest; Second, by imitation, which is easiest; and third by experience, which is the bitterest.",
        "Confucius"),
    Quote(
        13,
        "In the end, it's not the years in your life that count. It's the life in your years.",
        "Abraham Lincoln"),
    Quote(14, "The only way to do great work is to love what you do.",
        "Steve Jobs"),
    Quote(15, "You miss 100% of the shots you don't take.", "Wayne Gretzky"),
    Quote(
        16, "The journey of a thousand miles begins with one step.", "Lao Tzu"),
    Quote(
        17,
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "Franklin D. Roosevelt"),
    Quote(
        18, "Believe you can and you're halfway there.", "Theodore Roosevelt"),
    Quote(
        19,
        "The future belongs to those who believe in the beauty of their dreams.",
        "Eleanor Roosevelt"),
    Quote(
        20,
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
        "Winston Churchill"),
    Quote(
        21, "In the middle of difficulty lies opportunity.", "Albert Einstein"),
  ];

  String getQuoteText() {
    return _quoteData[_quoteNumber].quote;
  }

  String getQuoteAuthor() {
    return " -- " + _quoteData[_quoteNumber].author;
  }

  void reset() {
    _quoteNumber = 0;
  }

  nextQuote() {
    int max = _quoteData.length;
    Random random = new Random();
    _quoteNumber = random.nextInt(max);
  }
}
