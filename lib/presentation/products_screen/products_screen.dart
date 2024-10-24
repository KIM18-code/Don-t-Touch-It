import 'controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/core/app_export.dart';
import 'package:grocery_app/widgets/custom_text_form_field.dart';

class ProductsScreen extends GetWidget<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: size.width,
                child: Column(
                  children: [
                    // Top section with image and header
                    Container(
                        height: getVerticalSize(50.00),
                        width: getHorizontalSize(374.00),
                        child: Stack(alignment: Alignment.centerLeft, children: [
                          CommonImageView(
                              imagePath: ImageConstant.imgMain13,
                              height: getVerticalSize(170.00),
                              width: getHorizontalSize(374.00)),
                          Container(
                            decoration: AppDecoration
                                .gradientGray5099WhiteA70099,
                            child: Padding(
                              padding: getPadding(left: 16, right: 243, top: 10),
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        onTapImgArrowleft();
                                      },
                                      child: CommonImageView(
                                          svgPath: ImageConstant.imgArrowleft,
                                          height: getSize(24.00),
                                          width: getSize(24.00))),
                                  SizedBox(width: 18),
                                  Text("Parts".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsSemiBold20),
                                ],
                              ),
                            ),
                          ),
                        ])),

                    // List of products
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.productList.length, // Assuming you have a product list in the controller
                        itemBuilder: (context, index) {
                          var product = controller.productList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                            child: Row(
                              children: [
                                // Product Image
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: EdgeInsets.all(0),
                                  color: ColorConstant.gray100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusStyle.roundedBorder9),
                                  child: Container(
                                    height: getVerticalSize(135.00),
                                    width: getHorizontalSize(164.00),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                        borderRadius: BorderRadiusStyle.roundedBorder9),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(getHorizontalSize(9.00)),
                                      child: CommonImageView(
                                          imagePath: product.imagePath,
                                          height: getVerticalSize(135.00),
                                          width: getHorizontalSize(164.00),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                
                                // Product Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name.tr,
                                        maxLines: 2,
                                        style: AppStyle.txtPoppinsRegular14Black900,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        product.price.toString(),
                                        style: AppStyle.txtPoppinsMedium16Yellow900
                                            .copyWith(letterSpacing: 0.60),
                                      ),
                                      SizedBox(height: 8),
                                      CustomTextFormField(
                                        width: 164,
                                        focusNode: FocusNode(),
                                        controller: controller.buttonswebsolController,
                                        hintText: "Exchange".tr,
                                        padding: TextFormFieldPadding.PaddingAll8,
                                        prefix: Container(
                                            margin: getMargin(
                                                left: 17, top: 11, right: 22, bottom: 10),
                                            child: CommonImageView(
                                                svgPath: ImageConstant.imgBag24X24)),
                                        prefixConstraints: BoxConstraints(
                                            minWidth: getSize(14.00),
                                            minHeight: getSize(14.00)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
