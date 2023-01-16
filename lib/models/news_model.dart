class NewsModel {
  // final String id;
  final String tag;
  final String title;
  final String description;
  final String imgurl;
  final String date;

  // final String status;

  NewsModel({
    // required this.id,
    required this.tag,
    required this.title,
    required this.description,
    required this.imgurl,
    required this.date,
    // required this.status
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      // 'id': id,
      'tag': tag,
      'description': description,
      'imgurl': imgurl,
      'title': title,
      'date': date,
      // 'status': status,
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> map) {
    return NewsModel(
      // id: map['id'] as String,
      description: map['description'] as String,
      title: map['title'] as String,
      imgurl: map['imgurl'] as String,
      tag: map['tag'] as String,
      date: map['date'] as String,
      // status: map['status'] as String,
    );
  }
}
