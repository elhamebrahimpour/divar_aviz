import 'package:flutter/material.dart';

class SearchInputWidget extends StatefulWidget {
  final TextTheme textTheme;
  final Function? onSearched;

  const SearchInputWidget({
    super.key,
    required this.textTheme,
    this.onSearched,
  });

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.grey[200]!,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                hintText: '...جستجو ',
                hintStyle: widget.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[400],
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  right: 8,
                  left: 8,
                  bottom: 12,
                ),
              ),
              onChanged: (query) => widget.onSearched,
            ),
          ),
          Image.asset('assets/images/icon_search.png'),
        ],
      ),
    );
  }
}
