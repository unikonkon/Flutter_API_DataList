class Data {
  final int? userId;
  final int id;
  final String title;
  final String url;

  Data({
    required this.userId,
    required this.id,
    required this.title,
    required this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
    );
  }
}
