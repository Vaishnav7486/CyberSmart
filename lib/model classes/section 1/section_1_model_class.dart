// // To parse this JSON data, do
// //
// //     final section1Modelsample1 = section1Modelsample1FromJson(jsonString);

// import 'dart:convert';

// class Section1Modelsample1 {
//     Section1Modelsample1({
//         required this.projectId,
//         required this.checkId,
//         required this.presurveyInfo,
//     });

//     String projectId;
//     String checkId;
//     List<PresurveyInfo> presurveyInfo;

//     factory Section1Modelsample1.fromRawJson(String str) => Section1Modelsample1.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Section1Modelsample1.fromJson(Map<String, dynamic> json) => Section1Modelsample1(
//         projectId: json["project_id"],
//         checkId: json["check_id"],
//         presurveyInfo: List<PresurveyInfo>.from(json["presurvey_info"].map((x) => PresurveyInfo.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "project_id": projectId,
//         "check_id": checkId,
//         "presurvey_info": List<dynamic>.from(presurveyInfo.map((x) => x.toJson())),
//     };
// }

// class PresurveyInfo {
//     PresurveyInfo({
//         required this.registryRequirements,
//     });

//     List<RegistryRequirement> registryRequirements;

//     factory PresurveyInfo.fromRawJson(String str) => PresurveyInfo.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory PresurveyInfo.fromJson(Map<String, dynamic> json) => PresurveyInfo(
//         registryRequirements: List<RegistryRequirement>.from(json["registry_requirements"].map((x) => RegistryRequirement.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "registry_requirements": List<dynamic>.from(registryRequirements.map((x) => x.toJson())),
//     };
// }

// class RegistryRequirement {
//     RegistryRequirement({
//         required this.id,
//         required this.details,
//     });

//     String id;
//     RegistryRequirementDetails details;

//     factory RegistryRequirement.fromRawJson(String str) => RegistryRequirement.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory RegistryRequirement.fromJson(Map<String, dynamic> json) => RegistryRequirement(
//         id: json["id"],
//         details: RegistryRequirementDetails.fromJson(json["details"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "details": details.toJson(),
//     };
// }

// class RegistryRequirementDetails {
//     RegistryRequirementDetails({
//         required this.no,
//         required this.name,
//         required this.valid,
//         required this.issueDate,
//         required this.expiryDate,
//         required this.lastSurveyDate,
//         required this.nextSurveyDate,
//         required this.remarks,
//         required this.globalRemarks,
//         required this.globalAttachments,
//         required this.attachments,
//         this.lastNotice,
//     });

//     String no;
//     String name;
//     String? valid;
//     String issueDate;
//     String expiryDate;
//     String lastSurveyDate;
//     String nextSurveyDate;
//     String remarks;
//     dynamic globalRemarks;
//     bool globalAttachments;
//     List<Attachment> attachments;
//     String? lastNotice;

//     factory RegistryRequirementDetails.fromRawJson(String str) => RegistryRequirementDetails.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory RegistryRequirementDetails.fromJson(Map<String, dynamic> json) => RegistryRequirementDetails(
//         no: json["no"],
//         name: json["name"],
//         valid: json["valid"],
//         issueDate: json["issue_date"],
//         expiryDate: json["expiry_date"],
//         lastSurveyDate: json["last_survey_date"],
//         nextSurveyDate: json["next_survey_date"],
//         remarks: json["remarks"],
//         globalRemarks: json["globalRemarks"],
//         globalAttachments: json["globalAttachments"],
//         attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
//         lastNotice: json["last_notice"],
//     );

//     Map<String, dynamic> toJson() => {
//         "no": no,
//         "name": name,
//         "valid": valid,
//         "issue_date": issueDate,
//         "expiry_date": expiryDate,
//         "last_survey_date": lastSurveyDate,
//         "next_survey_date": nextSurveyDate,
//         "remarks": remarks,
//         "globalRemarks": globalRemarks,
//         "globalAttachments": globalAttachments,
//         "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
//         "last_notice": lastNotice,
//     };
// }

// class Attachment {
//     Attachment({
//         required this.id,
//         required this.details,
//     });

//     String id;
//     AttachmentDetails details;

//     factory Attachment.fromRawJson(String str) => Attachment.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
//         id: json["id"],
//         details: AttachmentDetails.fromJson(json["details"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "details": details.toJson(),
//     };
// }

// class AttachmentDetails {
//     AttachmentDetails({
//         required this.filename,
//         required this.filetype,
//         required this.remarkofFile,
//         required this.globalAttachments,
//     });

//     String filename;
//     String filetype;
//     String remarkofFile;
//     String globalAttachments;

//     factory AttachmentDetails.fromRawJson(String str) => AttachmentDetails.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory AttachmentDetails.fromJson(Map<String, dynamic> json) => AttachmentDetails(
//         filename: json["filename"],
//         filetype: json["filetype"],
//         remarkofFile: json["RemarkofFile"],
//         globalAttachments: json["globalAttachments"],
//     );

//     Map<String, dynamic> toJson() => {
//         "filename": filename,
//         "filetype": filetype,
//         "RemarkofFile": remarkofFile,
//         "globalAttachments": globalAttachments,
//     };
// }

// class GlobalRemark {
//     GlobalRemark({
//         required this.id,
//         required this.details,
//     });

//     String id;
//     GlobalRemarkDetails details;

//     factory GlobalRemark.fromRawJson(String str) => GlobalRemark.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory GlobalRemark.fromJson(Map<String, dynamic> json) => GlobalRemark(
//         id: json["id"],
//         details: GlobalRemarkDetails.fromJson(json["details"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "details": details.toJson(),
//     };
// }

// class GlobalRemarkDetails {
//     GlobalRemarkDetails({
//         required this.remark,
//         required this.sectionId,
//         required this.pointId,
//     });

//     String remark;
//     String sectionId;
//     String pointId;

//     factory GlobalRemarkDetails.fromRawJson(String str) => GlobalRemarkDetails.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory GlobalRemarkDetails.fromJson(Map<String, dynamic> json) => GlobalRemarkDetails(
//         remark: json["Remark"],
//         sectionId: json["SectionId"],
//         pointId: json["PointId"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Remark": remark,
//         "SectionId": sectionId,
//         "PointId": pointId,
//     };
// }

// To parse this JSON data, do
//
//     final section1Modelsample1 = section1Modelsample1FromJson(jsonString);
// To parse this JSON data, do
//
//     final section1Modelsample1 = section1Modelsample1FromJson(jsonString);
// To parse this JSON data, do
//
//     final section1Modelsampe1 = section1Modelsampe1FromJson(jsonString);
// To parse this JSON data, do
//
//     final section1Modelsample1 = section1Modelsample1FromJson(jsonString);
// To parse this JSON data, do
//
//     final section1Modelsample1 = section1Modelsample1FromJson(jsonString);
// To parse this JSON data, do
//
//     final section1Modelsample1 = section1Modelsample1FromJson(jsonString);


// To parse this JSON data, do
//
//     final section1Modelsample1 = section1Modelsample1FromJson(jsonString);

import 'dart:convert';

Section1Modelsample1 section1Modelsample1FromJson(String str) => Section1Modelsample1.fromJson(json.decode(str));

String section1Modelsample1ToJson(Section1Modelsample1 data) => json.encode(data.toJson());

class Section1Modelsample1 {
    Section1Modelsample1({
        required this.projectId,
        required this.checkId,
        required this.presurveyInfo,
    });

    String projectId;
    String checkId;
    List<PresurveyInfo> presurveyInfo;

    factory Section1Modelsample1.fromJson(Map<String, dynamic> json) => Section1Modelsample1(
        projectId: json["project_id"],
        checkId: json["check_id"],
        presurveyInfo: List<PresurveyInfo>.from(json["presurvey_info"].map((x) => PresurveyInfo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "check_id": checkId,
        "presurvey_info": List<dynamic>.from(presurveyInfo.map((x) => x.toJson())),
    };
}

class PresurveyInfo {
    PresurveyInfo({
        required this.registryRequirements,
    });

    List<RegistryRequirement> registryRequirements;

    factory PresurveyInfo.fromJson(Map<String, dynamic> json) => PresurveyInfo(
        registryRequirements: List<RegistryRequirement>.from(json["registry_requirements"].map((x) => RegistryRequirement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "registry_requirements": List<dynamic>.from(registryRequirements.map((x) => x.toJson())),
    };
}

class RegistryRequirement {
    RegistryRequirement({
        required this.details,
        required this.id,
    });

    RegistryRequirementDetails details;
    String id;

    factory RegistryRequirement.fromJson(Map<String, dynamic> json) => RegistryRequirement(
        details: RegistryRequirementDetails.fromJson(json["details"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "id": id,
    };
}

class RegistryRequirementDetails {
    RegistryRequirementDetails({
        required this.no,
        required this.attachments,
        required this.expiryDate,
        required this.nextSurveyDate,
        required this.globalAttachments,
        required this.lastSurveyDate,
        required this.valid,
        required this.globalRemarks,
        required this.issueDate,
        required this.completed,
        required this.name,
        required this.remarks,
        this.lastNotice,
    });

    String no;
    List<Attachment> attachments;
    String expiryDate;
    String nextSurveyDate;
    bool globalAttachments;
    String lastSurveyDate;
    String? valid;
    bool globalRemarks;
    String issueDate;
    String completed;
    String name;
    String remarks;
    String? lastNotice;

    factory RegistryRequirementDetails.fromJson(Map<String, dynamic> json) => RegistryRequirementDetails(
        no: json["no"],
        attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
        expiryDate: json["expiry_date"],
        nextSurveyDate: json["next_survey_date"],
        globalAttachments: json["globalAttachments"],
        lastSurveyDate: json["last_survey_date"],
        valid: json["valid"],
        globalRemarks: json["globalRemarks"],
        issueDate: json["issue_date"],
        completed: json["completed"],
        name: json["name"],
        remarks: json["remarks"],
        lastNotice: json["last_notice"],
    );

    Map<String, dynamic> toJson() => {
        "no": no,
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "expiry_date": expiryDate,
        "next_survey_date": nextSurveyDate,
        "globalAttachments": globalAttachments,
        "last_survey_date": lastSurveyDate,
        "valid": valid,
        "globalRemarks": globalRemarks,
        "issue_date": issueDate,
        "completed": completed,
        "name": name,
        "remarks": remarks,
        "last_notice": lastNotice,
    };
}

class Attachment {
    Attachment({
        required this.details,
        required this.id,
    });

    AttachmentDetails details;
    int id;

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        details: AttachmentDetails.fromJson(json["details"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "id": id,
    };
}

class AttachmentDetails {
    AttachmentDetails({
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

    factory AttachmentDetails.fromJson(Map<String, dynamic> json) => AttachmentDetails(
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
