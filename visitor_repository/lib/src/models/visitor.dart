import 'package:meta/meta.dart';

import '../entities/visitor_entity.dart';

@immutable
class Visitor {
  final String id;
  final String name;
  final String mobile;
  final String email;
  final String imageUrl;

  Visitor(this.mobile,
      {String id,
      String name,
      String email,
        String imageUrl
      })
      : this.name = name ?? "",
        this.email = email ?? "",
        this.imageUrl = imageUrl ?? "",
        this.id = id;

  Visitor copyWith(
      {String id,
      String name,
      String mobile,
      String email,
      String imageUrl}) {
    return Visitor(mobile ?? this.mobile,
        name: name,
        email: email,
        imageUrl: imageUrl);
  }

  VisitorEntity toEntity(){
    return VisitorEntity(id, name, mobile, email, imageUrl);
  }

  static Visitor fromEntity(VisitorEntity visitorEntity){
    return Visitor(visitorEntity.mobile,
    id: visitorEntity.id,
    name: visitorEntity.name,
    email: visitorEntity.email,
    imageUrl: visitorEntity.imageUrl);
  }

  @override
  // TODO: implement hashCode
  int get hashCode =>
      mobile.hashCode ^
      name.hashCode ^
      email.hashCode ^
      id.hashCode ^
      imageUrl.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Visitor &&
          runtimeType == other.runtimeType &&
          mobile == other.mobile &&
          name == other.name &&
          email == other.email &&
          id == other.id &&
          imageUrl == other.imageUrl;
}
