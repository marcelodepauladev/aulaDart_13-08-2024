class Android {
  String descricao;
  double valor;
  String foto;

  Android({required this.descricao, required this.valor, required this.foto});
}

List<Android> androids = [
  Android(
      descricao: "Redmi Note 13",
      valor: 1151,
      foto:
          "https://m.media-amazon.com/images/I/51jPglxBSfL._AC_SX522_.jpg"),
  Android(
      descricao: "Moto G24",
      valor: 699,
      foto:
          "https://m.media-amazon.com/images/I/41T21N2vArL._AC_SX522_.jpg"),
  Android(
      descricao: "POCO X6 Pro",
      valor: 2227,
      foto:
          "https://m.media-amazon.com/images/I/61jhAdvYcyL._AC_SX679_.jpg"),
  Android(
      descricao: "Moto G84 5G",
      valor: 1349,
      foto:
          "https://m.media-amazon.com/images/I/51vjQLRYFzL._AC_SX569_.jpg"),
  Android(
      descricao: "Edge 40 Neo",
      valor: 1709,
      foto:
          "https://m.media-amazon.com/images/I/51rB2U+NQIL._AC_SX679_.jpg"),
  Android(
      descricao: "Galaxy A15",
      valor: 969,
      foto:
          "https://m.media-amazon.com/images/I/61FHAZ4A6TL._AC_SX569_.jpg"),
];

List<Android> consulta = [];