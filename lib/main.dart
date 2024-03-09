import 'package:flutter/material.dart';
import 'package:random_quote/favQuote.dart';
import 'package:random_quote/randomqoutes.dart';
import 'package:share/share.dart';

void main() {
  runApp(RamdomQuoteGenerator());
}

class RamdomQuoteGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuotePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

RandomQuote randomQuotes = RandomQuote();

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  void _shareQuote(String quote, String author) {
    Share.share('$quote\n\n- $author');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quote Of The Day',
          style: TextStyle(
            fontFamily: "Source Sans Pro",
            fontSize: 33,
          ),
        ),
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoriteQuotesPage(randomQuotes: randomQuotes),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              _shareQuote(
                  randomQuotes.getQuoteText(), randomQuotes.getQuoteAuthor());
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  randomQuotes.getQuoteText(),
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Source Sans Pro",
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  randomQuotes.getQuoteAuthor(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Satisfy",
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        randomQuotes.addToFavorites();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade900,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "Add to Favorites",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        randomQuotes.nextQuote();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade900,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "Refresh",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
