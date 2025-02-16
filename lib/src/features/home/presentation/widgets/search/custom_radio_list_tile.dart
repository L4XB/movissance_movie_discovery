import 'package:flutter/material.dart';

class CustomRadioListTile extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  const CustomRadioListTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: GestureDetector(
        onTap: () => onChanged(value),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: groupValue == value ? Colors.blue : Colors.grey,
              width: 2.5,
            ),
          ),
          child: groupValue == value
              ? Center(
                  child: Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.blue,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
