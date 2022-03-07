import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key, required this.text, required this.onChanged})
      : super(key: key);
  final String text;
  final Function(String) onChanged;
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blueGrey)),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.search,
              color: Colors.blueGrey,
              size: 25,
            ),
            suffixIcon: widget.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _searchController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.blueGrey,
                      size: 25,
                    ))
                : null,
            hintText: 'Name or description of beer',
            border: InputBorder.none),
        onChanged: widget.onChanged,
      ),
    );
  }
}
