import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Short (less than 60 min)'),
              leading: Radio<int>(
                value: 1,
                groupValue: null,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: const Text('Medium (1 to 2 hours)'),
              leading: Radio<int>(
                value: 2,
                groupValue: null,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: const Text('Long (more than 2 hours)'),
              leading: Radio<int>(
                value: 3,
                onChanged: (value) {},
                groupValue: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
