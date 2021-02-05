import 'dart:collection';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kabyu_feather_webs/Model/category_model.dart';

import 'package:kabyu_feather_webs/Model/product.dart';
import 'package:kabyu_feather_webs/services/database.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productList = [];
  UnmodifiableListView<Product> get productList =>
      UnmodifiableListView(_productList);
  set productList(List<Product> productList) {
    _productList = productList;
    notifyListeners();
  }

  loadProducts() async {
    List<Product> product = await getProduct();
    _productList = product;
    notifyListeners();
  }

  Product _currentProduct;
  Product get currentProduct => _currentProduct;
  set currentProduct(Product product) {
    _currentProduct = product;
    notifyListeners();
  }

  int _bookIndexForChat;
  int get bookIndexForChat => _bookIndexForChat;
  set bookIndexForChat(int val) {
    _bookIndexForChat = val;
    notifyListeners();
  }
}

class AddProductsProvider with ChangeNotifier {
  File _image;
  File get image => _image;

  set image(File image) {
    _image = image;
    notifyListeners();
  }

  String _imageFileName;
  String get imageFileName => _imageFileName;
  set imageFileName(String imageFileName) {
    _imageFileName = imageFileName;
    notifyListeners();
  }

  bool _toggleContact;
  bool get toggleContact => _toggleContact;

  set toggleContact(bool toggleContact) {
    _toggleContact = toggleContact;
    notifyListeners();
  }
}

class WishlistProvider with ChangeNotifier {
  List<Product> _wishlistproductList = [];
  Product _wishlistcurrentProduct;

  UnmodifiableListView<Product> get wishlistproductList =>
      UnmodifiableListView(_wishlistproductList);

  Product get currentWishlist => _wishlistcurrentProduct;
  set wishlistproductList(List<Product> productList) {
    _wishlistproductList = productList;
    notifyListeners();
  }

  set currentWishlist(Product product) {
    _wishlistcurrentProduct = product;
    notifyListeners();
  }

  loadwishList() async {
    List<Product> wishlist = await getWishlist();
    _wishlistproductList = wishlist;
    notifyListeners();
  }
}

class MyBooksProvider with ChangeNotifier {
  List<Product> _myBooksList = [];
  UnmodifiableListView<Product> get myBooksList =>
      UnmodifiableListView(_myBooksList);
  set myBooksList(List<Product> bookList) {
    _myBooksList = bookList;
    notifyListeners();
  }

  loadMyBooksList() async {
    List<Product> bookList = await getMyBooksList();
    _myBooksList = bookList;
    notifyListeners();
  }

  Product _myCurrentBook;
  Product get myCurrentBook => _myCurrentBook;
  set myCurrentBook(Product product) {
    _myCurrentBook = product;
    notifyListeners();
  }
}

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categoryList = [];
  CategoryModel _currentCategoryList;

  UnmodifiableListView<CategoryModel> get categoryList =>
      UnmodifiableListView(_categoryList);

  CategoryModel get currentCategory => _currentCategoryList;
  set categoryList(List<CategoryModel> categoryList) {
    _categoryList = categoryList;
    notifyListeners();
  }

  set currentCategoryList(CategoryModel category) {
    _currentCategoryList = category;
    notifyListeners();
  }

  loadCategoryList() async {
    List<CategoryModel> category = await getCategory();
    _categoryList = category;
    notifyListeners();
  }
}
