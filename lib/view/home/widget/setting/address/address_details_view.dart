import 'package:eccommerce4/controller/home/address/address_details_controller.dart';
import 'package:eccommerce4/core/class/data_handling_request.dart';
import 'package:eccommerce4/core/functions/validation.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:eccommerce4/core/shared/widgets/buttons/onboarding_Button.dart';
import 'package:eccommerce4/view/auth/widgets/authfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class AddressDetailsView extends StatelessWidget {
  const AddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address Details"),
      ),
      body: GetBuilder<AddressDetailsControllerImp>(
        builder: (controller) => DataHandlingRequsetState(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("City Name", style: Styles.textStyle20black),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: AuthField(
                        icon: Icons.location_city,
                        text: "City",
                        onsave: (value) {
                          controller.city = value!;
                        },
                        validator: (val) {
                          return validation(type: "Name", val: val!);
                        },
                      ),
                    ),
                    const Text("Street Name", style: Styles.textStyle20black),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: AuthField(
                        icon: Icons.streetview,
                        text: "Street",
                        onsave: (value) {
                          controller.streat = value!;
                        },
                        validator: (val) {
                          return validation(type: "Name", val: val!);
                        },
                      ),
                    ),
                    const Text("Address Name", style: Styles.textStyle20black),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: AuthField(
                        icon: Icons.location_history,
                        text: "Address",
                        onsave: (value) {
                          controller.addresNmae = value!;
                        },
                        validator: (val) {
                          return validation(type: "Name", val: val!);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: OnboardingButton(
                      text: "Add",
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          controller.addAddress();
                        }
                      },
                      width: Get.width,
                    ))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
