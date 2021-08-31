class KhachHang{
  var name;
  var age;

  KhachHang({this.name, this.age});
  @override
  String toString() {
    // TODO: implement toString
    return '${this.name} + ${this.age}';
  }
}