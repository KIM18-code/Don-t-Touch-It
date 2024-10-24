import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashPhoneNumberController extends GetxController {
  final phoneNumberModel = Rx<PhoneNumberModel>(PhoneNumberModel());

  FirebaseAuth _auth = FirebaseAuth.instance;

  void updatePhoneNumber(String phoneNumber) {
    phoneNumberModel.update((model) {
      model?.phoneNumber = phoneNumber;
    });
  }

  Future<void> sendOtp() async {
    final phoneNumber = phoneNumberModel.value.phoneNumber;

    if (phoneNumber.isEmpty) {
      Get.snackbar('Error', 'Please enter a valid phone number');
      return;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: '+1$phoneNumber', // Replace with your country code if needed
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval scenario
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('Verification Failed', e.message ?? 'An error occurred');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save verificationId for later use
        phoneNumberModel.update((model) {
          model?.verificationId = verificationId;
        });
        Get.snackbar('Code Sent', 'OTP code sent to $phoneNumber');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        phoneNumberModel.update((model) {
          model?.verificationId = verificationId;
        });
      },
    );
  }

  Future<void> verifyOtp(String otp) async {
    try {
      String verificationId = phoneNumberModel.value.verificationId ?? '';
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      // Sign in with the credential
      await _auth.signInWithCredential(credential);
      Get.snackbar('Success', 'Phone number verified successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify OTP');
    }
  }
}

class PhoneNumberModel {
  String phoneNumber = '';
  String? verificationId;

  PhoneNumberModel({this.phoneNumber = '', this.verificationId});
}
