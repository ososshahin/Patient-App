import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patient_app/widgets/custom_button.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

import '../services/gallery_service.dart';

class Askingquestionscreen extends StatefulWidget {
  static const String routeName = 'Askingquestions';
  const Askingquestionscreen({super.key});

  @override
  State<Askingquestionscreen> createState() => _AskingquestionscreenState();
}

class _AskingquestionscreenState extends State<Askingquestionscreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  final GalleryService _galleryService = GalleryService(); // Use the service
  List<AssetEntity> recentImages = [];
  bool isLoading = true;

  @override
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _loadImages() async {
    try {
      List<AssetEntity> images = await _galleryService.fetchLastTwoImages();
      setState(() {
        recentImages = images;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading images: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'X',
            style: TextStyle(fontSize: 25.sp, fontFamily: 'Epilogue'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.w), // Use responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Ask a question to your doctor',
                style: TextStyle(
                  fontFamily: 'Epilogue',
                  color: Colors.black,
                  fontSize: 25.sp, // Use responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.h, // Use responsive height
              ),
              Padding(
                padding: EdgeInsets.all(12.w), // Use responsive padding
                child: TextFormField(
                  maxLines: 17,
                  decoration: InputDecoration(
                    hintText: '  enter your question',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp, // Use responsive font size
                    ),
                    filled: true,
                    fillColor: Color(0xff5C8AFF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.r), // Use responsive radius
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6.h, // Use responsive height
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                height: 120.h, // Use responsive height
                decoration: BoxDecoration(
                  color: Color(0xff5C8AFF),
                  borderRadius: BorderRadius.circular(20.r), // Use responsive radius
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _pickImage(ImageSource.camera);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w), // Use responsive padding
                        child: Row(
                          children: [
                            _image == null
                                ? Image.asset('assets/images/AttachPhoto.png')
                                : Image.file(_image!),
                            isLoading
                                ? Center(child: CircularProgressIndicator())
                                : recentImages.isNotEmpty
                                ? Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: recentImages.length,
                                itemBuilder: (context, index) {
                                  return FutureBuilder(
                                    future: GalleryService().getThumbnail(
                                        recentImages[index]),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                          snapshot.data != null) {
                                        return Container(
                                          child: snapshot.data,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  );
                                },
                              ),
                            )
                                : Container(
                              color: Colors.black,
                              height: 40.h, // Use responsive height
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.h, // Use responsive height
              ),
              CustomButton(ButtonLabel: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
