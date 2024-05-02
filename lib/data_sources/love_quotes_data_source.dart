class LoveQuotesDataSource {
  Future<List<Map<String, dynamic>>?> getLoveQuotes() async {
    final results = [
      {
        'id': 1,
        'category': 'love',
        'content':
            "In all the world, there is no heart for me like yours. In all the world, there is no love for you like mine. (Maya Angelou)",
      },
      {
        'id': 2,
        'content': "I hope it’s okay if I love you forever. (Ally Maine)",
      },
      {
        'id': 3,
        'content':
            "Nobody has ever measured, even poets, how much a heart can hold. (Zelda Fitzgerald)",
      },
      {
        'id': 4,
        'content':
            "For it was not into my ear you whispered, but into my heart. It was not my lips you kissed, but my soul. (Judy Garland)",
      },
      {
        'id': 5,
        'content':
            "Love makes your soul crawl out from its hiding place. (Zora Neale Hurston)",
      },
      {
        'id': 6,
        'content':
            "If I had a flower for every time I thought of you...I could walk through my garden forever. (Alfred Tennyson)",
      },
      {
        'id': 7,
        'content':
            "If you remember me, then I don’t care if everyone else forgets. (Haruki Murakami)",
      },
      {
        'id': 8,
        'content':
            "If you find someone you love in your life, then hang on to that love. (Princess Diana)",
      },
      {
        'id': 9,
        'content':
            "Love has nothing to do with what you are expecting to get–only with what you are expecting to give–which is everything. (Katharine Hepburn)",
      },
      {
        'id': 10,
        'content': "Where there is love there is life. (Mahatma Gandhi)",
      },
      {
        'id': 11,
        'content':
            "Have enough courage to trust love one more time and always one more time. (Maya Angelou)",
      },
    ];

    //final results = LoadFile('quotes/quotes.json') as List<Map<String,dynamic>>;

    final filteredResults =
        results.where((quote) => quote['category'] == 'love');

    return results;
  }
}
