class CategoryData {
  String? id;
  String? title;
  String? description;

  CategoryData();

  CategoryData.fromJson(Map<String, dynamic> json , [String? docId]) {
    id = docId;
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
