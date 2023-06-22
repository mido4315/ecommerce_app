import 'dart:io';

import 'package:ecommerce_app/core/constants/app_styles.dart';
import 'package:ecommerce_app/core/widgets/pick_images.dart';
import 'package:ecommerce_app/widgets/custom_images_slider.dart';
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

  // initialize images list
  List<File> images = [];

  // create image pick method

  void pickProductImage() async {
    List<File> result = await pickImages();
    setState(() {
      images = result;
    });
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
              images.isNotEmpty
                  ? SizedBox(
                width: double.infinity,
                height: 165.h,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: CustomImagesSlider(
                          isFile: true,
                          images: images,
                        ),
                    ),
                  )
                  : CustomDottedBox(
                      onTap: pickProductImage,
                    ),
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
                maxLines: 2,
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
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25, bottom: 18),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Category',
                        style: AppStyles.textStyleTitle22,
                      ),
                      DropdownButton(
                        alignment: Alignment.center,
                        borderRadius: BorderRadius.circular(20),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: categories.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            alignment: Alignment.center,
                            child: Text(
                              e,
                              textAlign: TextAlign.center,
                            ),
                          );
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
              SizedBox(
                width: 300.w,
                height: 60.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'add',
                    style: AppStyles.textStyleTitle30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}