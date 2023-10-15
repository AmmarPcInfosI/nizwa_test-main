import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:nizwa_test/models/attractions_model.dart';

const _rabbitImagePath = 'lib/assets/bg.jpeg';
const _deerImagePath = 'lib/assets/bg.jpeg';

List<AttractionsModel> attractions = [
  AttractionsModel('قلعة نزوى', 'lib/assets/bg.jpeg', '', '', '', 0, '', ''),
];

class BottomSheetBasedOnContentHeight2 extends StatelessWidget {
  const BottomSheetBasedOnContentHeight2({super.key});

  void _openBottomSheetWithInfo(BuildContext context, AttractionsModel animal) {
    showFlexibleBottomSheet<void>(
      isExpand: true,
      isCollapsible: false,
      minHeight: 0.3,
      initHeight: 0.4,
      maxHeight: 0.8,
      context: context,
      bottomSheetColor: Colors.white,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(300),
        ),
      ),
      bottomSheetBorderRadius: BorderRadius.circular(40),
      builder: (context, controller, offset) {
        return _BottomSheet(
          animal: animal,
          controller: controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openBottomSheetWithInfo(context, attractions[0]),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  final AttractionsModel animal;
  final ScrollController controller;

  const _BottomSheet({
    required this.animal,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          Text(
            animal.Name!,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
          const SizedBox(height: 16),
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'وصف',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'وصف',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'وصف',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Text(
                  animal.Description!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
