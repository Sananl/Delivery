import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterRiderPage extends StatefulWidget {
  const RegisterRiderPage({super.key});

  @override
  _RegisterRiderPageState createState() => _RegisterRiderPageState();
}

class _RegisterRiderPageState extends State<RegisterRiderPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _vehicleNumberController = TextEditingController();
  String? _imagePath; // สำหรับเส้นทางของรูปภาพ

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register Rider',
          style: TextStyle(color: Colors.white), // กำหนดสีฟอนต์เป็นสีขาว
        ),
        backgroundColor: Colors.black, // กำหนดสีพื้นหลังของ AppBar เป็นสีดำ
      ),
      backgroundColor: Colors.black, // พื้นหลังของหน้าจอเป็นสีดำ
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Name',
                style: TextStyle(color: Colors.white), // สีฟอนต์เป็นสีขาว
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
                'Vehicle Number',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                controller: _vehicleNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your vehicle number',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),

              const Text(
                'Upload Image',
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: _pickImage, // เรียกฟังก์ชันเลือกภาพ
                child: const Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white), // สีฟอนต์เป็นสีขาว
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // เปลี่ยนสีพื้นหลังปุ่มเป็นสีฟ้า
                ),
              ),
              if (_imagePath != null)
                Text('Image uploaded: $_imagePath',
                    style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // เพิ่มฟังก์ชันการสมัครสมาชิกที่นี่
                    _registerRider();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white), // สีฟอนต์เป็นสีขาว
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registerRider() {
    // ฟังก์ชันสำหรับสมัครสมาชิกไรเดอร์
    String name = _nameController.text;
    String phone = _phoneController.text;
    String password = _passwordController.text;
    String vehicleNumber = _vehicleNumberController.text;
    String? imagePath = _imagePath;

    // ทำสิ่งที่ต้องการกับข้อมูลที่กรอก
    print('Name: $name');
    print('Phone: $phone');
    print('Password: $password');
    print('Vehicle Number: $vehicleNumber');
    print('Image Path: $imagePath');
  }
}