import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class InnModel {
  String? Name;
  String? Description;
  String? Media;
  String? Location;
  String? Comments;
  double? Rate;
  String? Catigorie;
  String? MoreInfo;
  InnModel({
    this.Name,
    this.Description,
    this.Media,
    this.Location,
    this.Comments,
    this.Rate,
    this.Catigorie,
    this.MoreInfo,
  });

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

  factory InnModel.fromMap(Map<String, dynamic> map) {
    return InnModel(
      Name: map['Name'] != null ? map['Name'] as String : null,
      Description:
          map['Description'] != null ? map['Description'] as String : null,
      Media: map['Media'] != null ? map['Media'] as String : null,
      Location: map['Location'] != null ? map['Location'] as String : null,
      Comments: map['Comments'] != null ? map['Comments'] as String : null,
      Rate: map['Rate'] != null ? map['Rate'] as double : null,
      Catigorie: map['Catigorie'] != null ? map['Catigorie'] as String : null,
      MoreInfo: map['MoreInfo'] != null ? map['MoreInfo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InnModel.fromJson(String source) =>
      InnModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
