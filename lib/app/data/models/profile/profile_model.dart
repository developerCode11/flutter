import 'package:flutter/material.dart';

class ProfileModel {
  int? code;
  String? message;
  Profile? profile;

  ProfileModel({code, message, profile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? sId;
  ProfessionalInfo? professionalInfo;
  User? user;
  BasicInfo? basicInfo;
  ProfileImage? profileImage;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? phoneNumber;
  String? imageUrl;

  Profile(
      {sId,
      professionalInfo,
      user,
      basicInfo,
      profileImage,
      createdAt,
      updatedAt,
      iV,
      phoneNumber,
      imageUrl});

  Profile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    professionalInfo = json['professionalInfo'] != null
        ? ProfessionalInfo.fromJson(json['professionalInfo'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    basicInfo = json['basicInfo'] != null
        ? BasicInfo.fromJson(json['basicInfo'])
        : null;
    profileImage = json['profileImage'] != null
        ? ProfileImage.fromJson(json['profileImage'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (professionalInfo != null) {
      data['professionalInfo'] = professionalInfo!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (basicInfo != null) {
      data['basicInfo'] = basicInfo!.toJson();
    }
    if (profileImage != null) {
      data['profileImage'] = profileImage!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['phoneNumber'] = phoneNumber;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

class ProfessionalInfo {
  List<String>? specialization;
  String? expertise;
  List<Experience>? experience;

  ProfessionalInfo({specialization, expertise, experience});

  ProfessionalInfo.fromJson(Map<String, dynamic> json) {
    specialization = json['specialization'].cast<String>();
    expertise = json['expertise'];
    if (json['experience'] != null) {
      experience = <Experience>[];
      json['experience'].forEach((v) {
        experience!.add(Experience.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['specialization'] = specialization;
    data['expertise'] = expertise;
    if (experience != null) {
      data['experience'] = experience!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Experience {
  String? sId;
  String? name;
  String? position;
  DateTime? joinDate;
  DateTime? releaseDate;
  final TextEditingController positionTextEditingController =
      TextEditingController();
  final TextEditingController corporationTextEditingController =
      TextEditingController();
  final FocusNode positionFocusNode = FocusNode();
  final FocusNode corporationFocusNode = FocusNode();

  Experience(
      {sId,
      name,
      position,
      start,
      end,
      releaseDate,
      joinDate,
      positionTextEditingController,
      corporationTextEditingController});

  Experience.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    position = json['position'];
    positionTextEditingController.text = json['position'];
    corporationTextEditingController.text = json['name'];
    if (json['start'] != null) {
      joinDate = DateTime.parse(json['start']);
    } else {
      joinDate = DateTime.now();
    }
    if (json['end'] != null) {
      releaseDate = DateTime.parse(json['end']);
    } else {
      releaseDate = DateTime.now();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['_id'] = sId;
    data['name'] = corporationTextEditingController.text;
    data['position'] = positionTextEditingController.text;
    data['start'] = joinDate.toString();
    data['end'] = releaseDate.toString();
    return data;
  }
}

class User {
  String? sId;
  String? email;

  User({sId, email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    return data;
  }
}

class BasicInfo {
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  String? about;

  BasicInfo({firstName, lastName, dateOfBirth, gender, about});

  BasicInfo.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['about'] = about;
    return data;
  }
}

class ProfileImage {
  String? sId;
  String? s3Key;

  ProfileImage({sId, s3Key});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    s3Key = json['s3Key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['s3Key'] = s3Key;
    return data;
  }
}
