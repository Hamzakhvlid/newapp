import 'package:clickablesvg/screens/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

class WebSearchBar extends ConsumerStatefulWidget {
  WebSearchBar({Key? key}) : super(key: key);

  @override
  ConsumerState<WebSearchBar> createState() => _WebSearchBarState();
}

class _WebSearchBarState extends ConsumerState<WebSearchBar> {
  var text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * .05
          : MediaQuery.of(context).size.height * .10,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width > 800
                  ? MediaQuery.of(context).size.width * .15
                  : MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * .05
                  : MediaQuery.of(context).size.height * .10,
              child: TextFormField(
                controller: ref.watch(textControlller),
                onChanged: (value) {
                  ref.read(isSearch.notifier).update((state) => true);

                  ref.read(searchList.notifier).update((state) => labels.keys
                      .toList()
                      .where((element) =>
                          element.toLowerCase().contains(value.toLowerCase()))
                      .toList());
                },
                onEditingComplete: () {
                  ref.read(isSearch.notifier).update((state) => false);
                  ref.read(textControlller).clear();

                  FocusScopeNode currentfocus = FocusScope.of(context);
                  if (!currentfocus.hasPrimaryFocus) {
                    //prevent Flutter from throwing an exception
                    currentfocus
                        .unfocus(); //unfocust from current focust, so that keyboard will dismiss
                  }
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    focusColor: Colors.green,
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 233, 233),
                    hintText: "Serach ",
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
              )),
          IconButton(
              onPressed: (() {
                if (ref.read(savedLocale) == 'en') {
                  ref.read(savedLocale.notifier).update((state) => 'en');
                  context.locale;
                } else {
                  ref.read(savedLocale.notifier).update((state) => 'ar');
                }
              }),
              icon: Icon(
                Icons.translate,
                size: 30,
              ))
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: Color.fromARGB(255, 255, 255, 255)))),
    );
  }
}
