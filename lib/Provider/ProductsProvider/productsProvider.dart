import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:kabyu_feather_webs/Model/category_model.dart';
import 'package:kabyu_feather_webs/Model/product.dart';
import 'package:kabyu_feather_webs/services/database.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productList = [];
  Product _currentProduct;

  UnmodifiableListView<Product> get productList =>
      UnmodifiableListView(_productList);

  Product get currentProduct => _currentProduct;
  set productList(List<Product> productList) {
    _productList = productList;
    notifyListeners();
  }

  set currentProduct(Product product) {
    _currentProduct = product;
    notifyListeners();
  }

  loadProducts() async {
    List<Product> product = await getProduct();
    _productList = product;
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
