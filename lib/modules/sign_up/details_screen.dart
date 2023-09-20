import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:project_template/router/route_name.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dropdown_field.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final middleNameController = TextEditingController();
  final dateController = TextEditingController();

  String? selectedGender;
  String? selectedCountry;
  String? formattedDate;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd MMM yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormat('dd, MMM yyyy').format(selectedDate);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://www.onlinelogomaker.com/blog/wp-content/uploads/2017/09/fashion-logo-design.jpg',
                  width: 150,
                ),
                CustomText(
                  text:
                      'The full name and date of birth provided for registration should match with your Passport..',
                  textAlign: TextAlign.center,
                  style: AppTextTheme.common.bodySmall,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'First name',
                    textAlign: TextAlign.left,
                    style: AppTextTheme.common.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                CustomTextField(controller: nameController),
                SizedBox(height: 6.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Last name',
                    textAlign: TextAlign.left,
                    style: AppTextTheme.common.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                CustomTextField(controller: middleNameController),
                SizedBox(height: 6.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Date of Birth',
                    textAlign: TextAlign.left,
                    style: AppTextTheme.common.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Container(
                  height: 54,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: TextFormField(
                    onTap: () {
                      _selectDate(context);
                    },
                    controller: dateController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: formattedDate ?? 'dd mm yyyy',
                      contentPadding: EdgeInsets.only(top: 3, left: 10.h),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter a valid value.';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 6.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Gender',
                    textAlign: TextAlign.left,
                    style: AppTextTheme.common.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                CustomDropdownButton(
                  items: gender,
                  value: selectedGender,
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue!;
                    });
                  },
                  hintText: 'Please Select Gender',
                ),
                SizedBox(height: 6.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Nationality',
                    textAlign: TextAlign.left,
                    style: AppTextTheme.common.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                CustomDropdownButton(
                  items: country,
                  value: selectedCountry,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCountry = newValue!;
                    });
                  },
                  hintText: 'Please Select Nationality',
                ),
                SizedBox(height: 6.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Town/City',
                    textAlign: TextAlign.left,
                    style: AppTextTheme.common.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                const CustomTextField(),
                SizedBox(height: 6.h),
                CustomButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, RouteName.password);
                  }
                }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> gender = ["Male", "Female", "Other"];
  List<String> country = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Argentina",
    "Australia",
    "Austria",
    "Bangladesh",
    "Belarus",
    "Belgium",
    "Brazil",
    "Cambodia",
    "Canada",
    "Chile",
    "China",
    "Colombia",
    "Croatia",
    "Cuba",
    "Czechia (Czech Republic)",
    "Denmark",
    "Egypt",
    "Ethiopia",
    "Finland",
    "France",
    "Georgia",
    "Germany",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Italy",
    "Japan",
    "Kazakhstan",
    "Kenya",
    "Kuwait",
    "Lebanon",
    "Liberia",
    "Libya",
    "Malaysia",
    "Mexico",
    "Morocco",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nigeria",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Saudi Arabia",
    "Singapore",
    "South Africa",
    "South Korea",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Sweden",
    "Switzerland",
    "Thailand",
    "Turkey",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States of America",
    "Uzbekistan",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe"
  ];
}
