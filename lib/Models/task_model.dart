class Tasks {
  String? id;
  String? title;
  String? description;
  bool? isDone;

  Tasks({this.id, this.title, this.description, this.isDone});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isDone = json['is_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['is_done'] = isDone;
    return data;
  }
}
