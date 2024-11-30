// ignore_for_file: public_member_api_docs, sort_constructors_first

class ColorAttributes {
  final String id;
  final bool isTwin;
  final String name;
  final String colorValue;

  ColorAttributes(
      {required this.id,
      required this.isTwin,
      required this.name,
      required this.colorValue});

  @override
  bool operator ==(covariant ColorAttributes other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.isTwin == isTwin &&
      other.name == name &&
      other.colorValue == colorValue;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      isTwin.hashCode ^
      name.hashCode ^
      colorValue.hashCode;
  }
}
