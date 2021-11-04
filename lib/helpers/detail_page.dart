part of 'helpers.dart';

class DetailPageHelper {
  BuildContext _context;

  DetailPageHelper(this._context);

  void navigate({required Menu menu, required PageEnum previousPage}) {
    final provider = Provider.of<DetailPageProvider>(_context, listen: false);
    provider.init(menu: menu, previousPage: previousPage, context: _context);
  }
}
