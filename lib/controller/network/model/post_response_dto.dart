import 'package:logique/model/post_model.dart';

class PostResponseDto {
  List<Post>? data;
  int? total;
  int? page;
  int? limit;

  PostResponseDto({this.data, this.total, this.page, this.limit});

  PostResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Post>[];
      json['data'].forEach((v) {
        data!.add(Post.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    return data;
  }
}


