class Slide {
  final String imageUrl;
  final String title;
  final String desc;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.desc,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/img1.png',
    title: 'MyBengkel',
    desc: ' ',
  ),
  Slide(
      imageUrl: 'assets/images/img2.png',
      title: 'Atur Jadwalmu!',
      desc: 'MyBengkel punya fitur booking service'),
  Slide(
    imageUrl: 'assets/images/img3.png',
    title: 'Bayar Mudah!',
    desc: 'MyBengkel punya fitur sistem COD',
  ),
  Slide(
      imageUrl: 'assets/images/img4.png',
      title: 'Di Rumah Aja!',
      desc: 'MyBengkel punya fitur pesan antar'),
];
