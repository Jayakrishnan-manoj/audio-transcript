import 'dart:convert';

import 'package:audio_transcript/features/transcript/env/env.dart';
import 'package:http/http.dart' as http;

class WhisperService {
  String transcribedText = "";

  Future<void> transcribeAudio(String filePath) async {
    final apiKey = Env.OpenAI_Key;
    var url = Uri.https("https://api.openai.com", "/v1/audio/transcriptions");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': "multipart/form-data",
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'whisper-1',
          'file': await http.MultipartFile.fromPath('file', filePath),
        }),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> output = jsonDecode(response.body);
        transcribedText = output['text'];
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
