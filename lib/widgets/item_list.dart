import 'package:clickablesvg/data_provider.dart';
import 'package:clickablesvg/widgets/item_tile.dart';
import 'package:clickablesvg/widgets/mobile_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemList extends ConsumerStatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  ConsumerState<ItemList> createState() => _ItemListState();
}

class _ItemListState extends ConsumerState<ItemList> {
  @override
  Widget build(BuildContext context) {
    var title = ref.watch(isSearch) ? ref.watch(searchList) : floors;

    

    return title.isEmpty
        ? Center(child: Text("No items found"))
        : ListView.builder(
            scrollDirection: MediaQuery.of(context).size.width > 800
                ? Axis.vertical
                : Axis.horizontal,
            itemCount: title.length,
            itemBuilder: ((context, index) =>
                MediaQuery.of(context).size.width > 800
                    ? ItemTile(
                        key: UniqueKey(),
                        title: title[index],
                        icon: Icon(
                          Icons.layers,
                          color: labels[title[index]] ??
                              Color.fromARGB(255, 173, 173, 173),
                        ))
                    : MobileBar(
                       key: UniqueKey(),
                        title: title[index],
                        color: labels[title[index]] ??
                            Color.fromARGB(255, 205, 205, 205))));
  }
}
