import 'dart:io';

import 'package:ama_clone/common/widgets/custom_button.dart';
import 'package:ama_clone/common/widgets/custom_text_field.dart';
import 'package:ama_clone/constants/utils.dart';
import 'package:ama_clone/features/admin/services/admin_services.dart';
import 'package:ama_clone/features/admin/widgets/admin_screen_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "/add-products";
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String category = 'Mobiles';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();

    super.dispose();
  }

  List<String> productCatagories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: adminAppBar(title: 'Add Product', showLogo: false),
        body: SingleChildScrollView(
          child: Form(
              key: _addProductFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    //Image picker
                    images.isNotEmpty
                        ? CarouselSlider(
                            items: images
                                .map((i) => Builder(
                                    builder: ((BuildContext context) =>
                                        Image.file(
                                          i,
                                          fit: BoxFit.cover,
                                          height: 200,
                                        ))))
                                .toList(),
                            options: CarouselOptions(
                                viewportFraction: 1, height: 200),
                          )
                        : GestureDetector(
                            onTap: selectImages,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [10, 4],
                                strokeCap: StrokeCap.round,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.folder_open, size: 40),
                                        const SizedBox(height: 15),
                                        Text(
                                          'Select Product Images',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[400]),
                                        )
                                      ]),
                                )),
                          ),
                    const SizedBox(height: 30),
                    //Text Fields
                    CustomTextField(
                        controller: productNameController,
                        hintText: 'Product Name'),
                    CustomTextField(
                        controller: descriptionController,
                        hintText: 'Description',
                        maxLines: 4),
                    CustomTextField(
                        controller: priceController, hintText: 'Price'),
                    CustomTextField(
                        controller: quantityController, hintText: 'Quantity'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                        value: category,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: productCatagories.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            category = newValue!;
                          });
                        },
                      ),
                    ),
                    CustomButton(text: 'Sell', onTap: sellProduct),
                  ],
                ),
              )),
        ));
  }
}
