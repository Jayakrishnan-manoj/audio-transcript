import 'package:audio_transcript/features/transcript/widgets/search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomSearchBar(
            searchController: controller,
          ),
        ),
      ),
    );
  }
}
