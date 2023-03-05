import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_week4_picker/features/create_post_page/ui/create_post_page.dart';
import 'package:flutter_week4_picker/post_data/post_data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PostData dataPostingan = PostData();
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
        body: ListView.builder(
            itemCount: dataPostingan.data.length,
            itemBuilder: (context, index) {
              return Container(
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
                        backgroundColor: dataPostingan.getColor()[index],
                        child: Text(dataPostingan.getName()[index][0]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataPostingan.getName()[index], 
                              style: const TextStyle(fontWeight:FontWeight.w600)),
                            const SizedBox(height: 2),
                            Text(
                                "Published: ${dataPostingan.getPublish()[index]}", 
                                style: const TextStyle(fontSize: 12),),
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
                    child: Image.file(File(dataPostingan.getCover()[index]), 
                      width: 600,
                      height: 200,
                      fit: BoxFit.cover)
                  ),  
                  const SizedBox(
                    height: 20,
                  ),
                  Text(dataPostingan.getCaption()[index],
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    height: 1.5
                  )
                  )
                          ]),
              );
          }),
        floatingActionButton: floatingButton(context),
      )
    );
  }

  Padding floatingButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: (){},
          child: IconButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_)=> CreatePostPage(postData: dataPostingan.data)
                )
              ).then((updatedData) {
                setState(() {
                  dataPostingan.data = updatedData;
                  debugPrint("DATA: $updatedData");
                });
              } );
            }, 
            icon: const Icon(Icons.add))),
      );
  }
}