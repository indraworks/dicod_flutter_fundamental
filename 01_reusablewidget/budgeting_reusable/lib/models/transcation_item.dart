//buat class dulu
class TransactionItem {
  final String title;
  final String subtitle;
  final String image;
  final String money;

  //construvtor
  const TransactionItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.money,
  });
}

//impkement isntanciate dgb masukan data di constructoernya
//dan buat sbgai aray list
const List<TransactionItem> transactionItemList = [
  TransactionItem(
    title: 'Burger Stand ',
    subtitle: 'Tue.July 4th,3:42pm',
    image: 'https://loremflickr.com/1280/720/food',
    money: '\$8.20',
  ),
  TransactionItem(
    title: 'Veggie Opulus ',
    subtitle: 'Tue.July 7th,3:42pm',
    image: 'https://loremflickr.com/1280/720/food',
    money: '\$8.20',
  ),
  TransactionItem(
    title: 'Ayam Bakar ',
    subtitle: 'Tue.July 4th,3:42pm',
    image: 'https://loremflickr.com/1280/720/food',
    money: '\$7.20',
  ),
  TransactionItem(
    title: 'Resoles ',
    subtitle: 'Mon.July 15th,12:45pm',
    image: 'https://loremflickr.com/1280/720/food',
    money: '\$11.20',
  ),
];
