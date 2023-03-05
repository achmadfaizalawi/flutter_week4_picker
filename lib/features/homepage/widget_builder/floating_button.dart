import 'package:flutter/material.dart';
import 'package:flutter_week4_picker/features/create_post_page/ui/create_post_page.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        onPressed: (){},
        child: IconButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_)=> const CreatePostPage()
              )
            );
          }, 
          icon: const Icon(Icons.add))),
    );
  }
}