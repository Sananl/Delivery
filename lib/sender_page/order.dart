import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // นำเข้าคลาสที่จำเป็น

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // ตัวอย่างข้อมูลสินค้า
  final List<String> _orderItems = ['Item 1', 'Item 2', 'Item 3'];

  // พิกัดของ Shipment
  final List<LatLng> _shipmentLocations = [
    LatLng(13.736717, 100.523186), // ตัวอย่างพิกัด
    LatLng(13.751597, 100.501154),
    LatLng(13.754546, 100.503989),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // รายการสินค้า
            Text(
              'รายการสินค้า:',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _orderItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[800],
                    child: ListTile(
                      title: Text(
                        _orderItems[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),

            // แผนที่
            SizedBox(height: 20),
            Text(
              'พิกัดของ Shipment:',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Container(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(13.736717, 100.523186), // ตำแหน่งเริ่มต้น
                  zoom: 10,
                ),
                markers: _shipmentLocations.map((location) {
                  return Marker(
                    markerId: MarkerId(location.toString()),
                    position: location,
                  );
                }).toSet(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
