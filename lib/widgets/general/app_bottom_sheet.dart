part of kh_easy_dev;

class AppBottomSheet extends StatelessWidget {
  final String? collapseText;
  final String? expandedText;
  final TextStyle? expandedTextStyle;
  final TextStyle? buttonsTextStyle;
  final List<BottomSheetItemsModel> items;
  const AppBottomSheet({
    super.key,
    this.expandedText,
    this.collapseText,
    this.expandedTextStyle,
    this.buttonsTextStyle,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openBottomSheet(context),
      onVerticalDragEnd: (details) => _openBottomSheet(context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: _containerDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _collapseContainerGreyLine(),
              if (collapseText != null)
                Text(
                  collapseText!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _openBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return _expandedContainer(context);
      },
    );
  }

  Container _expandedContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: _containerDecoration(),
      constraints: const BoxConstraints(minHeight: 60),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _collapseContainerGreyLine(),
              if (expandedText != null)
                Text(
                  expandedText!,
                  style: expandedTextStyle ??
                      const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: items
                    .map(
                      (item) => ListTile(
                        leading: item.icon,
                        title: Text(item.text, style: buttonsTextStyle),
                        onTap: item.onTap,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _collapseContainerGreyLine() {
    return Container(
      height: 4,
      width: 40,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(0, -4),
        ),
      ],
    );
  }
}
