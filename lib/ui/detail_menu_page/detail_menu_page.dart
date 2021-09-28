part of '../pages.dart';

class DetailMenuPage extends StatefulWidget {
  Menu _data;

  DetailMenuPage(this._data);

  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {
  TextEditingController _notes = TextEditingController();
  var _quantity = 1;
  bool _isUpdate = false;
  Cart _cart = Cart(notes: TextEditingController(), quantity: 0, menuId: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      CartProvider cart = Provider.of<CartProvider>(context, listen: false);
      cart.item.forEach((element) {
        if (element.menuId == widget._data.id) {
          setState(() {
            _isUpdate = true;
            _cart = element;
          });
          return;
        }
      });
    });
  }

  @override
  void dispose() {
    if (_cart.quantity == 0) _cart.quantity = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrayColor,
      appBar: AppBar(
        title: Text(widget._data.name, style: appbarTextStyle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: blackColor),
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
                widget._data.image,
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
                        Text(widget._data.name, style: detailMenuStyle),
                        SizedBox(height: 6),
                        Text(
                          widget._data.description,
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
                  Text(widget._data.price.toString(), style: detailMenuStyle),
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
                      Text('Optional')
                    ],
                  ),
                  SizedBox(height: defaultMargin),
                  TextField(
                    controller: (_isUpdate) ? _cart.notes : _notes,
                    maxLines: 3,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 7),
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
                  if (_isUpdate && _cart.quantity > 0) ...[
                    Container(
                      width: 39,
                      height: 39,
                      child: ElevatedButton(
                        onPressed: decrementCartItem,
                        child: Icon(
                          Icons.remove_rounded,
                          color: Colors.white,
                          size: 39,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                    )
                  ] else if (!_isUpdate && _quantity > 1) ...[
                    Container(
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
                    )
                  ] else ...[
                    Container(
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
                    )
                  ],
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      (_isUpdate)
                          ? _cart.quantity.toString()
                          : _quantity.toString(),
                      style: quantityStyle,
                    ),
                  ),
                  Container(
                    width: 39,
                    height: 39,
                    child: ElevatedButton(
                      onPressed:
                          (_isUpdate) ? incrementCartItem : incrementMenuItem,
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
                  return (_isUpdate && _cart.quantity > 1)
                      ? ElevatedButton(
                          onPressed: () {
                            cart.item.forEach((element) {
                              if (element.menuId == widget._data.id) {
                                element = _cart;
                                return;
                              }
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Tambahkan ke Keranjang - ' +
                                (_cart.quantity * widget._data.price)
                                    .toString(),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                          ),
                        )
                      : (_isUpdate && _cart.quantity == 0)
                          ? ElevatedButton(
                              onPressed: () {
                                cart.item.remove(_cart);
                                Navigator.pop(context);
                              },
                              child: Text('Hapus Pesanan', style: deleteStyle),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12),
                                primary: redColor,
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                cart.item.add(new Cart(
                                  menuId: widget._data.id,
                                  quantity: _quantity,
                                  notes: _notes,
                                ));
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Tambahkan ke Keranjang - ' +
                                    (_quantity * widget._data.price).toString(),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12),
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

  void incrementMenuItem() => setState(() => _quantity += 1);

  void incrementCartItem() => setState(() => _cart.quantity += 1);

  void decrementMenuItem() => setState(() {
        if (_quantity != 0) _quantity -= 1;
      });

  void decrementCartItem() => setState(() {
        if (_cart.quantity != 0) _cart.quantity -= 1;
      });
}
