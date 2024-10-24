import 'package:flutter/material.dart';
import 'package:flutter_application_1/sender_page/register_rider.dart';
import 'register_user.dart'; // นำเข้าหน้า register_user

class UserType extends StatelessWidget {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // พื้นหลังเป็นสีดำ
      appBar: AppBar(
        title: const Text(
          'Select User Type',
          style: TextStyle(color: Colors.white), // กำหนดสีฟอนต์เป็นสีขาว
        ),
        backgroundColor: Colors.black, // สีของ AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลาง
          children: <Widget>[
            // ห่อ Container ด้วย GestureDetector สำหรับการคลิก
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const RegisterUserPage()), // เมื่อคลิกไปหน้า register_user.dart
                );
              },
              child: Container(
                width: 200, // ความกว้างของกล่อง
                height: 150, // ความสูงของกล่อง
                decoration: BoxDecoration(
                  color: Colors.grey, // สีของกล่อง
                  borderRadius: BorderRadius.circular(10), // ขอบเป็นสี่เหลี่ยม
                ),
                child: const Center(
                  child: Text(
                    'User', // ข้อความในกล่อง
                    style: TextStyle(
                      color: Colors.white, // สีฟอนต์เป็นสีขาว
                      fontSize: 20, // ขนาดฟอนต์
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60), // เว้นระยะห่างระหว่างกล่อง
            // กล่องสี่เหลี่ยมที่ 2 (Rider)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const RegisterRiderPage(), // ไปที่หน้า register_rider.dart
                  ),
                );
              },
              child: Container(
                width: 200, // ความกว้างของกล่อง
                height: 150, // ความสูงของกล่อง
                decoration: BoxDecoration(
                  color: Colors.grey, // สีของกล่อง
                  borderRadius: BorderRadius.circular(10), // ขอบเป็นสี่เหลี่ยม
                ),
                child: const Center(
                  child: Text(
                    'Rider', // ข้อความในกล่อง
                    style: TextStyle(
                      color: Colors.white, // สีฟอนต์เป็นสีขาว
                      fontSize: 20, // ขนาดฟอนต์
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}