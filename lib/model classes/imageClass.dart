// To parse this JSON data, do
//
//     final imageClassv1 = imageClassv1FromJson(jsonString);

import 'dart:convert';

ImageClassv1 imageClassv1FromJson(String str) => ImageClassv1.fromJson(json.decode(str));

String imageClassv1ToJson(ImageClassv1 data) => json.encode(data.toJson());

class ImageClassv1 {
    ImageClassv1({
        required this.details,
        required this.id,
    });

    Details details;
    int id;

    factory ImageClassv1.fromJson(Map<String, dynamic> json) => ImageClassv1(
        details: Details.fromJson(json["details"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "id": id,
    };
}

class Details {
    Details({
        required this.filename,
        required this.filetype,
        required this.globalAttachments,
        required this.name,
        required this.pointId,
        required this.remarkofFile,
        required this.sectionId,
    });

    String filename;
    String filetype;
    bool globalAttachments;
    String name;
    String pointId;
    String remarkofFile;
    String sectionId;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        filename: json["filename"],
        filetype: json["filetype"],
        globalAttachments: json["globalAttachments"],
        name: json["name"],
        pointId: json["PointId"],
        remarkofFile: json["RemarkofFile"],
        sectionId: json["SectionId"],
    );

    Map<String, dynamic> toJson() => {
        "filename": filename,
        "filetype": filetype,
        "globalAttachments": globalAttachments,
        "name": name,
        "PointId": pointId,
        "RemarkofFile": remarkofFile,
        "SectionId": sectionId,
    };
}
