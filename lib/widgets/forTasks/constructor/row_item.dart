enum RowItemType {
  text,
  dropZone,
}

class RowItem {
  final RowItemType type;
  final String? text;

  const RowItem.text(this.text) : type = RowItemType.text;
  const RowItem.drop() : type = RowItemType.dropZone, text = null;
}