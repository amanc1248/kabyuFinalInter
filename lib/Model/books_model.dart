class Books {
  final String image;
  final String title;
  final String price;

  Books({this.image, this.title, this.price});
}

List<Books> getPopularBooks() {
  List<Books> popularBooks = [];

  Books book1 = Books(
      image:
          'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1086&q=80',
      title: 'How Innovation Works',
      price: 'Npr 120');
  Books book2 = Books(
      image:
          'https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg',
      title: 'I am watching you',
      price: 'Npr 220');
  popularBooks.add(book1);
  popularBooks.add(book2);
  return popularBooks;
}

List<Books> getWishlistBooks() {
  List<Books> wishListBooks = [];

  Books book1 = Books(
      image:
          'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1086&q=80',
      title: 'How Innovation Works wishlist',
      price: 'Npr 120');
  Books book2 = Books(
      image:
          'https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg',
      title: 'I am watching you',
      price: 'Npr 220');
  wishListBooks.add(book1);
  wishListBooks.add(book2);
  return wishListBooks;
}

List<Books> getBooksBasedCategory() {
  List<Books> booksBasedCategory = [];

  Books book1 = Books(
      image:
          'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1086&q=80',
      title: 'How Innovation Works',
      price: 'Npr 120');
  Books book2 = Books(
      image:
          'https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg',
      title: 'I am watching you',
      price: 'Npr 220');
  Books book3 = Books(
      image:
          'https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg',
      title: 'I am watching you',
      price: 'Npr 220');
  Books book4 = Books(
      image:
          'https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg',
      title: 'I am watching you',
      price: 'Npr 220');
  Books book5 = Books(
      image:
          'https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg',
      title: 'I am watching you',
      price: 'Npr 220');
  Books book6 = Books(
      image:
          'https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg',
      title: 'I am watching you',
      price: 'Npr 220');
  Books book7 = Books(
      image:
          'https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg',
      title: 'I am watching you',
      price: 'Npr 220');
  Books book8 = Books(
      image:
          'https://m.media-amazon.com/images/G/01/prime/primeinsider2/prnewesttitles/nov18/watching_you._CB480611966_.jpg',
      title: 'I am watching you',
      price: 'Npr 220');
  booksBasedCategory.add(book1);
  booksBasedCategory.add(book2);
  booksBasedCategory.add(book3);
  booksBasedCategory.add(book4);
  booksBasedCategory.add(book5);
  booksBasedCategory.add(book6);
  booksBasedCategory.add(book7);
  booksBasedCategory.add(book8);
  return booksBasedCategory;
}
