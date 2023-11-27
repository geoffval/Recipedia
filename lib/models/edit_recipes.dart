import 'package:flutter/material.dart';

class EditDataDialog extends StatefulWidget {
  final String initialData;

  EditDataDialog({required this.initialData});

  @override
  _EditDataDialogState createState() => _EditDataDialogState();
}

class _EditDataDialogState extends State<EditDataDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialData);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Data'),
      content: TextField(
        controller: _controller,
        maxLines: null, // Allow multiple lines
        decoration: InputDecoration(
          labelText: 'Edit Data',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog without saving
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(_controller.text); // Return edited data
          },
          child: Text('Save Changes'),
        ),
      ],
    );
  }
}