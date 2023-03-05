import 'package:flutter/material.dart';
import 'package:flutter_week4_picker/features/create_post_page/widget_builder/choose_data_picker.dart';
import 'package:flutter_week4_picker/features/create_post_page/widget_builder/name_box.dart';
import 'package:flutter_week4_picker/features/create_post_page/widget_builder/title_text.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  DateTime? _selectedDate;
  Color pickerColor = const Color(0xff443a49);
  File? fileResults;
  String? fileName;
  String? caption;
  String? name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Post"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const TitleText(text: "Name"),
                const SizedBox(height: 6),
                NameBox(onFieldName: (value){
                  name = value;
                  debugPrint(name);
                }),
                const SizedBox(height: 10),
                const TitleText(text: "Publish At"),
                ChooseDataPicker(
                  text: DateFormat('dd/MM/yyyy').format(_selectedDate ?? DateTime.now()), 
                  onPressed: () async{
                    await datePicker(context).then((value) {
                        setState(() {
                          _selectedDate = value;                         
                        });
                      });
                  }),
                const SizedBox(height: 10),
                const TitleText(text: "Color Theme"),
                ChooseDataPicker(
                  text: "$pickerColor",
                  onPressed: (){
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return colorPicker(context);
                      });
                  }),
                const SizedBox(height: 10),
                const TitleText(text: "Cover"),
                ChooseDataPicker(
                  text: fileName ?? "Choose File", 
                  backgroundColor: Colors.grey, 
                  textColor: Colors.white,
                  foregroundColor: Colors.white,
                  onPressed: (){
                    setState(() {
                      pickFile();
                    });
                  }),
                const SizedBox(height: 10),
                const TitleText(text: "Caption"),
                const SizedBox(height: 10),
                boxCaption(),
                ChooseDataPicker(
                  text: "Save",
                  backgroundColor: Colors.blue,
                  borderColor: Colors.blue,
                  textColor: Colors.white,
                  foregroundColor: Colors.white,
                  onPressed: (){
                    Navigator.of(context).pop();
                  },)
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox boxCaption() {
    return SizedBox(
      height: 200,
      child: Form(
        child: TextFormField(
          maxLength: 600,
          onFieldSubmitted: (value) {
            caption = value;
            debugPrint("INPUT USERS : $value");
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2,color: Colors.grey)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2,color: Colors.grey)
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 80, horizontal: 10),         
          ),
        ),
      ),
    );
  }

  AlertDialog colorPicker(BuildContext context) {
    return AlertDialog(
      title: const Text("Pick a Color"),
      content: SingleChildScrollView(
        child: Material(
          child: ColorPicker(
            pickerColor: pickerColor, 
            onColorChanged: (Color color){
              pickerColor = color;
            }),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: const Text("Cancel")),
        ElevatedButton(
          onPressed: (){
            setState(() {
              Navigator.pop(context);
            });
          }, 
          child: const Text("Pick Me"))
      ],
    );
  }

  Future<DateTime?> datePicker(BuildContext context) {
    return showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900), 
      lastDate: DateTime(DateTime.now().year+5));
  }

  void pickFile() async{
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileResults = File(result.files.single.path ?? '');
      setState(() {
        fileName = fileResults?.path.split('/').last;
      });
    } 
  }
}