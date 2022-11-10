import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final addressController = TextEditingController();
  ImageSource _imageSource = ImageSource.camera;

  String? gender;

  String? dob;

  String? images;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text("Sign Up page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " No Data was given....";
                  }
                  if (value.length > 20) {
                    return "Please enter less data";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Phone",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " No Data was given....";
                  }
                  if (value.length > 20) {
                    return "Please enter less data";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_pin),
                  labelText: "Address",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " No Data was given....";
                  }
                  if (value.length > 20) {
                    return "Please enter less data";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          _selectedDate();
                        },
                        child: Text("Select date of Birth")),
                    Text(dob == null ? "no data Selected" : dob!)
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Radio<String>(
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    Text("Male"),
                    Radio<String>(
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    Text("Female"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() {
        dob = DateFormat("dd/MM/yyyy").format(selectedDate);
      });
    }
  }
}
