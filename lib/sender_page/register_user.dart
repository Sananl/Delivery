import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isRider = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController gpsController = TextEditingController();
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();
  LatLng? selectedPosition;

  final CollectionReference users = FirebaseFirestore.instance.collection('User');

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  void _selectLocationFromMap() async {
    LatLng? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectLocationMap(
          initialPosition: selectedPosition ?? const LatLng(13.7563, 100.5018),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedPosition = result;
        gpsController.text =
            'Lat: ${result.latitude}, Lng: ${result.longitude}';
      });
    }
  }

  Future<bool> _checkPhoneNumberUnique(String phone) async {
    final QuerySnapshot result = await users.where('phone', isEqualTo: phone).get();
    return result.docs.isEmpty; // คืนค่า true หรือ false
  }

  void _registerUser() async {
    if (phoneController.text.trim().isEmpty || 
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty || 
        nameController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        gpsController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    bool isPhoneUnique = await _checkPhoneNumberUnique(phoneController.text.trim());
    if (!isPhoneUnique) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone number already exists")),
      );
      return;
    }

    // Create user data
    Map<String, dynamic> userData = {
      "phone": phoneController.text,
      "password": passwordController.text,
      "name": nameController.text,
      "address": addressController.text,
      "GPS": GeoPoint(
        selectedPosition?.latitude ?? 0.0,
        selectedPosition?.longitude ?? 0.0,
      ),
      "image": "", // Can upload later
    };

    // Upload image if available
    if (selectedImage != null) {
      String imageUrl = await _uploadImageToFirebase(selectedImage!);
      userData["image"] = imageUrl;
    }

    // Add user data to Firestore
    try {
      DocumentReference docRef = await users.add(userData); // Add new document
      await users.doc(docRef.id).update({"uid": docRef.id}); // Update uid
      print("User Registered: ${docRef.id}");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User registered successfully")),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to register: $error")),
      );
    }
  }

  Future<String> _uploadImageToFirebase(File image) async {
    String fileName = image.path.split('/').last;
    Reference storageRef = FirebaseStorage.instance.ref().child('images/$fileName');

    UploadTask uploadTask = storageRef.putFile(image);
    TaskSnapshot snapshot = await uploadTask;

    return await snapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        actions: [
          Switch(
            value: isRider,
            onChanged: (value) {
              setState(() {
                isRider = value;
              });
            },
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.grey,
          ),
          Text(isRider ? 'Rider' : 'User'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: gpsController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'GPS Coordinates',
                  border: OutlineInputBorder(),
                ),
                onTap: _selectLocationFromMap,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Select Image'),
              ),
              if (selectedImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.file(
                    selectedImage!,
                    height: 150,
                    width: 150,
                  ),
                ),
              if (isRider) const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _registerUser,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectLocationMap extends StatefulWidget {
  final LatLng initialPosition;

  const SelectLocationMap({Key? key, required this.initialPosition})
      : super(key: key);

  @override
  State<SelectLocationMap> createState() => _SelectLocationMapState();
}

class _SelectLocationMapState extends State<SelectLocationMap> {
  LatLng? selectedPosition;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    selectedPosition = widget.initialPosition;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (selectedPosition != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(selectedPosition!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, selectedPosition);
            },
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: selectedPosition ?? const LatLng(13.7563, 100.5018),
          zoom: 15.0,
        ),
        onTap: (LatLng position) {
          setState(() {
            selectedPosition = position;
          });
        },
        markers: selectedPosition != null
            ? {
                Marker(
                  markerId: const MarkerId('selected_location'),
                  position: selectedPosition!,
                ),
              }
            : {},
      ),
    );
  }
}
