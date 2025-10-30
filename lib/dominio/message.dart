// Enumeración para poder identificar de quién es el mensaje
enum YooEl { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final YooEl yooEl;

  Message({
    required this.text,
    this.imageUrl,
    required this.yooEl,
  });
}