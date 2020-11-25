class AllTextFields {
  final String title;
  var text;
  final String validations;

  AllTextFields({this.title, this.text, this.validations});
}

List<AllTextFields> getProfileTextFields() {
  List<AllTextFields> field = [];
  AllTextFields field1 = AllTextFields(title: "Science", validations: "Empty");
  AllTextFields field2 = AllTextFields(title: "Psychlog", validations: "Empty");
  AllTextFields field3 = AllTextFields(title: "Thriller", validations: "Empty");
  AllTextFields field4 = AllTextFields(title: "Drama", validations: "Empty");
  AllTextFields field5 = AllTextFields(title: "Romance", validations: "Empty");
  AllTextFields field6 = AllTextFields(title: "More ", validations: "Empty");
  field.add(field1);
  field.add(field2);
  field.add(field3);
  field.add(field4);
  field.add(field5);
  field.add(field6);
  return field;
}
