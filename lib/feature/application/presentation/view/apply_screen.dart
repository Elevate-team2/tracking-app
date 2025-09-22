import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Apply',
          style: TextStyle(fontWeight: FontWeight.bold
            ,
            fontSize: 26,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sw * 0.05,
            vertical: sh * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome!!",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: sh * 0.01),
              Text("You want to be a delivery man? \n Join our team ",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey
              ),),
              SizedBox(height: sh * 0.02),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Country",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                value: "Egypt", // Set initial value to "Egypt" to match the image
                items: const [
                  DropdownMenuItem(value: "Egypt", child: Text("🇪🇬 Egypt")),
                  DropdownMenuItem(value: "UAE", child: Text("🇦🇪 UAE")),
                  DropdownMenuItem(value: "KSA", child: Text("🇸🇦 Saudi Arabia")),
                ],
                onChanged: (val) {},
              ),              SizedBox(height: sh * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "First legal name",
                  hintText: "Enter first legal name",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: sh * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Second legal name",
                  hintText: "Enter second legal name",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: sh * 0.02),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Vehicle type",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,

                ),
                value: "Car", // Set initial value to "Egypt" to match the image
                items: const [
                  DropdownMenuItem(value: "Car", child: Text("Car")),
                  DropdownMenuItem(value: "Bike", child: Text("Bike")),
                  DropdownMenuItem(value: "Truck", child: Text("Truck")),
                ],
                onChanged: (val) {},
              ),
              SizedBox(height: sh * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Vehicle number",
                  hintText: "Enter vehicle number",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: sh * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Vehicle license",
                  hintText: "Upload license photo",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(Icons.upload_file),
                ),
                readOnly: true,
                onTap: () {
                  // TODO: Pick file/image
                },
              ),              SizedBox(height: sh * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: sh * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Phone number",
                  hintText: "Enter phone number",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: sh * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "ID number",
                  hintText: "Enter national ID number",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: sh * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "ID image",
                  hintText: "Upload ID image",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(Icons.upload_file),
                ),
                readOnly: true,
                onTap: () {
                  // TODO: Pick file/image
                },
              ),
              SizedBox(height: sh * 0.02),
              SizedBox(height: sh * 0.02),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Enter password",
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirm password",
                        hintText: "Confirm password",
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: sh * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Gender",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  const SizedBox(width: 20),
                  // Female
                  Row(
                    children: [
                      Radio<String>(
                        value: "female",
                        groupValue: "gender",
                        onChanged: (val) {},
                      ),
                      const Text("Female"),
                    ],
                  ),
                  const SizedBox(width: 20),
                  // Male
                  Row(
                    children: [
                      Radio<String>(
                        value: "male",
                        groupValue: "gender",
                        onChanged: (val) {},
                      ),
                      const Text("Male"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: sh * 0.02),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () {
                    // TODO: Submit
                  },
                  child: const Text("Continue",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}