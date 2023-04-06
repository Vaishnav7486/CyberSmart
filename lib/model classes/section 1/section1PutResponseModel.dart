// To parse this JSON data, do
//
//     final section1PutResponseModel = section1PutResponseModelFromJson(jsonString);

import 'dart:convert';

Section1PutResponseModel section1PutResponseModelFromJson(String str) => Section1PutResponseModel.fromJson(json.decode(str));

String section1PutResponseModelToJson(Section1PutResponseModel data) => json.encode(data.toJson());

class Section1PutResponseModel {
    Section1PutResponseModel({
        required this.message,
    });

    String message;

    factory Section1PutResponseModel.fromJson(Map<String, dynamic> json) => Section1PutResponseModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
