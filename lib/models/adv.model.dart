class Adv {
  String? id;
  String? url;
  String? description;

  Adv();

  Adv.fromJson(Map<String, dynamic> json , String docId) {
    id = docId;
    url = json['url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['url'] = url;
    data['description'] = description;
    return data;
  }
}
