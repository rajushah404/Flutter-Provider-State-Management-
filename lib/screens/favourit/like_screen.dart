import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/like_provider.dart';
import 'package:provider_test/screens/favourit/liked_list.dart';

import '../../provider/theme_changer_provider.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    print("Rebuilded");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourit AI List"),
        centerTitle: true,
        actions: [
          InkWell(
            child: Icon(Icons.favorite),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikedList(),
                ),
              );
            },
          ),
          Selector<ThemeChangerProvider, ThemeMode>(
            selector: (context, themeChanger) => themeChanger.themeMode,
            builder: (context, themeMode, child) {
              return IconButton(
                icon: Icon(
                  themeMode == ThemeMode.light
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  final themeChanger =
                      Provider.of<ThemeChangerProvider>(context, listen: false);
                  themeChanger.setTheme(
                    themeMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light,
                  );
                },
                tooltip: 'Toggle Theme',
              );
            },
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Consumer<LikeProvider>(builder: (context, value, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: aiTools.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(aiTools[index].toString()),
                    trailing: value.liked.contains(index)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onTap: () {
                      if (value.liked.contains(index)) {
                        value.removeLiked(index);
                        value.removeLikedItem(aiTools[index]);
                      } else {
                        value.addLiked(index);
                        value.addLikedItem(aiTools[index]);
                      }
                    },
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}

List<String> aiTools = [
  "ChatGPT",
  "DALL·E",
  "MidJourney",
  "Stable Diffusion",
  "Hugging Face",
  "OpenAI Codex",
  "TensorFlow",
  "PyTorch",
  "Google Bard",
  "Cohere",
  "Jasper AI",
  "Runway ML",
  "Replika",
  "Synthesia",
  "Claude AI",
  "DeepMind",
  "LLaMA",
  "Copy.ai",
  "Tabnine",
  "DataRobot",
  "Perplexity AI",
  "YouChat",
];
