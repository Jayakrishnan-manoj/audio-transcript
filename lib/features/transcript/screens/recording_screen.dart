import 'package:audio_transcript/shared/utils/colors.dart';
import 'package:audio_wave/audio_wave.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40   ,
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
                '"Name of items in the dish"',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AudioWave(
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
            ],
          ),
        ),
      ),
    );
  }
}
