import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // ตัวแปรเก็บค่าดัชนีของ Bottom Navigation

  final List<Widget> _pages = [
    const Center(
        child: Text('Home Page', style: TextStyle(color: Colors.white))),
    const Center(
        child: Text('Orders Page', style: TextStyle(color: Colors.white))),
    const Center(
        child: Text('Profile Page', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // เปลี่ยนดัชนีที่เลือก
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.white), // กำหนดสีข้อความใน AppBar เป็นสีขาว
        ),
        backgroundColor: Colors.black, // กำหนดสีพื้นหลังของ AppBar เป็นสีดำ
      ),
      body: Container(
        color: Colors.black, // สีพื้นหลังของ body เป็นสีดำ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // จัดตำแหน่งให้อยู่กลาง
          children: <Widget>[
            const Text(
              'Create Delivery Order',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24, // ขนาดฟอนต์
                fontWeight: FontWeight.bold, // ทำให้ฟอนต์หนาขึ้น
              ),
            ),
            const SizedBox(height: 16), // เว้นระยะห่างระหว่างข้อความและกล่อง
            Container(
              width: 120, // กำหนดความกว้างของกล่อง
              height: 90, // กำหนดความสูงของกล่อง
              padding: const EdgeInsets.all(16), // เว้นขอบในกล่อง
              decoration: BoxDecoration(
                color: Colors.blue, // สีพื้นหลังของกล่อง
                borderRadius: BorderRadius.circular(10), // ทำให้มุมกล่องโค้ง
              ),
              child: const Icon(
                Icons.local_shipping, // ไอคอนสำหรับการส่งของ
                color: Colors.white,
                size: 60, // ขนาดของไอคอน
              ),
            ),
            const Text(
              ' shipment ', // เพิ่มเครื่องหมาย ':' เพื่อแยกข้อความ
              style: TextStyle(
                color: Colors.white, // สีฟอนต์เป็นสีขาว
                fontSize: 15, // ขนาดฟอนต์
              ),
            ),
            const SizedBox(height: 30), // เว้นระยะห่างระหว่างกล่องและเส้น
            Container(
              height: 2, // ความสูงของเส้น
              color: Colors.grey, // สีของเส้น
              width: 410, // ความกว้างของเส้น
            ),
            const SizedBox(height: 20), // เว้นระยะห่างระหว่างเส้นและข้อความ
            Align(
              alignment: Alignment.centerLeft, // จัดให้อยู่ทางซ้าย
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0), // เพิ่มระยะห่างด้านซ้าย
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // จัดข้อความให้เริ่มจากซ้าย
                  children: [
                    // ลบ `const` ออก
                    Row(
                      children: [
                        Text(
                          'Tracking Number: ', // เพิ่มเครื่องหมาย ':' เพื่อแยกข้อความ
                          style: TextStyle(
                            color: Colors.grey, // สีฟอนต์เป็นสีขาว
                            fontSize: 13, // ขนาดฟอนต์
                          ),
                        ),
                        Text(
                          ' 2011', // ตัวเลขที่ต้องการแสดง
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14, // ขนาดฟอนต์
                            fontWeight: FontWeight.bold, // ทำให้ฟอนต์หนาขึ้น
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // เว้นระยะห่างระหว่างแถว
                    Text(
                      'From: Roblox narak', // ข้อความที่ต้องการแสดงด้านล่าง
                      style: TextStyle(
                        color: Colors.white, // สีฟอนต์เป็นสีขาว
                        fontSize: 16, // ขนาดฟอนต์
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4), // เว้นระยะห่างระหว่างข้อความ
                    Text(
                      '   มหาวิทยาลัยมหาสารคาม 41/20 ตำบลขามเรียง อำเภอกันทรวิชัย จังหวัดมหาสารคาม 44150 (เขตพื้นที่ขามเรียง)', // ข้อความที่อยู่
                      style: TextStyle(
                        color: Colors.grey, // สีฟอนต์เป็นสีขาว
                        fontSize: 11, // ขนาดฟอนต์
                      ),
                    ),
                    SizedBox(height: 10), // เว้นระยะห่างระหว่างข้อความและไอคอน
                    Icon(
                      Icons.arrow_downward, // ไอคอนลูกศรชี้ลง
                      color: Colors.white, // สีของไอคอน
                      size: 30, // ขนาดของไอคอน
                    ),
                    SizedBox(height: 10), // เว้นระยะห่างระหว่างแถว
                    Text(
                      'To: Yuna water', // ข้อความที่แสดงชื่อผู้รับ
                      style: TextStyle(
                        color: Colors.white, // สีฟอนต์เป็นสีขาว
                        fontSize: 16, // ขนาดฟอนต์
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2), // เว้นระยะห่างระหว่างข้อความ
                    Text(
                      '   41/20 ตำบลขามเรียง อำเภอกันทรวิชัย จังหวัดมหาสารคาม 44150 (เขตพื้นที่ขามเรียง)', // ข้อความที่อยู่
                      style: TextStyle(
                        color: Colors.grey, // สีฟอนต์เป็นสีขาว
                        fontSize: 11, // ขนาดฟอนต์
                      ),
                    ),
                    SizedBox(height: 20), // เว้นระยะห่างระหว่างข้อความ
                    ElevatedButton(
                      onPressed: () {
                        // ฟังก์ชันที่ทำงานเมื่อกดปุ่ม
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                      ),
                      child: const Text(
                        'More Details',
                        style: TextStyle(color: Colors.white), // สีฟอนต์ในปุ่ม
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15), // เว้นระยะห่างระหว่างปุ่มและเส้น
            Container(
              height: 2, // ความสูงของเส้น
              color: Colors.grey, // สีของเส้น
              width: double.infinity, // ความกว้างเต็มที่
            ),

            const SizedBox(height: 40), // เว้นระยะห่าง
            Expanded(
              child: Center(
                child: _pages[_currentIndex], // แสดงหน้าเนื้อหาตามดัชนีที่เลือก
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // ข้อความสำหรับ Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders', // ข้อความสำหรับ Orders
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', // ข้อความสำหรับ Profile
          ),
        ],
        currentIndex: _currentIndex, // ดัชนีปัจจุบัน
        selectedItemColor: Colors.blue, // สีของไอคอนที่ถูกเลือก
        unselectedItemColor: Colors.white, // สีของไอคอนที่ไม่ได้เลือก
        backgroundColor: Colors.black, // สีพื้นหลังของ BottomNavigationBar
        onTap: _onItemTapped, // เรียกฟังก์ชันเมื่อไอคอนถูกเลือก
      ),
    );
  }
}