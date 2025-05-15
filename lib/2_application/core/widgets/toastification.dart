import 'package:vicefree/2_application/core/services/sizedbox_service.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

toastificationLocationDisabled(BuildContext context, String message,
    bool? closeOnClick, Duration? autoCloseDuration) {
  toastification.show(
    type: ToastificationType.error,
    context: context,
    title: const Text('Error'),
    description: Column(
      children: [
        Text(message),
        const Text('Go to settings'),
      ],
    ),
    alignment: Alignment.center,
    showProgressBar: false,
    closeOnClick: closeOnClick ?? true,
    autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
  );
}

toastificationInfo(BuildContext context, String message, bool? closeOnClick,
    Duration? autoCloseDuration) {
  toastification.show(
    context: context,
    backgroundColor: Theme.of(context).colorScheme.secondary,
    type: ToastificationType.info,
    title: const Text('Call Disconnected'),
    description: Text(message),
    foregroundColor: Colors.white,
    alignment: Alignment.topCenter,
    showProgressBar: false,
    closeOnClick: closeOnClick ?? true,
    autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
  );
}

toastificationError(BuildContext context, String message, bool? closeOnClick,
    Duration? autoCloseDuration) {
  var color = Theme.of(context).colorScheme;

  toastification.show(
    type: ToastificationType.error,
    context: context,
    title: const Text('Error'),
    description: Text(
      message,
      softWrap: true,
      style: const TextStyle(fontSize: 14),
    ),
    alignment: Alignment.topCenter,
    showProgressBar: false,
    backgroundColor: color.secondary,
    foregroundColor: Colors.white,
    primaryColor: Colors.red,
    closeOnClick: closeOnClick ?? true,
    autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
  );
}

toastificationSuccess(
    BuildContext context,
    String message,
    bool? closeOnClick,
    Duration? autoCloseDuration,
    Function(ToastificationItem)? onAutoCompleteCompleted,
    bool? showProgressBar) {
  toastification.show(
    context: context,
    icon: const Icon(
      Icons.check,
      color: Colors.green,
    ),
    title: const Text('Success'),
    description: Text(message),
    primaryColor: Colors.black,
    alignment: Alignment.bottomRight,
    showProgressBar: showProgressBar,
    closeOnClick: closeOnClick ?? true,
    autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
    callbacks: ToastificationCallbacks(
        onAutoCompleteCompleted: onAutoCompleteCompleted),
  );
}

toastificationWarning(BuildContext context, String message, bool? closeOnClick,
    Duration? autoCloseDuration) {
  toastification.show(
    context: context,
    icon: const Icon(
      Icons.warning,
      color: Colors.orange,
    ),
    title: const Text('Error'),
    description: Text(message),
    alignment: Alignment.bottomRight,
    showProgressBar: false,
    closeOnClick: closeOnClick ?? true,
    autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
  );
}

toastificationCustom(BuildContext context, String title, String message,
    bool? closeOnClick, Duration? autoCloseDuration, Function() onTap) {
  toastification.showCustom(
    context: context,
    alignment: Alignment.topCenter,
    autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
    builder: (BuildContext context, ToastificationItem holder) {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.3), // Shadow color with opacity
                  blurRadius: 8, // Spread of the blur
                  offset: Offset(2, 4), // Position of the shadow (x, y)
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.warning,
                  color: Colors.orange,
                ),
                SizedboxService.w15,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text(message, style: const TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
