import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class VisitorEntity extends Equatable{

  final String id;
  final String name;
  final String mobile;
  final String email;
  final String imageUrl;

  VisitorEntity(this.id, this.name, this.mobile, this.email, this.imageUrl);

  @override
  toString(){
    return 'VisitorEntity{name : $name , mobile : $mobile , email : $email , imageUrl : $imageUrl }';
  }

  Map<String, Object> toJson(){
    return {
      'id' : id,
      'name' : name,
      'mobile' : mobile,
      'email' : email,
      'imageUrl' : imageUrl
    };
  }

  static VisitorEntity fromJson(Map<String, Object> json){
    return VisitorEntity(
      json['id'] as String,
      json['name'] as String,
      json['mobile'] as String,
      json['email'] as String,
      json['imageUrl'] as String
    );
  }

  static VisitorEntity fromSnapshot(DocumentSnapshot snapshot){
    return VisitorEntity(
        snapshot.documentID as String,
        snapshot.data['name'] as String,
        snapshot.data['mobile'] as String,
        snapshot.data['email'] as String,
        snapshot.data['imageUrl'] as String
    );
  }

  Map<String,Object> toDocument(){
    return {
      'name' : name,
      'mobile' : mobile,
      'email' : email,
      'imageUrl' : imageUrl
    };
  }
}