// class TagsCategory {
//   /// Mocks fetching language from network API with delay of 500ms.
//   static Future<List<Category>> getLanguages(String query) async {
//     await Future.delayed(Duration(milliseconds: 500), null);
//     return <Category>[
//       Category(name: 'JavaScript', position: 1),
//       Category(name: 'Python', position: 2),
//       Category(name: 'Java', position: 3),
//       Category(name: 'PHP', position: 4),
//       Category(name: 'C#', position: 5),
//       Category(name: 'C++', position: 6),
//     ]
//         .where((lang) => lang.name.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }
// }

// /// Language Class
// class Category extends Taggable {
//   ///
//   final String name;

//   ///
//   final int position;

//   /// Creates Language
//   Category({
//     this.name,
//     this.position,
//   });

//   @override
//   List<Object> get props => [name];

//   /// Converts the class to json string.
//   String toJson() => '''  {
//     "name": $name,\n
//     "position": $position\n
//   }''';
// }
