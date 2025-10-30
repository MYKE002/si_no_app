import 'package:si_no_app/dominio/message.dart';

class GetYesNoModel {
  final String answer;
  final bool forced;
  final String image;

  GetYesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  // Factory constructor para crear desde JSON Map
  factory GetYesNoModel.fromJsonMap(Map<String, dynamic> json) => GetYesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  // Método para convertir a JSON
  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  // Crear elemento que regrese mensaje
  Message toMessageEntity() => Message(
        // Para cambiar a español
        text: answer == 'yes'
            ? 'Sí'
            : answer == 'no'
                ? 'No'
                : 'Tal vez',
        yooEl: YooEl.hers,
        imageUrl: image,
      );
}