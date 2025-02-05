import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/like_provider.dart';

class LikedList extends StatefulWidget {
  const LikedList({super.key});

  @override
  State<LikedList> createState() => _LikedListState();
}

class _LikedListState extends State<LikedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected List"),
        centerTitle: true,
      ),
      body: Consumer<LikeProvider>(builder: (context, value, child) {
        if (value.liked.isEmpty) {
          return Center(
            child: Text(
              "No Item added",
              style: TextStyle(fontSize: 30),
            ),
          );
        }
        return ListView.builder(
          itemCount: value.liked.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                value.likedItem[index].toString(),
              ),
              trailing: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            );
          },
        );
      }),
    );
  }
}
