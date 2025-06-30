class RequestItem {
  final String title;
  final String image;
  final String money;

  const RequestItem({
    required this.title,
    required this.image,
    required this.money,
  });
}

//instance sbgai Array atau list
const List<RequestItem> requestItemList = [
  //instance masukan nilai lewwat constructor
  RequestItem(
    title: 'Received FUnd',
    image: 'https://loremflickr.com/1280/720',
    money: '\$50.00',
  ),
  RequestItem(
    title: 'Pay Now',
    image: 'https://loremflickr.com/1280/720',
    money: '\$134.00',
  ),
  RequestItem(
    title: 'Received FUnd',
    image: 'https://loremflickr.com/1280/720',
    money: '\$167.00',
  ),
];
