part of 'helpers.dart';

class DetailPageHelper {
  BuildContext _context;

  DetailPageHelper(this._context);

  void navigate({required Menu menu, required PageEnum previousPage}) {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (_) => DetailPageProvider(
            menu: menu,
            previousPage: previousPage,
            context: _context,
          ),
          child: DetailMenuPage(),
        ),
      ),
    );
  }
}
