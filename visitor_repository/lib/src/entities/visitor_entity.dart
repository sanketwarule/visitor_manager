import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class VisitorEntity extends Equatable{

  final String id;
  final String name;
  final String mobile;
  final String email;
  final String host;
  final String purpose;
  final String checkIn;
  final String checkOut;
  final String date;

  VisitorEntity(this.id, this.name, this.mobile, this.email, this.host, this.purpose, this.checkIn, this.checkOut, this.date);

  @override
  toString(){
    return 'VisitorEntity{name : $name , mobile : $mobile , email : $email , host : $host , purpose : $purpose , check in : $checkIn , check out : $checkOut , date : $date}';
  }

  Map<String, Object> toJson(){
    return {
      'id' : id,
      'name' : name,
      'mobile' : mobile,
      'email' : email,
      'host' : host,
      'purpose' : purpose,
      'checkIn' : checkIn,
      'checkOut' : checkOut,
      'date' : date
    };
  }

  static VisitorEntity fromJson(Map<String, Object> json){
    return VisitorEntity(
      json['id'] as String,
      json['name'] as String,
      json['mobile'] as String,
      json['email'] as String,
      json['host'] as String,
      json['purpose'] as String,
      json['checkIn'] as String,
      json['checkOut'] as String,
      json['date'] as String
    );
  }

  static VisitorEntity fromSnapshot(DocumentSnapshot snapshot){
    return VisitorEntity(
        snapshot.documentID as String,
        snapshot.data['name'] as String,
        snapshot.data['mobile'] as String,
        snapshot.data['email'] as String,
        snapshot.data['host'] as String,
        snapshot.data['purpose'] as String,
        snapshot.data['checkIn'] as String,
        snapshot.data['checkOut'] as String,
        snapshot.data['date'] as String
    );
  }

  Map<String,Object> toDocument(){
    return {
      'name' : name,
      'mobile' : mobile,
      'email' : email,
      'host' : host,
      'purpose' : purpose,
      'checkIn' : checkIn,
      'checkOut' : checkOut,
      'date' : date
    };
  }
}