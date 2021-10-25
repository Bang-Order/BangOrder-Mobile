part of 'utils.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    try {
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
      ];
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Widget? buildLeading(BuildContext context) {
    try {
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, '');
        },
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Menu> keyword =
        Provider.of<MenuServiceProvider>(context, listen: false).data;
    List<Menu> suggestionList = query.isEmpty
        ? []
        : keyword
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    try {
      return ListView.builder(
        shrinkWrap: true,
        controller: ScrollController(),
        itemCount: suggestionList.length,
        itemBuilder: (context, i) => SPSearchItemCard(suggestionList[i]),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
