import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // สำหรับแสดงแผนที่
import 'package:image_picker/image_picker.dart'; // สำหรับเลือกภาพ
import 'dart:io'; // นำเข้าแพ็กเกจ dart:io

class OrderFormPage extends StatefulWidget {
  @override
  _OrderFormPageState createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedReceiver; // ตัวแปรเก็บผู้รับที่เลือก
  String _receiverDetails = 'ไม่พบผู้รับ'; // รายละเอียดผู้รับ
  LatLng _receiverLocation = LatLng(0, 0); // พิกัดของผู้รับ
  XFile? _image; // ตัวแปรเก็บภาพที่ถ่าย

  // ฟังก์ชันค้นหาผู้รับ
  void _searchReceiver() {
    // ตัวอย่างข้อมูลผู้รับ (ในระบบจริงควรมีการดึงข้อมูลจากฐานข้อมูล)
    if (_searchController.text == '1234567890') {
      setState(() {
        _selectedReceiver = 'Receiver 1';
        _receiverDetails =
            'Receiver 1: ที่อยู่ 123/4 ถนนพระราม 9 กรุงเทพมหานคร';
        _receiverLocation =
            LatLng(13.736717, 100.523186); // เปลี่ยนพิกัดตามข้อมูลผู้รับ
      });
    } else {
      setState(() {
        _selectedReceiver = null;
        _receiverDetails = 'ไม่พบผู้รับ';
        _receiverLocation = LatLng(0, 0); // รีเซ็ตพิกัด
      });
    }
  }

  // ฟังก์ชันถ่ายภาพสินค้า
  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    _image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      // รีเฟรช UI ถ้ามีการถ่ายภาพ
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sending',
          style: TextStyle(
              color: Colors.white), // กำหนดสีข้อความใน AppBar เป็นสีขาว
        ),
        backgroundColor: Colors.black, // กำหนดสีพื้นหลังของ AppBar เป็นสีดำ
      ),
      body: Container(
        color: Colors.black, // เปลี่ยนสีพื้นหลังของ body เป็นสีดำ
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'ค้นหาผู้รับ (หมายเลขโทรศัพท์)',
                labelStyle: TextStyle(
                    color: Colors.white), // เปลี่ยนสีข้อความของ label เป็นสีขาว
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search,
                      color: Colors.white), // เปลี่ยนสีไอคอนเป็นสีขาว
                  onPressed: _searchReceiver, // เรียกฟังก์ชันค้นหา
                ),
              ),
              style: TextStyle(
                  color:
                      Colors.white), // เปลี่ยนสีข้อความใน TextField เป็นสีขาว
              cursorColor: Colors.white, // เปลี่ยนสีของ cursor เป็นสีขาว
            ),
            SizedBox(height: 20), // เพิ่มระยะห่าง
            TextField(
              decoration: InputDecoration(
                labelText: 'Receiver Name', // ชื่อฟิลด์สำหรับชื่อผู้รับ
                labelStyle: TextStyle(
                    color: Colors.white), // เปลี่ยนสีข้อความของ label เป็นสีขาว
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[800], // สีพื้นหลังของฟิลด์
              ),
              style: TextStyle(
                  color:
                      Colors.white), // เปลี่ยนสีข้อความใน TextField เป็นสีขาว
              cursorColor: Colors.white, // เปลี่ยนสีของ cursor เป็นสีขาว
            ),
            SizedBox(height: 20), // เพิ่มระยะห่าง
            TextField(
              decoration: InputDecoration(
                labelText: 'Quantity', // ชื่อฟิลด์สำหรับจำนวนสินค้า
                labelStyle: TextStyle(
                    color: Colors.white), // เปลี่ยนสีข้อความของ label เป็นสีขาว
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[800], // สีพื้นหลังของฟิลด์
              ),
              style: TextStyle(
                  color:
                      Colors.white), // เปลี่ยนสีข้อความใน TextField เป็นสีขาว
              cursorColor: Colors.white, // เปลี่ยนสีของ cursor เป็นสีขาว
              keyboardType:
                  TextInputType.number, // ให้ keyboard แสดงเฉพาะตัวเลข
            ),

            SizedBox(height: 20), // เว้นระยะห่างก่อนปุ่ม
            Center(
              // ใช้ Center เพื่อจัดให้อยู่กลาง
              child: Column(
                mainAxisSize: MainAxisSize.min, // ให้ Column มีขนาดตามเนื้อหา
                children: [
                  Icon(Icons.photo_camera,
                      color: Colors.white, size: 60), // ไอคอนกล้อง
                  SizedBox(height: 8), // เว้นระยะห่างระหว่างไอคอนกับข้อความ
                  ElevatedButton(
                    onPressed: _takePicture, // เรียกฟังก์ชันถ่ายภาพ
                    child: Text(
                      'ถ่ายภาพสินค้า',
                      style: TextStyle(
                          color: Colors.white), // เปลี่ยนสีข้อความเป็นสีขาว
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 250.0), // ขยายพื้นที่ด้านซ้ายของปุ่ม
                    child: ElevatedButton(
                      onPressed: _takePicture, // เรียกฟังก์ชันถ่ายภาพ
                      child: Text(
                        'continue',
                        style: TextStyle(
                            color: Colors.white), // เปลี่ยนสีข้อความเป็นสีขาว
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}