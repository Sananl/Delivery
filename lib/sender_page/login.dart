// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:geolocator/geolocator.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginState();
// }

// class _LoginState extends State<LoginPage> {
//   // Controllers for the form fields
//   final _phoneController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _addressController = TextEditingController();

//   // Variables for storing image and GPS
//   XFile? _image;
//   Position? _currentPosition;

//   // Method to pick image from gallery
//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = pickedImage;
//     });
//   }

//   // Method to get current location (GPS)
//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied');
//     }

//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _currentPosition = position;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register / Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Phone Number Input
//               TextFormField(
//                 controller: _phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(
//                   labelText: 'Phone Number',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16.0),

//               // Password Input
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16.0),

//               // Name Input
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16.0),

//               // Image Picker for Profile Picture
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: _pickImage,
//                     child: const Text('Pick Profile Image'),
//                   ),
//                   const SizedBox(width: 10),
//                   _image != null
//                       ? Image.file(
//                           File(_image!.path),
//                           width: 100,
//                           height: 100,
//                         )
//                       : const Text('No image selected'),
//                 ],
//               ),
//               const SizedBox(height: 16.0),

//               // Address Input
//               TextFormField(
//                 controller: _addressController,
//                 decoration: const InputDecoration(
//                   labelText: 'Address',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16.0),

//               // GPS Button and Display
//               ElevatedButton(
//                 onPressed: _getCurrentLocation,
//                 child: const Text('Get GPS Location'),
//               ),
//               const SizedBox(height: 10),
//               _currentPosition != null
//                   ? Text(
//                       'Lat: ${_currentPosition?.latitude}, Long: ${_currentPosition?.longitude}')
//                   : const Text('No location selected'),

//               const SizedBox(height: 24.0),

//               // Submit Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle form submission here
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
