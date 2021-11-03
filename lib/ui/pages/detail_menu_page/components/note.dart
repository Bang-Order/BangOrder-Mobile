part of '../../../pages/pages.dart';

class DetailMenuNote extends StatelessWidget {
  const DetailMenuNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailPageProvider>(
      builder: (context, provider, _) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Row(
              children: [
                Text('Note', style: detailMenuStyle),
                SizedBox(width: 13),
                Text('Optional'),
              ],
            ),
            SizedBox(height: defaultMargin),
            TextField(
              controller: provider.menu.notes,
              maxLines: 3,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 7,
                ),
                hintText: 'Eg. Extra pedas pls',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffDADDDF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
