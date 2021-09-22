part of '../pages.dart';

class BottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 39,
                height: 39,
                child: ElevatedButton(
                  child: Text('-'),
                  onPressed: () {},
                ),
              ),
              Text('2'),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 39,
                height: 39,
                child: ElevatedButton(
                  child: Text('+'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text('Tambahkan ke Keranjang'),
            ),
          ),
        ),
      ],
    );
  }
}
