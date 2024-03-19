
import 'package:widgets_app/domain/entities/message.dart';

// Si la data llega como string aquí hace la conversión a mapa
// YesNoModel nombreFromJson(String str) => YesNoModel.fromJsonMap(json.decode(str));

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    // Map<String, dynamic> toJson() => {
    //     "answer": answer,
    //     "forced": forced,
    //     "image": image,
    // };

    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'si' : 'no',
      fromWho: FromWho.hers,
      imageUrl: image,
    );
}
