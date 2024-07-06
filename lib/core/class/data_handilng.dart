import 'package:flutter/widgets.dart';
import '../constant/lotties/Offine_lottie.dart';
import '../constant/lotties/empty_lottie.dart';
import '../constant/lotties/error404_lottie.dart';
import '../constant/lotties/loading_lottie.dart';
import 'statuscode.dart';

class DataHandlingState extends StatelessWidget {
  const DataHandlingState(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: LoadingLottie())
        : statusRequest == StatusRequest.offlineFailure
            ? const Center(child: Offline())
            : statusRequest == StatusRequest.serverFailure
                ? const Center(child: Error404())
                : statusRequest == StatusRequest.failure
                    ? const Center(child: EmptyLottie())
                    : widget;
  }
}
