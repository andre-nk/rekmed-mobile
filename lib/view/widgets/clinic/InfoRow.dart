import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final Function(String)? onSave;

  const InfoRow({super.key, required this.title, required this.value, this.onSave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController controller = TextEditingController(text: value);
                  return Theme(
                    data: Theme.of(context).copyWith(
                      textSelectionTheme: const TextSelectionThemeData(
                        cursorColor: Colors.teal,
                        selectionHandleColor: Colors.teal,
                      ),
                    ),
                    child: AlertDialog(
                      title: Text('Edit $title'),
                      content: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: title,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.teal),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.teal),
                          ),
                          onPressed: () {
                            if (onSave != null) {
                              onSave!(controller.text);
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
