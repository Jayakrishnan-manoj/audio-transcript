import 'dart:async';

import 'package:audio_transcript/shared/utils/colors.dart';
import 'package:audio_wave/audio_wave.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

@RoutePage()
class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  final SpeechToText _speechToText = SpeechToText();
  late Timer _timer;
  String _wordsSpoken = "";

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    bool _speechEnabled = await _speechToText.initialize().whenComplete(
          () => _startListening(),
        );
    print(_speechEnabled);
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
    );
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!_speechToText.isListening) {
        _timer.cancel();
        context.router.maybePop(_wordsSpoken);
      }
    });
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 10,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Hi! I'm listenig, Try saying....",
                style: TextStyle(
                  color: kTextColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _wordsSpoken == ""
                    ? "Name of the items in the dish"
                    : _wordsSpoken,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: _speechToText.isListening,
                child: AudioWave(
                  height: 32,
                  width: 120,
                  spacing: 4,
                  animationLoop: 0,
                  bars: [
                    AudioWaveBar(heightFactor: 0.7, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.2, color: kTextColor),
                    AudioWaveBar(heightFactor: 1, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.9, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.3, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.5, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.1, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.7, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.2, color: kTextColor),
                    AudioWaveBar(heightFactor: 1, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.9, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.3, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.5, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.1, color: kTextColor),
                    AudioWaveBar(heightFactor: 0.7, color: kTextColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
