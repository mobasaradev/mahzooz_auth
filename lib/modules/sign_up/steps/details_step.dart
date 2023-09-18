import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:project_template/modules/widgets/custom_dropdown_field.dart';
import 'package:project_template/modules/widgets/custom_text_field.dart';

import '../../../theme/app_text_theme.dart';
import '../../widgets/custom_text.dart';

class DetailsStep extends StatefulWidget {
  const DetailsStep({super.key});

  @override
  State<DetailsStep> createState() => _DetailsStepState();
}

class _DetailsStepState extends State<DetailsStep> {
  final nameController = TextEditingController();
  final middleNameController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String? selectedGender;
  String? selectedCountry;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd, MMM yyyy').format(selectedDate);
    return Form(
      child: Column(
        children: [
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
              text: 'Middle and Last name',
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
          CustomTextField(
            hintText: formattedDate,
            onTap: () {
              _selectDate(context);
            },
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
              text: 'Country of Residence',
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
            hintText: 'Please Select Country',
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
          const CustomTextField()
        ],
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
