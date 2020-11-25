class CategoryModel {
  final int id;
  final String title;

  CategoryModel({this.id, this.title});
}

List<CategoryModel> getCategory() {
  List<CategoryModel> category = [];
  CategoryModel cat1 = CategoryModel(id: 1, title: "Science");
  CategoryModel cat2 = CategoryModel(id: 2, title: "Psychlog");
  CategoryModel cat3 = CategoryModel(id: 3, title: "Thriller");
  CategoryModel cat4 = CategoryModel(id: 4, title: "Drama");
  CategoryModel cat5 = CategoryModel(id: 5, title: "Romance");
  CategoryModel cat6 = CategoryModel(id: 6, title: "More ");
  category.add(cat1);
  category.add(cat2);
  category.add(cat3);
  category.add(cat4);
  category.add(cat5);
  category.add(cat6);
  return category;
}
