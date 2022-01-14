import 'package:flutter/material.dart';

class ModalTrigger extends StatelessWidget {
  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showModalBottomSheet(context);
      },
      backgroundColor: Colors.white,
      child: const Text(
        "?",
        style: TextStyle(fontSize: 25),
      ),
      foregroundColor: Colors.black,
    );
  }
}
