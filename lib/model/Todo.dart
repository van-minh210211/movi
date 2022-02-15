class Todo {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Todo({required this.postId, required this.id, required this.name, required this.email, required this.body});

   factory Todo.fromJson(Map<String, dynamic> json) =>Todo (
    postId : json['postId'],
    id : json['id'],
    name : json['name'],
    email : json['email'],
    body : json['body'],
   );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}