import 'package:ecommerce_app/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/widgets/simpe_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_dotted_box.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  // form global key
  final _addNewProductKey = GlobalKey<FormState>();

  // text editing controllers
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  // dispose text editing controllers
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
  }

  final List<String> categories = [
    'Hard Drives',
    'RAM',
    'Graphics Cards',
    'Monitor',
    'SSDs',
    'Printer',
    'Cables and Connectors',
    'Power Supplies',
  ];
  String? selected = 'Hard Drives';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Add New Product'),
      body: SingleChildScrollView(
        child: Form(
          key: _addNewProductKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomDottedBox(),
              CustomTextFormField(
                controller: _nameController,
                hintText: 'Name',
                obscureText: false,
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                controller: _descriptionController,
                hintText: 'Description',
                obscureText: false,
                maxLines: 3,
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                controller: _priceController,
                hintText: 'Price',
                obscureText: false,
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                controller: _quantityController,
                hintText: 'quantity',
                obscureText: false,
              ),
              SizedBox(height: 15.h),
              DropdownButton(
                borderRadius: BorderRadius.circular(20),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: categories.map((e) {
                  return DropdownMenuItem(value: e,child: Text(e),);
                }).toList(),
                value: selected,
                onChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}