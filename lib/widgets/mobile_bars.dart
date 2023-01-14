import 'package:bot_toast/bot_toast.dart';
import 'package:clickablesvg/screens/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

class MobileBar extends ConsumerWidget {
  String title;
  var color;
 
  MobileBar({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  

    return Container(
      width: ref.watch(isSearch)
          ? MediaQuery.of(context).size.width * .80
          : MediaQuery.of(context).size.width * .30,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 15),
      decoration: BoxDecoration(
        color: color != Color.fromARGB(255, 205, 205, 205)
            ? color
            : ref.watch(currentImage) == this.title.split('-').first
                ? Colors.black
                : color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: (() {

       var  offsetdata= MediaQuery.of(context).orientation==Orientation.portrait?mobilePortraitOffset:mobilelandScapeOffset;
           
          ref.read(textControlller).clear();
          FocusScopeNode currentfocus = FocusScope.of(context);
          if (!currentfocus.hasPrimaryFocus) {
            //prevent Flutter from throwing an exception
            currentfocus.unfocus();
          }
          ref
              .read(currentImage.notifier)
              .update((state) => title.split('-').first);
          ref.read(isSearch.notifier).update((state) => false);
          ref
              .read(imageProvider.notifier)
              .update((state) => "assets/${title.split('-').first}.png");
          ref
              .read(colorMap.notifier)
              .update((state) => imagesLabel[title.split('-').first]!);

              

          Future.delayed(Duration(milliseconds: 1300)).then((value) {
            BotToast.showAttachedWidget(
                attachedBuilder: (_) => Card(
                      color: labels[title],
                      key: UniqueKey(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(title.split('-').last).tr(),
                      ),
                    ),
                duration: Duration(seconds: 10),
                target:  offsetdata[title]);
          });
        }),
        child: Center(
          child: Text(
            title.split('-').last,
            style: TextStyle(
                color: ref.watch(currentImage) == this.title.split('-').first
                    ? Colors.white
                    : Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
