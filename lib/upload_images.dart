import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:reaco/dashboard.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key, required this.userData});

  final Map<String, dynamic> userData;

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final List<File> _images = [];
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage(ImageSource source, int index) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        // Ensure the index is within the list bounds
        if (index < _images.length) {
          _images[index] = File(pickedImage.path);
        } else {
          _images.add(File(pickedImage.path));
        }
      });
    }
  }

  Future<void> _uploadImages() async {
    if (_formKey.currentState!.validate()) {
      if (_images.length != 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please upload 3 images')),
        );
        return;
      }

      // Assuming your backend API endpoint is 'http://your-backend-url/take-images'
      final apiUrl = 'https://x200lnxp-8000.inc1.devtunnels.ms/user/take-images';

      try {
        // Get the auth token from the provided userData
        final authToken = widget.userData['access_token'];

        final request = http.MultipartRequest('POST', Uri.parse(apiUrl));

        // Add authorization headers
        request.headers['Authorization'] = 'Bearer $authToken';

        // Iterate only if there are images
        if (_images.isNotEmpty) {
          for (int i = 0; i < _images.length; i++) {
            final imageFile = _images[i];
            final multipartFile = http.MultipartFile.fromBytes(
              'file${i + 1}',
              imageFile.readAsBytesSync(),
              filename: imageFile.path.split('/').last,
            );
            request.files.add(multipartFile);
          }
        }

        final response = await request.send();

        if (response.statusCode == 200) {
          // Successful upload, navigate to the next screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashBoard(userData: widget.userData)),
          );
        } else if (response.statusCode == 400) {
          // Handle 400 error (Face not found)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Face is not found')),
          );
        } else {
          // Handle other errors
          print('Error uploading images: ${response.statusCode}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error uploading images: ${response.statusCode}')),
          );
        }
      } catch (e) {
        // Handle network errors
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading images: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'UPLOAD PICTURE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Three images with one face',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    3,
                    (index) => Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        image: _images.length > index
                            ? DecorationImage(
                                image: FileImage(_images[index]),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: InkWell(
                        onTap: () {
                          _pickImage(ImageSource.gallery, index);
                        },
                        child: Center(
                          child: _images.length > index
                              ? const Icon(Icons.check, color: Colors.white)
                              : const Icon(Icons.add_a_photo),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadImages,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'NEXT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}