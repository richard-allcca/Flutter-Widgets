

import 'package:dio/dio.dart';
import 'package:widgets_app/domain/entities/message.dart';
import 'package:widgets_app/infrastructure/model/yes_no_model.dart';

// Helper para automatizar la respuesta con 'dio'

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
    // return Message(text: response.data['answer'], fromWho: FromWho.hers, imageUrl: response.data['image']);
  }
}

