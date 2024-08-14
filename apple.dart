class Apple {
  String descricao;
  double valor;
  String foto;

  Apple({required this.descricao, required this.valor, required this.foto});
}

List<Apple> apples = [
  Apple(
      descricao: "iPhone 14 Plus (128 GB) - Estelar",
      valor: 4204,
      foto:
          "https://m.media-amazon.com/images/I/51KldkPKmRL._AC_SX679_.jpg"),
  Apple(
      descricao: "iPhone 14 (256 GB) – Azul",
      valor: 4599,
      foto:
          "https://m.media-amazon.com/images/I/41FePl+WhJL._AC_SX679_.jpg"),
  Apple(
      descricao: " iPhone 15 (128 GB) — Preto",
      valor: 4749,
      foto:
          "https://m.media-amazon.com/images/I/416MG51rNgL._AC_SX679_.jpg"),
  Apple(
      descricao: "iPhone 15 Pro Max (1 TB) — Titânio Azul",
      valor: 12599,
      foto:
          "https://m.media-amazon.com/images/I/81fO2C9cYjL._AC_SX679_.jpg"),
  Apple(
      descricao: "iPhone 13 (128 GB) - Meia-noite",
      valor: 3509,
      foto:
          "https://m.media-amazon.com/images/I/41rfDU6FGqL._AC_SX679_.jpg"),
  Apple(
      descricao: "iPhone 11 (64 GB) Preto",
      valor: 2789,
      foto:
          "https://m.media-amazon.com/images/I/71iO2R+CLjL._AC_SX679_.jpg"),
];

List<Apple> consulta = [];