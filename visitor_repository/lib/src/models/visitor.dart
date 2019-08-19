import 'package:meta/meta.dart';

import '../entities/visitor_entity.dart';

@immutable
class Visitor {
  final String id;
  final String name;
  final String mobile;
  final String email;
  final String host;
  final String purpose;
  final String checkIn;
  final String checkOut;
  final String date;

  Visitor(this.mobile,
      {String id,
      String name,
      String email,
      String host,
      String purpose,
      String checkIn,
      String checkOut,
      String date})
      : this.name = name ?? "",
        this.email = email ?? "",
        this.host = host ?? "",
        this.purpose = purpose ?? "",
        this.checkIn = checkIn ?? "",
        this.checkOut = checkOut ?? "",
        this.date = date ?? "",
        this.id = id;

  Visitor copyWith(
      {String id,
      String name,
      String mobile,
      String email,
      String host,
      String purpose,
      String checkIn,
      String checkOut,
      String date}) {
    return Visitor(mobile ?? this.mobile,
        name: name,
        email: email,
        host: host,
        purpose: purpose,
        checkIn: checkIn,
        checkOut: checkOut,
        date: date);
  }

  VisitorEntity toEntity(){
    return VisitorEntity(id, name, mobile, email, host, purpose, checkIn, checkOut, date);
  }

  static Visitor fromEntity(VisitorEntity visitorEntity){
    return Visitor(visitorEntity.mobile,
    id: visitorEntity.id,
    name: visitorEntity.name,
    email: visitorEntity.email,
    host: visitorEntity.host,
    purpose: visitorEntity.purpose,
    checkOut: visitorEntity.checkOut,
    checkIn: visitorEntity.checkIn,
    date: visitorEntity.date);
  }

  @override
  // TODO: implement hashCode
  int get hashCode =>
      mobile.hashCode ^
      name.hashCode ^
      email.hashCode ^
      id.hashCode ^
      host.hashCode ^
      purpose.hashCode ^
      checkIn.hashCode ^
      checkOut.hashCode ^
      date.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Visitor &&
          runtimeType == other.runtimeType &&
          mobile == other.mobile &&
          name == other.name &&
          email == other.email &&
          id == other.id &&
          host == other.host &&
          purpose == other.purpose &&
          checkIn == other.checkIn &&
          checkOut == other.checkOut &&
          date == other.date;
}
