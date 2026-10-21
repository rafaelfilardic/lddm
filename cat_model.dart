class CatImage {
  final String id;
  final String url;

  CatImage({required this.id, required this.url});

  factory CatImage.fromMap(Map<String, dynamic> map) {
    return CatImage(
      id: map['id']?.toString() ?? 'id_desconhecido',
      url: map['url']?.toString() ?? '',
    );
  }
}
