class todo2 {
  int userId;
  int id;
  String title;
  String body;

  todo2({required this.userId, required this.id, required this.title, required this.body});

   factory todo2.fromJson(Map<String, dynamic> json) =>todo2 (
    userId : json['userId'],
    id : json['id'],
    title : json['title'],
    body : json['body'],
   );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}