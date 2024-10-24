import 'package:flutter/material.dart';
import 'package:flutter_application_1/sender_page/%E0%B8%B5user_type.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // พื้นหลังทั้งหมดเป็นสีดำ
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // ขยับตำแหน่งให้ขึ้นไปบน
          children: <Widget>[
            const SizedBox(height: 150), // ปรับความสูงของพื้นที่ว่างด้านบน
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.white, // เปลี่ยนสีฟอนต์เป็นสีขาว
                fontSize: 24, // ปรับขนาดฟอนต์ตามต้องการ
              ),
            ),
            const SizedBox(
                height: 50), // เพิ่มพื้นที่ว่างระหว่างข้อความ "Login" และฟอร์ม
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20), // เพิ่มระยะห่างข้าง
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // จัดตำแหน่งให้ข้อความอยู่ทางซ้าย
                children: [
                  // ข้อความบอกชื่อฟิลด์ Username
                  const Text(
                    'Username', // ข้อความแสดงชื่อฟิลด์
                    style: TextStyle(
                      color: Colors.white, // เปลี่ยนสีฟอนต์เป็นสีขาว
                      fontSize: 18, // ขนาดฟอนต์
                    ),
                  ),
                  const SizedBox(
                      height: 5), // เพิ่มพื้นที่ว่างระหว่างข้อความและช่องกรอก
                  // ช่องกรอก Username
                  TextField(
                    style: const TextStyle(
                        color: Colors.black), // สีฟอนต์สำหรับช่องกรอก
                    decoration: const InputDecoration(
                      labelText: 'Username', // ข้อความ label สำหรับ Username
                      labelStyle:
                          TextStyle(color: Colors.grey), // สีฟอนต์ของ label
                      filled: true,
                      fillColor: Colors.white, // สีพื้นหลังของช่องกรอก
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20), // เพิ่มพื้นที่ว่างระหว่างช่องกรอก
                  // ข้อความบอกชื่อฟิลด์ Password
                  const Text(
                    'Password', // ข้อความแสดงชื่อฟิลด์
                    style: TextStyle(
                      color: Colors.white, // เปลี่ยนสีฟอนต์เป็นสีขาว
                      fontSize: 18, // ขนาดฟอนต์
                    ),
                  ),
                  const SizedBox(
                      height: 5), // เพิ่มพื้นที่ว่างระหว่างข้อความและช่องกรอก
                  // ช่องกรอก Password
                  TextField(
                    obscureText: true, // ทำให้ข้อความในช่องกรอกซ่อน
                    style: const TextStyle(
                        color: Colors.black), // สีฟอนต์สำหรับช่องกรอก
                    decoration: const InputDecoration(
                      labelText: 'Password', // ข้อความ label สำหรับ Password
                      labelStyle:
                          TextStyle(color: Colors.grey), // สีฟอนต์ของ label
                      filled: true,
                      fillColor: Colors.white, // สีพื้นหลังของช่องกรอก
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), // เพิ่มพื้นที่ว่างด้านล่าง
            ElevatedButton(
              onPressed: () {
                // เพิ่มฟังก์ชันการเข้าสู่ระบบที่นี่
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // เปลี่ยนจาก primary เป็น backgroundColor
                minimumSize:
                    const Size(370, 50), // กำหนดความกว้าง 200 และความสูง 50
              ),
              child: const Text(
                'Login', // ข้อความบนปุ่ม
                style: TextStyle(color: Colors.white), // กำหนดสีฟอนต์เป็นสีขาว
              ),
            ),
            const SizedBox(height: 15), // เพิ่มพื้นที่ว่างด้านล่าง
           Padding(
  padding: const EdgeInsets.only(left: 200.0), // ปรับระยะห่างด้านซ้าย
  child: InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserType()), // เปลี่ยนไปที่หน้า user_type.dart
      );
    },
    child: const Text(
      'Create Account ',
      style: TextStyle(
        color: Color.fromARGB(255, 112, 112, 116), // เปลี่ยนสีฟอนต์
        fontSize: 14, // ปรับขนาดฟอนต์ตามต้องการ
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