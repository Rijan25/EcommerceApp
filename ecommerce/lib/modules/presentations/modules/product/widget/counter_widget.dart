import 'package:ecommerce/core/services/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterButton extends StatefulWidget {
  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _count = 1;

  void _decrement() {
    if (_count > 0) {
      Get.snackbar("Product Removed");
      setState(() {
        _count--;
      });
    }
  }

  void _increment() {
    setState(() {
      Get.snackbar("New Product Added", color: Colors.teal);
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      margin: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        color: Colors.blue.shade900, // Background color
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: _decrement,
            icon: const Icon(Icons.remove, color: Colors.white),
          ),
          Text(
            '$_count',
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: _increment,
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
