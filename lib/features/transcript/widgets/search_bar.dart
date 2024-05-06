import 'package:audio_transcript/routes/routes.dart';
import 'package:audio_transcript/shared/utils/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController searchController;

  const CustomSearchBar({super.key, required this.searchController});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: widget.searchController,
      hintText: "What's in the dish? (optional)",
      hintStyle: const MaterialStatePropertyAll(
        TextStyle(
          color: kTextColor,
        ),
      ),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(color: Colors.white),
      ),
      shape: MaterialStatePropertyAll(
        ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      elevation: const MaterialStatePropertyAll(0),
      backgroundColor: const MaterialStatePropertyAll(kSecondaryColor),
      trailing: [
        IconButton(
          onPressed: () async {
            final result = await context.router.push(const RecordingRoute());
            if (result != null) {
              setState(() {
                widget.searchController.text = result.toString();
              });
            }
          },
          icon: const Icon(
            Icons.mic,
            color: kTextColor,
          ),
        ),
      ],
    );
  }
}
