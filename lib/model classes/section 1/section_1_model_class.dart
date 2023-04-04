// To parse this JSON data, do
//
//     final section1Modelsample1 = section1Modelsample1FromJson(jsonString);

import 'dart:convert';

class Section1Modelsample1 {
    Section1Modelsample1({
        required this.projectId,
        required this.checkId,
        required this.presurveyInfo,
    });

    String projectId;
    String checkId;
    List<PresurveyInfo> presurveyInfo;

    factory Section1Modelsample1.fromRawJson(String str) => Section1Modelsample1.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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

    factory PresurveyInfo.fromRawJson(String str) => PresurveyInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PresurveyInfo.fromJson(Map<String, dynamic> json) => PresurveyInfo(
        registryRequirements: List<RegistryRequirement>.from(json["registry_requirements"].map((x) => RegistryRequirement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "registry_requirements": List<dynamic>.from(registryRequirements.map((x) => x.toJson())),
    };
}

class RegistryRequirement {
    RegistryRequirement({
        required this.id,
        required this.details,
    });

    String id;
    RegistryRequirementDetails details;

    factory RegistryRequirement.fromRawJson(String str) => RegistryRequirement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RegistryRequirement.fromJson(Map<String, dynamic> json) => RegistryRequirement(
        id: json["id"],
        details: RegistryRequirementDetails.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "details": details.toJson(),
    };
}

class RegistryRequirementDetails {
    RegistryRequirementDetails({
        required this.no,
        required this.name,
        required this.valid,
        required this.issueDate,
        required this.expiryDate,
        required this.lastSurveyDate,
        required this.nextSurveyDate,
        required this.remarks,
        required this.globalRemarks,
        required this.globalAttachments,
        required this.attachments,
        this.lastNotice,
    });

    String no;
    String name;
    String valid;
    String issueDate;
    String expiryDate;
    String lastSurveyDate;
    String nextSurveyDate;
    String remarks;
    dynamic globalRemarks;
    bool globalAttachments;
    List<Attachment> attachments;
    String? lastNotice;

    factory RegistryRequirementDetails.fromRawJson(String str) => RegistryRequirementDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RegistryRequirementDetails.fromJson(Map<String, dynamic> json) => RegistryRequirementDetails(
        no: json["no"],
        name: json["name"],
        valid: json["valid"],
        issueDate: json["issue_date"],
        expiryDate: json["expiry_date"],
        lastSurveyDate: json["last_survey_date"],
        nextSurveyDate: json["next_survey_date"],
        remarks: json["remarks"],
        globalRemarks: json["globalRemarks"],
        globalAttachments: json["globalAttachments"],
        attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
        lastNotice: json["last_notice"],
    );

    Map<String, dynamic> toJson() => {
        "no": no,
        "name": name,
        "valid": valid,
        "issue_date": issueDate,
        "expiry_date": expiryDate,
        "last_survey_date": lastSurveyDate,
        "next_survey_date": nextSurveyDate,
        "remarks": remarks,
        "globalRemarks": globalRemarks,
        "globalAttachments": globalAttachments,
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "last_notice": lastNotice,
    };
}

class Attachment {
    Attachment({
        required this.id,
        required this.details,
    });

    String id;
    AttachmentDetails details;

    factory Attachment.fromRawJson(String str) => Attachment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        details: AttachmentDetails.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "details": details.toJson(),
    };
}

class AttachmentDetails {
    AttachmentDetails({
        required this.filename,
        required this.filetype,
        required this.remarkofFile,
        required this.globalAttachments,
    });

    String filename;
    String filetype;
    String remarkofFile;
    String globalAttachments;

    factory AttachmentDetails.fromRawJson(String str) => AttachmentDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AttachmentDetails.fromJson(Map<String, dynamic> json) => AttachmentDetails(
        filename: json["filename"],
        filetype: json["filetype"],
        remarkofFile: json["RemarkofFile"],
        globalAttachments: json["globalAttachments"],
    );

    Map<String, dynamic> toJson() => {
        "filename": filename,
        "filetype": filetype,
        "RemarkofFile": remarkofFile,
        "globalAttachments": globalAttachments,
    };
}

class GlobalRemark {
    GlobalRemark({
        required this.id,
        required this.details,
    });

    String id;
    GlobalRemarkDetails details;

    factory GlobalRemark.fromRawJson(String str) => GlobalRemark.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GlobalRemark.fromJson(Map<String, dynamic> json) => GlobalRemark(
        id: json["id"],
        details: GlobalRemarkDetails.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "details": details.toJson(),
    };
}

class GlobalRemarkDetails {
    GlobalRemarkDetails({
        required this.remark,
        required this.sectionId,
        required this.pointId,
    });

    String remark;
    String sectionId;
    String pointId;

    factory GlobalRemarkDetails.fromRawJson(String str) => GlobalRemarkDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GlobalRemarkDetails.fromJson(Map<String, dynamic> json) => GlobalRemarkDetails(
        remark: json["Remark"],
        sectionId: json["SectionId"],
        pointId: json["PointId"],
    );

    Map<String, dynamic> toJson() => {
        "Remark": remark,
        "SectionId": sectionId,
        "PointId": pointId,
    };
}
