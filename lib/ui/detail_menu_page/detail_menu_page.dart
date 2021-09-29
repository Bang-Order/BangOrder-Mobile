part of '../pages.dart';

class DetailMenuPage extends StatefulWidget {
  Menu _data;

  DetailMenuPage(this._data);

  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {
  @override
  void dispose() {
    if (!widget._data.isUpdate) {
      widget._data.quantity = 0;
      widget._data.textEditingController = TextEditingController();
    }
    if (widget._data.quantity == 0) widget._data.quantity = 1;
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
                  // Text(widget._data.price.toString(), style: detailMenuStyle),
                  Text(convertToCurrency(widget._data.price),
                      style: detailMenuStyle),
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
                    controller: widget._data.textEditingController,
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
                  if (widget._data.isUpdate && widget._data.quantity > 0) ...[
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
                  ] else if (!widget._data.isUpdate &&
                      widget._data.quantity > 1) ...[
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
                      widget._data.quantity.toString(),
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
                  return (widget._data.isUpdate && widget._data.quantity == 0)
                      ? ElevatedButton(
                          onPressed: () {
                            widget._data.isUpdate = false;
                            cart.deleteItem(widget._data.id);
                            Navigator.pop(context);
                          },
                          child: Text('Hapus Pesanan', style: deleteStyle),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            primary: redColor,
                          ),
                        )
                      : (widget._data.isUpdate)
                          ? ElevatedButton(
                              onPressed: () {
                                cart.updateItem(
                                  widget._data.id,
                                  new Cart(
                                      menuId: widget._data.id,
                                      quantity: widget._data.quantity,
                                      notes: widget._data.textEditingController,
                                      price: widget._data.price),
                                );
                                Navigator.pop(context);
                              },
                              child: Text(
                                  'Tambahkan ke Keranjang - ' +
                                      convertToCurrency(widget._data.quantity *
                                          widget._data.price),
                                  style: cartStyle),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                widget._data.isUpdate = true;
                                cart.addItem(new Cart(
                                    menuId: widget._data.id,
                                    price: widget._data.price,
                                    quantity: widget._data.quantity,
                                    notes: widget._data.textEditingController));
                                Navigator.pop(context);
                              },
                              child: Text(
                                  'Tambahkan ke Keranjang - ' +
                                      convertToCurrency(widget._data.quantity *
                                          widget._data.price),
                                  style: cartStyle),
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

  void incrementMenuItem() => setState(() => widget._data.quantity += 1);

  void decrementMenuItem() => setState(() {
        if (widget._data.quantity != 0) widget._data.quantity -= 1;
      });
}
