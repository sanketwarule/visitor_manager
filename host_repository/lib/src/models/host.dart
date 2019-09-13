class Host {

  final String id;
  final String name;
  final String designation;
  final String mobile;
  final String imageUrl;

  Host({
    String id,
    String name,
    String designation,
    String mobile,
    String imageUrl})
      : this.id = id ?? "",
        this.name = name ?? "",
        this.designation = designation ?? "",
        this.mobile = mobile ?? "",
        this.imageUrl = imageUrl ?? "";

  Host copyWith(
      {String id,
        String name,
        String mobile,
        String designation,
      String imageUrl}) {
    return Host(
        name: name,
        mobile: mobile,
        designation: designation,
        imageUrl: imageUrl,);
  }
}