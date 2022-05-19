import 'package:flutter/material.dart';

class QueryField extends StatefulWidget {
  const QueryField({
    Key? key,
    required this.search,
    required this.queryTextEditingController,
  }) : super(key: key);

  final Function(String) search;
  final TextEditingController queryTextEditingController;
  @override
  _QueryFieldState createState() => _QueryFieldState();
}

class _QueryFieldState extends State<QueryField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.queryTextEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            width: 0.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        hintText: 'Search by base',
        suffixIcon: GestureDetector(
          onTap: () {
            widget.queryTextEditingController.clear();
          },
          child: Icon(
            Icons.cancel,
            color: Colors.grey[600],
          ),
        ),
      ),
      onChanged: widget.search,
      onSubmitted: widget.search,
    );
  }
}
