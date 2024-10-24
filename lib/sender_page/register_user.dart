import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // นำเข้า image_picker

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  // ตัวแปรเก็บค่าจากฟอร์ม
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _gpsCoordinates; // สำหรับพิกัด GPS
  String? _imagePath; // สำหรับเส้นทางของรูปภาพ

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery); // เลือกรูปภาพจากแกลเลอรี

    if (image != null) {
      setState(() {
        _imagePath = image.path; // เก็บที่อยู่ของภาพที่เลือก
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register User',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Name',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Phone Number',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone number',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Address',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your address',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Image',
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: _pickImage, // เรียกฟังก์ชันเลือกภาพ
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // เปลี่ยนสีพื้นหลังเป็นสีฟ้า
                ),
                child: const Text(
                  'Upload Image',
                  style:
                      TextStyle(color: Colors.white), // กำหนดสีฟอนต์เป็นสีขาว
                ),
              ),
              if (_imagePath != null)
                Text('Image uploaded: $_imagePath',
                    style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              const Text(
                'Pickup Location (GPS)',
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _gpsCoordinates =
                        'Lat: 13.7563, Lon: 100.5018'; // ตัวอย่างพิกัด
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // เปลี่ยนสีพื้นหลังเป็นสีฟ้า
                ),
                child: const Text(
                  'Get GPS Coordinates',
                  style:
                      TextStyle(color: Colors.white), // กำหนดสีฟอนต์เป็นสีขาว
                ),
              ),
              if (_gpsCoordinates != null)
                Text('GPS Coordinates: $_gpsCoordinates',
                    style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _registerUser();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // เปลี่ยนสีพื้นหลังเป็นสีฟ้า
                  ),
                  child: const Text(
                    'Register',
                    style:
                        TextStyle(color: Colors.white), // กำหนดสีฟอนต์เป็นสีขาว
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registerUser() {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String password = _passwordController.text;
    String address = _addressController.text;
    String? imagePath = _imagePath;
    String? gpsCoordinates = _gpsCoordinates;

    print('Name: $name');
    print('Phone: $phone');
    print('Password: $password');
    print('Address: $address');
    print('Image Path: $imagePath');
    print('GPS Coordinates: $gpsCoordinates');
  }
}