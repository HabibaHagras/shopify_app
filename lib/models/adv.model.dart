class Adv {
  String? id;
  String? url;
  String? description;

  Adv();

  Adv.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = url;
    data['description'] = description;
    return data;
  }
}
