import 'dart:io';

import 'package:ecommerce_app/core/constants/app_styles.dart';
import 'package:ecommerce_app/core/widgets/pick_images.dart';
import 'package:ecommerce_app/widgets/custom_images_slider.dart';
import 'package:ecommerce_app/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_snack_bar.dart';
import '../view model/add new product cubit/add_new_product_cubit.dart';
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
    'Laptop',
    'Hard Drives',
    'RAM',
    'Graphics Cards',
    'Monitor',
    'SSDs',
    'Printer',
    'Cables and Connectors',
    'Power Supplies',
  ];
  String selected = 'Hard Drives';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewProductCubit, AddNewProductState>(
      listener: (context, state) {
        if (state is AddNewProductFailure) {
          customSnackBar(context, state.errorMessage);
        } else if (state is AddNewProductSuccess) {
          customSnackBar(context, 'Product added successfully');
        }
      },
      child: Scaffold(
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
                            images: images, autoPlay: false,
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
                              selected = value ?? 'Hard Drives';
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
                    onPressed: () {
                      if (_addNewProductKey.currentState!.validate() &&
                          images.isNotEmpty) {
                        BlocProvider.of<AddNewProductCubit>(context).addProduct(
                          name: _nameController.text,
                          description: _descriptionController.text,
                          price: double.parse(_priceController.text),
                          quantity: int.parse(_quantityController.text),
                          category: selected,
                          images: images,
                        );
                      }
                    },
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
      ),
    );
  }
}