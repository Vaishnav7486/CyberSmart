// To parse this JSON data, do
//
//     final imageClascv = imageClascvFromJson(jsonString);

import 'dart:convert';

List<ImageClascv> imageClascvFromJson(String str) => List<ImageClascv>.from(json.decode(str).map((x) => ImageClascv.fromJson(x)));

String imageClascvToJson(List<ImageClascv> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageClascv {
    ImageClascv({
        required this.details,
        required this.id,
    });

    Details details;
    int id;

    factory ImageClascv.fromJson(Map<String, dynamic> json) => ImageClascv(
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
