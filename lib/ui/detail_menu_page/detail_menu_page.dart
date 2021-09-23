part of '../pages.dart';

class DetailMenuPage extends StatelessWidget {
  Menu data;

  DetailMenuPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Image.network(
                data.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name, style: detailMenuStyle),
                        SizedBox(height: 6),
                        Text(
                          data.description,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Manrope',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 18),
                  Text(data.price.toString(), style: detailMenuStyle),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Note', style: detailMenuStyle),
                      SizedBox(width: 13),
                      Text('Optional')
                    ],
                  ),
                  SizedBox(height: 6),
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                      hintText: 'Tambah Sambel Please',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffDADDDF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(defaultMargin),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                border: Border.all(color: darkGrayColor),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 39,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.remove_rounded,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                    ),
                  ),
                ),
                Text('1'),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 39,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(12)),
              onPressed: () {},
              child: Text('Tambahkan ke Keranjang'),
            ),
          ),
        ],
      ),
    );
  }
}
