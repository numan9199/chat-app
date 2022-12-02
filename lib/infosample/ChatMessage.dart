enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  String text;
  MessageStatus? messageStatus;
  bool isSender;

  ChatMessage({
    this.text='',
    this.messageStatus,
    this.isSender=true,
  });
}

List demeChatMessages = [
  ChatMessage(
    text: "Hi Sajol,",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you?",
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "sdfksdfdslfdsfpdfpdf",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "dsfs;f;f",
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Error happend",
    messageStatus: MessageStatus.not_sent,
    isSender: true,
  ),
  ChatMessage(
    text: "This looks great man!!",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad you like it",
    messageStatus: MessageStatus.not_view,
    isSender: true,
  ),
];
