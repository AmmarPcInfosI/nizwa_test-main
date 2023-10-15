// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AttractionsModel {
  String? Name;
  String? Description;
  String? Media;
  String? Location;
  String? Comments;
  double? Rate;
  String? Catigorie;
  String? MoreInfo;

  AttractionsModel(
    this.Name,
    this.Media,
    this.Description,
    this.Catigorie,
    this.Comments,
    this.Rate,
    this.Location,
    this.MoreInfo,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Name': Name,
      'Description': Description,
      'Media': Media,
      'Location': Location,
      'Comments': Comments,
      'Rate': Rate,
      'Catigorie': Catigorie,
      'MoreInfo': MoreInfo,
    };
  }

  factory AttractionsModel.fromMap(Map<String, dynamic> map) {
    return AttractionsModel(
      map['Name'] != null ? map['Name'] as String : null,
      map['Description'] != null ? map['Description'] as String : null,
      map['Media'] != null ? map['Media'] as String : null,
      map['Location'] != null ? map['Location'] as String : null,
      map['Comments'] != null ? map['Comments'] as String : null,
      map['Rate'] != null ? map['Rate'] as double : null,
      map['Catigorie'] != null ? map['Catigorie'] as String : null,
      map['MoreInfo'] != null ? map['MoreInfo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttractionsModel.fromJson(String source) =>
      AttractionsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
