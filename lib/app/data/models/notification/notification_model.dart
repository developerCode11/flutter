import 'dart:convert';

class Data {
  String? type;
  String? subType;
  String? resourceId;
  String? sender;
  Channel? channel;
  String? message;

  Data({this.type, this.subType, this.resourceId});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subType = json['subType'];
    resourceId = json['resourceId'];
    sender = json["sender"];
    if (json["channel"] != null) {
      var result = jsonDecode(json["channel"] ?? "");

      channel = Channel.fromJson(result);
    }
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['type'] = type;
    data['subType'] = subType;
    data['resourceId'] = resourceId;
    data['sender'] = sender;
    data['channel'] = channel;
    data['message'] = message;
    return data;
  }
}

class Channel {
  Channel({
    this.id,
    this.type,
  });

  String? id;
  String? type;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}
