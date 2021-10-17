part of '../pages.dart';

class DetailMenuPage extends StatefulWidget {
  Menu _data;

  DetailMenuPage(this._data);

  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {

  late int _initQuantity;
  late String _initNotes;

  @override
  void initState() {
    _initQuantity = widget._data.quantity;
    _initNotes = widget._data.notes.text;
    super.initState();
  }

  @override
  void dispose() {
    if (!_menu.isUpdate) {
      _menu.quantity = 0;
      _menu.notes = TextEditingController();
    }
    if (_menu.quantity == 0) _menu.quantity = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrayColor,
      appBar: AppBar(
        title: Text(
          _menu.name,
          style: appbarTextStyle,
        ),
        leading: Consumer<CartProvider>(
          builder: (context, cart, _) => IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: blackColor,
            ),
            onPressed: () {
              if (_menu.isUpdate) {
                widget._data.quantity = _initQuantity;
                widget._data.notes.text = _initNotes;
              }
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Image.network(
                _menu.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _menu.name,
                          style: detailMenuStyle,
                        ),
                        SizedBox(height: 6),
                        Text(
                          _menu.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Manrope',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 18),
                  Text(
                    currency(_menu.price),
                    style: detailMenuStyle,
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultMargin / 2),
            Container(
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
                    controller: _menu.notes,
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
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(defaultMargin),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(color: darkGrayColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if ((_menu.isUpdate && _menu.quantity > 0)) ...[
                    decrementButton
                  ] else if (!_menu.isUpdate && _menu.quantity > 1) ...[
                    decrementButton
                  ] else ...[
                    disableDecrementButton
                  ],
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      _menu.quantity.toString(),
                      style: quantityStyle,
                    ),
                  ),
                  Container(
                    width: 39,
                    height: 39,
                    child: ElevatedButton(
                      onPressed: incrementMenuItem,
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 39,
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
              child: Consumer<CartProvider>(
                builder: (context, cart, _) {
                  return (_menu.isUpdate && _menu.quantity == 0)
                      ? ElevatedButton(
                          onPressed: () {
                            _menu.isUpdate = false;
                            cart.deleteItem(_menu.id);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Hapus Pesanan',
                            style: deleteStyle,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            primary: redColor,
                          ),
                        )
                      : (_menu.isUpdate)
                          ? ElevatedButton(
                              onPressed: () {
                                cart.updateItem(_menu.id, widget._data);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Tambahkan ke Keranjang - ' + currency(pricing),
                                style: cartStyle,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                widget._data.isUpdate = true;
                                _menu.isUpdate = true;
                                cart.addItem(widget._data);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Tambahkan ke Keranjang - ' + currency(pricing),
                                style: cartStyle,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(16),
                              ),
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get disableDecrementButton {
    return Container(
      width: 39,
      height: 39,
      child: ElevatedButton(
        onPressed: null,
        child: Icon(
          Icons.remove_rounded,
          color: Colors.white,
          size: 39,
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          primary: lightGrayColor,
        ),
      ),
    );
  }

  Widget get decrementButton {
    return Container(
      width: 39,
      height: 39,
      child: ElevatedButton(
        onPressed: decrementMenuItem,
        child: Icon(
          Icons.remove_rounded,
          color: Colors.white,
          size: 39,
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }

  Menu get _menu => widget._data;

  int get pricing => _menu.quantity * _menu.price;

  void incrementMenuItem() => setState(() => widget._data.quantity += 1);

  void decrementMenuItem() {
    setState(() {
      if (widget._data.quantity != 0) widget._data.quantity -= 1;
    });
  }
}
