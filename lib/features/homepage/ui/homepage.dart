import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_week4_picker/features/homepage/widget_builder/floating_button.dart';
import 'package:intl/intl.dart';

class Homepage extends StatelessWidget {
  Homepage({
    super.key,
    // required this.fileResults,
    // required this.color,
    // required this.date,
  });

  File? fileResults;
  Color? color;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Preview Post"),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.menu)),
        ),
        body: Container(
          height: 590,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text("A"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Achmad Faiz Alawi", style: TextStyle(fontWeight:FontWeight.w600)),
                        const SizedBox(height: 2),
                        Text("Published: ${DateFormat('dd/MM/yyyy').format(date ?? DateTime.now())}", style: TextStyle(fontSize: 12),)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://picsum.photos/seed/picsum/200/300", 
                  width: 600,
                  height: 200,
                  fit: BoxFit.cover)
              ),  
              const SizedBox(
                height: 20,
              ),
              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply du.",
              textAlign: TextAlign.justify,
              style: const TextStyle(
                height: 1.5
              ),)
            ],
          ),
        ),
        floatingActionButton: const FloatingButton(),
      )
    );
  }
}