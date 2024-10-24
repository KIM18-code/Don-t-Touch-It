import './controller/splash_phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/core/app_export.dart';

class SplashPhoneNumberScreen extends GetWidget<SplashPhoneNumberController> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(
      text: controller.phoneNumberModel.value.phoneNumber,
    );

    controller.phoneNumberModel.listen((phoneNumberModel) {
      textController.text = phoneNumberModel.phoneNumber;
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(361.00),
                    width: getHorizontalSize(374.00),
                    margin: getMargin(left: 1),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: getVerticalSize(167.00),
                            width: getHorizontalSize(374.00),
                            margin: getMargin(bottom: 10),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CommonImageView(
                                    imagePath: ImageConstant.imgMain121,
                                    height: getVerticalSize(167.00),
                                    width: getHorizontalSize(374.00),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CommonImageView(
                                    imagePath: ImageConstant.imgRectangle171,
                                    height: getVerticalSize(167.00),
                                    width: getHorizontalSize(374.00),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: getPadding(left: 10, top: 10, right: 10),
                            child: CommonImageView(
                              svgPath: ImageConstant.imgUndrawpersonal,
                              height: getVerticalSize(293.00),
                              width: getHorizontalSize(353.00),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(left: 16, top: 52, right: 16),
                  child: Text(
                    "msg_enter_your_mobi".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium20Bluegray800,
                  ),
                ),
                Container(
                  width: getHorizontalSize(314.00),
                  margin: getMargin(left: 16, top: 14, right: 16),
                  child: Text(
                    "msg_we_need_to_veri".tr,
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular14Bluegray800b7,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(274.00),
                    width: getHorizontalSize(374.00),
                    margin: getMargin(left: 1, top: 9),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: getPadding(top: 10),
                            child: CommonImageView(
                              imagePath: ImageConstant.imgMain122,
                              height: getVerticalSize(151.00),
                              width: getHorizontalSize(374.00),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: AppDecoration.fillWhiteA7008c,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      getMargin(left: 15, top: 35, right: 15),
                                  decoration:
                                      AppDecoration.fillBluegray50.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder9,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                            left: 16, top: 14, bottom: 14),
                                        child: CommonImageView(
                                          svgPath: ImageConstant.imgCall24X24,
                                          height: getSize(24.00),
                                          width: getSize(24.00),
                                        ),
                                      ),
                                      Expanded(
                                        // Use Expanded to ensure TextField takes available space
                                        child: Padding(
                                          padding: getPadding(
                                              left: 11, top: 17, bottom: 17),
                                          child: Obx(() {
                                            return TextField(
                                              onChanged: (value) {
                                                controller.updatePhoneNumber(
                                                    value); // Updates the phone number in the controller
                                              },
                                              controller:
                                                  textController, // Use the persistent controller
                                              decoration: InputDecoration(
                                                hintText: controller
                                                        .phoneNumberModel
                                                        .value
                                                        .phoneNumber
                                                        .isEmpty
                                                    ? "lbl_phone_number"
                                                        .tr // Placeholder text when empty
                                                    : null, // Otherwise, no hint
                                                border: InputBorder
                                                    .none, // Removes underline border
                                              ),
                                              style: AppStyle
                                                  .txtPoppinsRegular16Bluegray800a9
                                                  .copyWith(
                                                letterSpacing: 0.44,
                                              ),
                                              keyboardType: TextInputType
                                                  .phone, // Ensures phone keyboard
                                            );
                                          }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Padding(
                                //   padding: getPadding(left: 15, right: 15),
                                //   child: TextField(
                                //     onChanged: (value) {
                                //       controller.updatePhoneNumber(value);
                                //     },
                                //     decoration: InputDecoration(
                                //       labelText: "Enter your phone number",
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(8),
                                //       ),
                                //     ),
                                //     keyboardType: TextInputType.phone,
                                //   ),
                                // ),
                                GestureDetector(
                                  onTap: () {
                                    if (controller.phoneNumberModel.value
                                        .phoneNumber.isNotEmpty) {
                                      controller
                                          .sendOtp(); // Sends OTP to the entered phone number
                                    } else {
                                      Get.snackbar('Error',
                                          'Please enter a valid phone number');
                                    }
                                  },
                                  child: Container(
                                    margin: getMargin(
                                        left: 15,
                                        top: 74,
                                        right: 15,
                                        bottom: 34),
                                    decoration: AppDecoration.fillLightgreenA700
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder9,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              getPadding(top: 16, bottom: 15),
                                          child: Text(
                                            "lbl_next".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPoppinsMedium16WhiteA700,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                              left: 121,
                                              top: 12,
                                              right: 16,
                                              bottom: 12),
                                          child: CommonImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightWhiteA700,
                                            height: getSize(24.00),
                                            width: getSize(24.00),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
