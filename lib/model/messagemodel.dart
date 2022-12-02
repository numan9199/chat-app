// To parse this JSON data, do
//
//     final messagemodel = messagemodelFromJson(jsonString);

import 'dart:convert';

List<Messagemodel> messagemodelFromJson(String str) =>
    List<Messagemodel>.from(json.decode(str).map((x) => Messagemodel.fromJson(x)));

String messagemodelToJson(List<Messagemodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Messagemodel {
    Messagemodel({
        this.messageId,
        this.senderId,
        this.receiverId,
        this.messageType,
        this.message,
        this.url,
        this.isRead,
        this.chatRoomId,
    });

    String? messageId;
    String? senderId;
    String? receiverId;
    String? messageType;
    String? message;
    String? url;
    bool? isRead;
    String? chatRoomId;

    factory Messagemodel.fromJson(Map<String, dynamic> json) => Messagemodel(
        messageId: json["message_id"],
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        messageType: json["message_type"],
        message: json["message"],
        url: json["url"],
        isRead: json["is_read"],
        chatRoomId: json["chat_room_id"],
    );

    Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "sender_id": senderId,
        "receiver_id": receiverId,
        "message_type": messageType,
        "message": message,
        "url": url,
        "is_read": isRead,
        "chat_room_id": chatRoomId,
    };
}
