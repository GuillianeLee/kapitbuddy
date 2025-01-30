import 'package:flutter/material.dart';
import 'profilesetup2.dart';

class ProfilesetupWidget extends StatefulWidget {
  @override
  _ProfilesetupWidgetState createState() => _ProfilesetupWidgetState();
}

class _ProfilesetupWidgetState extends State<ProfilesetupWidget> {
  String? _selectedProvince;
  String? _selectedCity;
  String? _selectedBarangay;

  List<String> _provinces = [
    'Province 1',
    'Province 2',
    // ... forda add
  ];

  List<String> _cities = [
    'Caloocan',
    'Las Piñas',
    'Makati',
    'Malabon',
    'Mandaluyong',
    'Marikina',
    'Muntinlupa',
    'Navotas',
    'Parañaque',
    'Pasay',
    'Pasig',
    'Quezon City',
    'San Juan',
    'Taguig',
    'Valenzuela',
  ];

  List<String> _barangays = [
    'Barangay 1',
    'Barangay 2',
    // ... add more barangays based on selected city
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60), // top spacing

              Text(
                '1 out of 4',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              Text(
                'Set up your profile',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              Text(
                'First name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              SizedBox(height: 2),

              // First Name Field
              _buildTextField("First name"),
              SizedBox(height: 20),

              Text(
                'Middle name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              SizedBox(height: 2),

              // Middle Name Field
              _buildTextField("Middle name"),
              SizedBox(height: 20),

              Text(
                'Last name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              SizedBox(height: 2),

              // Last Name Field
              _buildTextField("Last name"),
              SizedBox(height: 20),

              Text(
                'Date of Birth',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              SizedBox(height: 2),

              // Date of Birth Field
              _buildTextField("dd/MM/yyyy"),
              SizedBox(height: 20),

              Text(
                'Phone Number',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              SizedBox(height: 2),

              // Phone Number Field
              _buildTextField("+63"),
              SizedBox(height: 20),

              // Province Dropdown
              _buildDropdown(
                  'Province/Territory', _provinces, _selectedProvince, (
                  newValue) {
                setState(() {
                  _selectedProvince = newValue;
                  // Update cities and barangays
                  _cities = ['Please select your municipality'];
                  _selectedCity = null;
                  _barangays = ['Please select your barangay'];
                  _selectedBarangay = null;
                });
              }),
              SizedBox(height: 20),

              // City Dropdown
              _buildDropdown(
                'City/Municipality',
                _cities,
                _selectedCity,
                    (newValue) {
                  setState(() {
                    _selectedCity = newValue;
                    _barangays = [
                      'Please select your barangay'
                    ]; // Reset barangays when city is changed
                    _selectedBarangay = null;
                  });
                },
              ),
              SizedBox(height: 20),

              // Barangay Dropdown
              _buildDropdown(
                  'Barangay', _barangays, _selectedBarangay, (newValue) {
                setState(() {
                  _selectedBarangay = newValue;
                });
              }),
              SizedBox(height: 20),
              // Add other fields and buttons as needed

              Text(
                'Postal Code',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              SizedBox(height: 2),

              // Date of Birth Field
              _buildTextField("Postal Code"),
              SizedBox(height: 20),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskPreferencesScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(69, 178, 143, 1),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildDropdown(String label,
      List<String> items,
      String? selectedValue,
      Function(String?) onChanged,) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: (newValue) => onChanged(newValue),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: label,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}