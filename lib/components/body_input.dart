import 'package:flutter/material.dart';

class BodyInput extends StatefulWidget {
  final String label;
  final String placeholder;
  final Function handleChange;
  final bool readOnly;
  const BodyInput({
    Key key,
    this.label = 'default label',
    this.handleChange,
    this.readOnly = true,
    this.placeholder = 'default placeholder',
  }) : super(key: key);

  @override
  _BodyInputState createState() => _BodyInputState();
}

class _BodyInputState extends State<BodyInput> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextField(
          onChanged: (value) {
            widget.handleChange(value);
          },
          readOnly: widget.readOnly,
          decoration: InputDecoration(
              hintText: widget.placeholder, contentPadding: EdgeInsets.all(2)),
        ),
      ],
    );
  }
}
