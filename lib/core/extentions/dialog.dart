import 'package:flutter/material.dart';

extension Dialog on BuildContext {
  void showLoading() {
    showDialog(
        context: this,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()));
  }

  void hideLoading() => Navigator.of(this).pop();

  void showError(String? message) {
    showDialog(
        context: this,
        builder: (_) => AlertDialog(
              content: Text(message ?? "Something went wrong"),
            ));
  }

  void showConfirm(
      {required String title,
      required String body,
      required VoidCallback onConfirm}) {
    showDialog(
        context: this,
        builder: (_) =>
            AlertDialog(title: Text(title), content: Text(body), actions: [
              ElevatedButton(
                  onPressed: () => Navigator.of(this).pop(),
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: onConfirm,
                child: const Text("Confirm"),
              )
            ]));
  }
}
