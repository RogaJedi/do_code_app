enum RowItemType {
  text,
  dropZone,
}

class RowItem {
  final RowItemType type;
  final String? text;
  final String? id;

  const RowItem.text(this.text)
      : type = RowItemType.text,
        id = null;

  const RowItem.drop(this.id)
      : type = RowItemType.dropZone,
        text = null;
}