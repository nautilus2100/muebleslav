class Model {
  final String name;
  final String price;
  final String description;
  final String detalles;
  final String category;
  final List image;
  final String precios;
  final String preciosPVC;
  final String profundidades;

  Model({
    required this.name,
    required this.price,
    required this.precios,
    required this.preciosPVC,
    required this.description,
    required this.detalles,
    required this.category,
    required this.image,
    required this.profundidades,
  });
}

class TabBarMenuButton {
  final int id;
  final String name;

  TabBarMenuButton({required this.id, required this.name});
}