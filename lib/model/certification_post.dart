class Certification {
  final String path;
  final String recieptId;

  Certification({this.path, this.recieptId});

  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      recieptId: json['recieptId'],
      path: json['path'],
    );
  }
}
